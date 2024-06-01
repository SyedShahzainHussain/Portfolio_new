import 'package:flutter/material.dart';
import 'package:portfolio/utils/extension/general_extension.dart';
import 'package:portfolio/view/responsive.dart';

import 'widget/contact_form_widget.dart';
import 'widget/contact_sub_title_widget.dart';
import 'widget/contact_submmit_button_widget.dart';
import 'widget/contact_title_widget.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    elevation: 7,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ContactTitle(),
                          10.height,
                          const ContactSubTitleWidget(),
                          10.height,
                          const ContactForm(),
                          20.height,
                          const ContactButton()
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
    );
  }
}
