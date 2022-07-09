import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';

class AppInputDecoration extends InputDecoration {
  AppInputDecoration(String label)
      : super(
            labelText: label,
            filled: true,
            fillColor: AppColors.Primary.withOpacity(.05),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            labelStyle: TextStyle(
              color: AppColors.Primary.withOpacity(.4),
            ));
}

class AppTextFormField extends TextFormField {
  var controller;
  AppTextFormField({
    required String label,
    Key? key,
    String? initialValue,
    ValueChanged<String>? onChanged,
    TextInputAction? textInputAction,
    bool obscureText = false,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
  }) : super(
          key: key,
          onChanged: onChanged,
          initialValue: initialValue,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: AppInputDecoration(label),
          style: TextStyle(
            color: AppColors.Primary,
            fontWeight: FontWeight.w400,
          ),
        );
}
