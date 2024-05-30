part of 'download_file_bloc.dart';

sealed class DownloadFileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SaveFileEvent extends DownloadFileEvent {
  final String url;
  final String fileName;
  SaveFileEvent({required this.fileName, required this.url});
}
