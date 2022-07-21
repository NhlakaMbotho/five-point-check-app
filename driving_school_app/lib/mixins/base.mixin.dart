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

  void showError(String title, String? message, context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700),
        title: Row(
          children: [
            Container(
              child: const Icon(
                Icons.dangerous_rounded,
                color: Color(0xFF63423F),
              ),
              margin: EdgeInsets.only(right: 10),
            ),
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF63423F),
              ),
            ),
          ],
        ),
        content: SizedBox(
          height: 40,
          width: 140,
          child: Center(
            child: Text(message ?? 'Error',
                style: TextStyle(
                  color: Color(0xFF63423F),
                )),
          ),
        ),
        backgroundColor: Color(0xFFFEF8FA),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text(
              'OK',
              style: TextStyle(
                color: Color(0xFF63423F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
