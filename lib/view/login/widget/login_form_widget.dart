import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/login/login_bloc.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:portfolio/utils/extension/flushbar_extension.dart';
import 'package:portfolio/utils/extension/general_extension.dart';
import 'package:portfolio/view/login/widget/login_button_widget.dart';
import 'package:rive/rive.dart';

import '../../../config/components/input_field_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String animationUrl;

  // controllers
  StateMachineController? stateMachineController;

  // properties
  Artboard? _teddeyArtBoard;
  SMIBool? isChecking, isHandsUp;
  SMINumber? numLook;
  SMITrigger? trigSuccess, trigFail;
  bool isObesecure = true;

  // key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    animationUrl = "assets/images/animated_login_character.riv";

    loadTeddy();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_teddeyArtBoard != null)
            SizedBox(
              height: 300,
              child: Rive(
                artboard: _teddeyArtBoard!,
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              ),
            ),
          InputFieldWidget(
            validator: (value) {
              if (value!.isEmpty || !value.contains("@")) {
                return "Invalid Email Address";
              }
              return null;
            },
            title: "Email",
            onChanged: (value) {
              if (value.isEmpty) {
                clearTeddyAnimation();
              } else {
                lookOnTheTextFieldAnMove(value);
                BlocProvider.of<LoginBloc>(context).add(EmailChange(value));
              }
            },
          ),
          10.height,
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return InputFieldWidget(
                isObesecure: state.isObsecure,
                suffixIcon: IconButton(
                    onPressed: () {
                      context
                          .read<LoginBloc>()
                          .add(const PasswordVisibleOrNot());
                      handsOnTheEyes(state.isObsecure);
                    },
                    icon: Icon(
                      state.isObsecure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Invalid Password";
                  }
                  return null;
                },
                title: "Password",
                onChanged: (value) {
                  if (value.isEmpty) {
                    clearTeddyAnimation();
                  } else {
                    lookOnTheTextFieldAnMove(value);
                    BlocProvider.of<LoginBloc>(context)
                        .add(PasswordChange(value));
                  }
                },
              );
            },
          ),
          10.height,
          BlocListener<LoginBloc, LoginState>(
            listenWhen: (previous, current) =>
                previous.postApiStatus != current.postApiStatus,
            listener: (context, state) {
              if (state.postApiStatus == PostApiStatus.error) {
                trigFail?.fire();
                context.flushBarErrorMessage(message: state.message);
              } else if (state.postApiStatus == PostApiStatus.success) {
                trigSuccess?.fire();
                context.flushBarSuccessMessage(message: "Login Successfully");
              }
            },
            child: LoginButtonWidget(
              formKey: _formKey,
              clearTeddyAnimation: clearTeddyAnimation,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadTeddy() async {
    await rootBundle.load(animationUrl).then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      stateMachineController =
          StateMachineController.fromArtboard(artboard, "Login Machine");
      if (stateMachineController == null) return;
      artboard.addController(stateMachineController!);
      for (var element in stateMachineController!.inputs) {
        if (element.name == "isChecking") {
          isChecking = element as SMIBool;
        } else if (element.name == "isHandsUp") {
          isHandsUp = element as SMIBool;
        } else if (element.name == "numLook") {
          numLook = element as SMINumber;
        } else if (element.name == "trigSuccess") {
          trigSuccess = element as SMITrigger;
        } else if (element.name == "trigFail") {
          trigFail = element as SMITrigger;
        }
      }
      setState(() {
        _teddeyArtBoard = artboard;
      });
    });
  }

  void lookOnTheTextFieldAnMove(String val) {
    isChecking?.change(true);
    numLook?.change(0);
    numLook?.change(val.length.toDouble());
  }

  void clearTeddyAnimation() {
    isChecking?.change(false);
    isHandsUp?.change(false);
  }

  void handsOnTheEyes(bool isObesecure) {
    isHandsUp?.change(isObesecure);
  }
}
