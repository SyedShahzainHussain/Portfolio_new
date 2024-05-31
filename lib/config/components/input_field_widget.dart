// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../color/colors.dart';

class InputFieldWidget extends StatelessWidget {
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String title;
  int maxLines;
  InputFieldWidget({
    super.key,
    required this.validator,
    required this.title,
    required this.onChanged,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      
      onChanged: onChanged,
      validator: validator,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
