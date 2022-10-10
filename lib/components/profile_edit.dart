import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/models/user_create.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_button.dart';
import 'user_form.dart';

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class ProfileEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        Flexible(
          flex: 4,
          child: UserForm(
            title: 'Change Account Information',
            user: Provider.of<UserProvider>(context).user,
            isEdit: true,
            saveHandler: saveChanges,
            resetHandler: () => {},
          ),
        ),
        Flexible(
          flex: 2,
          child: SizedBox(),
        )
      ]),
    );
  }

  saveChanges(UserCreateModel user) {
    print('user to be saved $user');
  }
}

class BottomFooter extends StatelessWidget {
  final VoidCallback clickHandler;
  BottomFooter(clickHandler) : clickHandler = clickHandler;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () => clickHandler(),
      child: Text('Save Changes'),
    );
  }
}

class ProfileAvatarWrapper extends StatelessWidget {
  const ProfileAvatarWrapper({
    Key? key,
    required String firstName,
    required String lastName,
  })  : _firstName = firstName,
        _lastName = lastName,
        super(key: key);

  final String _firstName;
  final String _lastName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.GreyLight.withOpacity(.4),
          ),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 5,
                    )
                  ],
                ),
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
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '$_firstName $_lastName',
                    style: TextStyle(
                      color: AppColors.Primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
