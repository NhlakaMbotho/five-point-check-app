import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constants/colors.dart';

mixin BaseMixin<T extends Widget> {
  Widget get appLoader {
    return Center(
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: AppColors.Dark,
        rightDotColor: AppColors.Primary,
        size: 140,
      ),
    );
  }

  void showError(String? message, context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Authentication Error'),
        content: Text(message ?? 'Error'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
