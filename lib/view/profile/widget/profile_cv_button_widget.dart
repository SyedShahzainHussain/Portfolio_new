import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/utils/extension/flushbar_extension.dart';

import '../../../bloc/download_file_bloc/download_file_bloc.dart';

import '../../../config/components/loader_widget.dart';
import '../../../utils/enums.dart';

class CvButtonWidget extends StatefulWidget {
  const CvButtonWidget({
    super.key,
  });

  @override
  State<CvButtonWidget> createState() => _CvButtonWidgetState();
}

class _CvButtonWidgetState extends State<CvButtonWidget> {
  late DownlaodFileBloc downlaodFileBloc;

  @override
  void initState() {
    super.initState();
    downlaodFileBloc = DownlaodFileBloc();
  }

  @override
  void dispose() {
    super.dispose();
    downlaodFileBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => downlaodFileBloc,
      child: BlocBuilder<DownlaodFileBloc, DownloadFileState>(
        builder: (context, state) {
          return BlocListener<DownlaodFileBloc, DownloadFileState>(
            listener: (context, state) {
              if (state.postApiStatus == PostApiStatus.success) {
                context.flushBarSuccessMessage(message: state.message);
              } else if (state.postApiStatus == PostApiStatus.error) {
                context.flushBarErrorMessage(message: state.message);
              }
            },
            child: OutlinedButton(
              onPressed: () {
                context.read<DownlaodFileBloc>().add(SaveFileEvent(
                    fileName: "Bank.pdf",
                    url:
                        "https://firebasestorage.googleapis.com/v0/b/fir-b1e27.appspot.com/o/FullStmt_1713612188885_4230166016747_HassanHussain1.pdf?alt=media&token=7d1c1aef-230c-402b-a59a-7121c36272ca"));
              },
              child: state.isLoading
                  ? const LoaderWidget()
                  : const Text("Download Resume"),
            ),
          );
        },
      ),
    );
  }
}
