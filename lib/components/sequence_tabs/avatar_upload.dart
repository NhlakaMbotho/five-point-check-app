import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AvatarUploader extends StatefulWidget {
  const AvatarUploader({Key? key}) : super(key: key);

  @override
  State<AvatarUploader> createState() => _AvatarState();
}

class _AvatarState extends State<AvatarUploader> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Container(
            width: constraints.maxWidth * .3,
            height: constraints.maxWidth * .2,
            decoration: BoxDecoration(
              color: AppColors.GreyDark.withOpacity(.20),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.add,
                    size: 60,
                    color: AppColors.Dark.withOpacity(.4),
                  ),
                ),
                Center(
                  child: Text(
                    'Upload avatar',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.Dark.withOpacity(.4),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
