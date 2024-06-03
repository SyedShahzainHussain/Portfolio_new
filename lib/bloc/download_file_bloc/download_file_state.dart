part of 'download_file_bloc.dart';

class DownloadFileState extends Equatable {
  final bool isLoading;
  final PostApiStatus postApiStatus;
  final String message;
  const DownloadFileState(
      {this.isLoading = false, this.postApiStatus = PostApiStatus.initial,this.message='',});

  DownloadFileState copyWith({bool? isLoading, PostApiStatus? postApiStatus,String? message}) {
    return DownloadFileState(
        isLoading: isLoading ?? this.isLoading,
        postApiStatus: postApiStatus ?? this.postApiStatus,message: message??this.message,);
  }

  @override
  List<Object?> get props => [isLoading, postApiStatus,message];
}
