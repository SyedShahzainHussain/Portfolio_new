import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:portfolio/utils/enums.dart';
import "package:universal_html/html.dart" as html;
import 'package:path_provider/path_provider.dart';

import '../../utils/connectivity_helper.dart';

part 'download_file_state.dart';
part 'download_file_event.dart';

class DownlaodFileBloc extends Bloc<DownloadFileEvent, DownloadFileState> {
  DownlaodFileBloc() : super(const DownloadFileState()) {
    on<SaveFileEvent>(_saveFile);
  }
  Future<void> _saveFile(
      SaveFileEvent event, Emitter<DownloadFileState> emit) async {
    if (kIsWeb) {
      emit(state.copyWith(
          isLoading: true, postApiStatus: PostApiStatus.initial));
      try {
        final isConnected = await ConnectivityHelper().isConnected();
        if (isConnected) {
          html.AnchorElement(href: event.url)
            ..setAttribute("download", event.fileName)
            ..setAttribute("target", "_blank")
            ..click();
          emit(state.copyWith(
              isLoading: false,
              postApiStatus: PostApiStatus.success,
              message: "Cv Download Successfully"));
        } else {
          emit(state.copyWith(
              isLoading: false,
              postApiStatus: PostApiStatus.error,
              message: "No Internet Connection"));
        }
      } catch (e) {
        emit(state.copyWith(
            isLoading: false,
            postApiStatus: PostApiStatus.error,
            message: "Error Occured While Downloading"));
      }
    } else {
      Directory? directory;
      if (await _checkAuthentication(Permission.storage)) {
        try {
          emit(state.copyWith(
              isLoading: true, postApiStatus: PostApiStatus.initial));
          final isConnected = await ConnectivityHelper().isConnected();
          if (!isConnected) {
            emit(state.copyWith(
                isLoading: false,
                postApiStatus: PostApiStatus.error,
                message: "No Internet Connection"));
          } else {
            directory = await getExternalStorageDirectory();
            String newPath = "";
            final List<String> path = directory!.path.split("/");
            for (var i = 1; i < path.length; i++) {
              final folder = path[i];
              if (folder != "Android") {
                newPath += "/$folder";
              } else {
                break;
              }
            }

            newPath = "$newPath/Download";
            directory = Directory(newPath);
            if (!await directory.exists()) {
              await directory.create(recursive: true);
            }

            File saveFile = File("${directory.path}/${event.fileName}");

            await Dio().download(
              event.url,
              saveFile.path,
            );
            emit(state.copyWith(
                isLoading: false,
                postApiStatus: PostApiStatus.success,
                message: "Cv Download Successfully"));
          }
        } catch (e) {
          emit(state.copyWith(
              isLoading: false,
              postApiStatus: PostApiStatus.error,
              message: "Error Occured While Downloading"));
        }
      }
    }
  }

  Future<bool> _checkAuthentication(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      final request = await permission.request();
      if (request == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }
}
