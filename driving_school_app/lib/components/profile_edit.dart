import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/models/user.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_button.dart';
import 'app_text_form_field.dart';

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

class ProfileEdit extends StatefulWidget {
  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _form = GlobalKey<FormState>();
  final _firstNameKey = GlobalKey<FormFieldState>();
  final _lastNameKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _cellNoKey = GlobalKey<FormFieldState>();
  final _dateOfBirthKey = GlobalKey<FormFieldState>();

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _cellNo = '';
  DateTime _dateOfBirth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    initValues(user);
    return Center(
      child: Row(children: [
        Flexible(
          flex: 4,
          child: Column(
            children: [
              ProfileAvatarWrapper(firstName: _firstName, lastName: _lastName),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Expanded(
                        child: Form(
                          child: GridView(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 20,
                              mainAxisExtent: 60,
                            ),
                            children: [
                              AppTextFormField(
                                label: 'First Name',
                                onChanged: (value) {
                                  setState(() => _firstName = value);
                                  _firstNameKey.currentState?.validate();
                                },
                                key: _firstNameKey,
                                initialValue: user.firstName,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                onSaved: (_) => _firstName = _!,
                                validator: (value) => value!.length > 0
                                    ? null
                                    : 'Please enter a valid first name',
                              ),
                              AppTextFormField(
                                label: 'Last Name',
                                onChanged: (value) {
                                  setState(() => _lastName = value);
                                  _lastNameKey.currentState?.validate();
                                },
                                key: _lastNameKey,
                                initialValue: user.lastName,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                onSaved: (_) => _lastName = _!,
                                validator: (value) => value!.length > 0
                                    ? null
                                    : 'Please enter a valid last name',
                              ),
                              AppTextFormField(
                                label: 'Email',
                                onChanged: (value) {
                                  setState(() => _email = value);
                                  _emailKey.currentState?.validate();
                                },
                                key: _emailKey,
                                initialValue: user.email,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                onSaved: (_) => _email = _!,
                                validator: (value) => value!.length > 0
                                    ? null
                                    : 'Please enter a valid email address',
                              ),
                              AppTextFormField(
                                onChanged: (value) {
                                  setState(() => _cellNo = value);
                                  _cellNoKey.currentState?.validate();
                                },
                                label: 'Cell Number',
                                key: _cellNoKey,
                                initialValue: user.phoneNo,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                onSaved: (_) => _cellNo = _!,
                                validator: (value) => value!.length > 0
                                    ? null
                                    : 'Please enter a valid cell number',
                              ),
                              // AppButton(
                              //   child: Text('Save'),
                              //   selected: true,
                              //   onPressed: () {
                              //     _showMyDialog(context);
                              //   },
                              // )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: 300,
                        child: AppButton(
                          child: Text('Save'),
                          onPressed: () {},
                          selected: true,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Placeholder(
            color: Colors.red,
          ),
        )
      ]),
    );
  }

  void initValues(User user) {
    _firstName = _firstName.length > 0 ? _firstName : user.firstName;
    _lastName = _lastName.length > 0 ? _lastName : user.lastName;
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
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.GreyLight.withOpacity(.4),
          ),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
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
