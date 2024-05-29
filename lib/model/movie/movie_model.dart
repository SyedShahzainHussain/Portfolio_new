// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  factory MovieModel({
    @Default("") String total,
    @Default(1) int page,
    @Default(0) int pages,
    @Default([]) @JsonKey(name: "tv_shows") List<TvShows> tvShow,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}

@freezed
class TvShows with _$TvShows {
  factory TvShows({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "name") @Default("") String name,
    @JsonKey(name: "permalink") @Default("") String permalink,
    @JsonKey(name: "start_date") @Default("") String startDate,
    @JsonKey(name: "end_date") @Default("") String endDate,
    @JsonKey(name: "country") @Default("") String country,
    @JsonKey(name: "network") @Default("") String network,
    @JsonKey(name: "status") @Default("") String status,
    @JsonKey(name: "image_thumbnail_path")
    @Default("")
    String imageThumbnailPath,
  }) = _TvShows;

  factory TvShows.fromJson(Map<String, dynamic> json) =>
      _$TvShowsFromJson(json);
}
