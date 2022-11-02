import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';

class AppInputDecoration extends InputDecoration {
  AppInputDecoration(String label, AppStyleTypes styleType)
      : super(
            labelText: label,
            filled: true,
            fillColor: (styleType == AppStyleTypes.PRIMARY
                    ? AppColors.Primary
                    : AppColors.Dark)
                .withOpacity(.05),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            labelStyle: TextStyle(
              color: styleType == AppStyleTypes.PRIMARY
                  ? AppColors.Primary
                  : AppColors.Dark.withOpacity(.4),
            )) {
    print('style type: $styleType}');
  }
}

class AppTextFormField extends TextFormField {
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
    AppStyleTypes styleType = AppStyleTypes.PRIMARY,
    TextAlign textAlign: TextAlign.start,
  }) : super(
          key: key,
          onChanged: onChanged,
          initialValue: initialValue,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          onSaved: onSaved,
          textAlign: textAlign,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: AppInputDecoration(label, styleType),
          style: TextStyle(
            color: (styleType == AppStyleTypes.PRIMARY
                ? AppColors.Primary
                : AppColors.Dark),
            fontWeight: FontWeight.w400,
          ),
        );
}
