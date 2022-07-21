import 'dart:io';

import 'package:driving_school_app/components/progress_bar.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../mixins/base.mixin.dart';
import '../mixins/post-frame.mixin.dart';
import '../models/error.dart';
import '../models/user.dart';
import 'badge.dart';
import 'row_text.dart';

class ClientRow extends StatelessWidget {
  final User user;
  ClientRow(User user) : user = user;

  formatNumber(String number) {
    if (number.length == 10) {
      return '(${number.substring(0, 3)}) ${number.substring(3, 6)}-${number.substring(6, 10)}';
    }
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(6), // Border radius
              child: ClipOval(
                child: Image(
                  image: AssetImage("./images/user.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 2, child: RowText(user.firstName + '  ' + user.lastName)),
        Expanded(flex: 2, child: RowText(formatNumber(user.phoneNo))),
        Flexible(
            flex: 2,
            child: Center(child: ProgressBar(user.progressPercentage))),
        Expanded(
            flex: 2,
            child: Center(
                child: Badge(
              user.code.toString(),
              primary: true,
            ))),
        Expanded(
            flex: 2,
            child:
                Center(child: Badge(user.clientCompletedLessons.toString()))),
        Expanded(
            flex: 2,
            child:
                Center(child: Badge(user.clientRemainingLessons.toString()))),
      ],
    );
  }
}

class ClientList extends StatefulWidget {
  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList>
    with PostFrameMixin, BaseMixin {
  bool loading = false;
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    postFrame(() => loadUsers());
    loadUsers();
  }

  Widget getLoader() {
    return Center(
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: AppColors.Dark,
        rightDotColor: AppColors.Primary,
        size: 140,
      ),
    );
  }

  void loadUsers() async {
    setState(() => loading = true);
    try {
      List<User> _users =
          await Provider.of<UserProvider>(context, listen: false).getAll();
      setState(() {
        users = _users.where((user) => user.role.name == 'CLIENT').toList();
        loading = false;
        print('setting users ${users.length}');
      });
    } on ServiceError catch (error) {
      showError('Error', error.message, context);
    } on SocketException {
      showError('Network',
          'Could not reach server, please check network connection!', context);
    } on Error catch (error) {
      showError('Unknown Error', error.toString(), context);
    } finally {
      if (loading) {
        setState(() {
          loading = false;
          users = [];
        });
      }
    }
  }

  /**
   * Will late inherit this from base widget
   */

  Widget listUsers() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return SizedBox(
          child: ClientRow(users[index]),
          height: 60,
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: AppColors.GreyDark,
        height: 6,
      ),
      itemCount: users.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading ? appLoader : listUsers();
  }
}
