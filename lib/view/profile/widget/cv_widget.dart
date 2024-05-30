import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/bloc/download_file_bloc/download_file_bloc.dart';
import 'package:portfolio/config/color/colors.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:portfolio/utils/extension/flushbar_extension.dart';
import '../../../utils/constant.dart';

class CV extends StatefulWidget {
  const CV({
    super.key,
  });

  @override
  State<CV> createState() => _CVState();
}

class _CVState extends State<CV> {
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
                context.flushBarSuccessMessage(
                    message: "Cv Downloaded Successfully");
              } else if (state.postApiStatus == PostApiStatus.error) {
                context.flushBarErrorMessage(
                    message: "Error Occured While Downloading");
              }
            },
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(AppColors.bgColor),
              ),
              onPressed: () async {
                context.read<DownlaodFileBloc>().add(SaveFileEvent(
                    fileName: "Bank.pdf",
                    url:
                        "https://firebasestorage.googleapis.com/v0/b/fir-b1e27.appspot.com/o/FullStmt_1713612188885_4230166016747_HassanHussain1.pdf?alt=media&token=7d1c1aef-230c-402b-a59a-7121c36272ca"));
              },
              child: FittedBox(
                child: BlocBuilder<DownlaodFileBloc, DownloadFileState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Text(
                          "DOWNLOAD CV",
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ),
                        const SizedBox(width: defaultPadding / 2),
                        state.isLoading
                            ? const SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ))
                            : SvgPicture.asset("assets/icon/download.svg")
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
