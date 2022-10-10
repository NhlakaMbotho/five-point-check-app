import 'dart:html';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MainAppBar(String title) : title = title;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return new SizedBox.fromSize(
      size: preferredSize,
      child: new LayoutBuilder(builder: (context, constraint) {
        return Container(
          child: Center(
              child: Text(
            title,
            style: TextStyle(fontSize: 18),
          )),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
        );
      }),
    );
  }
}
