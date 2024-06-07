import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/contact_bloc/contact_bloc.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/utils/extension/general_extension.dart';
import 'package:portfolio/view/responsive.dart';
import 'widget/contact_form_widget.dart';
import 'widget/contact_sub_title_widget.dart';
import 'widget/contact_submmit_button_widget.dart';
import 'widget/contact_title_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late ContactBloc contactBloc;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    contactBloc = ContactBloc(contactApiRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => contactBloc,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                          ? context.mediaQueryWidth / 2
                          : null,
                      child: Material(
                        elevation: 9.0,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Form(
                            key: _form,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ContactTitle(),
                                10.height,
                                const ContactSubTitleWidget(),
                                10.height,
                                const ContactForm(),
                                20.height,
                                ContactButton(
                                  form: _form,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
