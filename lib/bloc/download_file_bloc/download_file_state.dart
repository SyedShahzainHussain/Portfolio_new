part of 'download_file_bloc.dart';

class DownloadFileState extends Equatable {
  final bool isLoading;
  final PostApiStatus postApiStatus;
  const DownloadFileState(
      {this.isLoading = false, this.postApiStatus = PostApiStatus.initial});

  DownloadFileState copyWith({bool? isLoading, PostApiStatus? postApiStatus}) {
    return DownloadFileState(
        isLoading: isLoading ?? this.isLoading,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object?> get props => [isLoading, postApiStatus];
}
