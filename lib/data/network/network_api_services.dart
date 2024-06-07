import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../exception/app_exception.dart';
import './base_api_services.dart';

/// Class for handling network API requests.
class NetworkApiService implements BaseApiServices {
  /// Sends a GET request to the specified [url] and returns the response.
  ///
  /// Throws a [NoInternetException] if there is no internet connection.
  /// Throws a [FetchDataException] if the network request times out.
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    } catch (e) {
      rethrow;
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  /// Sends a POST request to the specified [url] with the provided [data]
  /// and returns the response.
  ///
  /// Throws a [NoInternetException] if there is no internet connection.
  /// Throws a [FetchDataException] if the network request times out.
  @override
  Future<dynamic> postApi(String url, dynamic data,
      {Map<String, dynamic>? queryParams, Map<String, String>? headers}) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final queryParam = queryParams;
      final uri = Uri.parse(url);
      Uri? newUri;
      if (queryParam != null) {
        newUri = uri.replace(queryParameters: queryParam);
      }
      final Response response =
          await post(newUri ?? uri, body: data, headers: headers)
              .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    } catch (e) {
      rethrow;
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  /// Parses the [response] and returns the corresponding JSON data.
  ///
  /// Throws a [FetchDataException] with the appropriate error message if the response status code is not successful.
  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        _parseResponse(response);
      case 400:
      case 401:
      case 404:
      case 500:
        String errorMessage = "An unkown error occured";
        int? errorCode;
        try {
          dynamic responseJson = jsonDecode(response.body);
          if (responseJson is Map && responseJson.containsKey('error')) {
            errorMessage = responseJson['error']['message'];
            errorCode = responseJson['error']['code'];
          }
        } catch (e) {
          errorMessage = "An error occurred: ${response.body.toString()}";
        }
        switch (errorCode) {
          case 400:
            throw UnauthorisedException(errorMessage);
          case 404:
            throw BadRequestException(errorMessage);
          case 500:
            throw ServerException(errorMessage);
        }

      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }

  dynamic _parseResponse(http.Response response) {
    try {
      return jsonDecode(response.body);
    } catch (e) {
      return response.body;
    }
  }
}
