import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'app_input.dart';

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

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _cellNo = '';

  void initValues(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    setState(() {
      _firstName = user.firstName;
      _lastName = user.lastName;
      _email = user.email;
      _cellNo = user.phoneNo;
    });
  }

  @override
  Widget build(BuildContext context) {
    initValues(context);
    // var inputDecoration = );
    return Center(
      child: Row(children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Placeholder(
                  color: Colors.green,
                ),
              ),
              Expanded(
                flex: 3,
                child: Form(
                  key: _form,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 60,
                      ),
                      children: [
                        AppTextFormField(
                          label: 'First Name',
                          onChanged: (value) =>
                              _firstNameKey.currentState?.validate(),
                          key: _firstNameKey,
                          initialValue: _firstName,
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
                          onChanged: (value) =>
                              _lastNameKey.currentState?.validate(),
                          key: _lastNameKey,
                          initialValue: _lastName,
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
                          onChanged: (value) =>
                              _emailKey.currentState?.validate(),
                          key: _emailKey,
                          initialValue: _email,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _email = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid email address',
                        ),
                        AppTextFormField(
                          onChanged: (value) =>
                              _cellNoKey.currentState?.validate(),
                          label: 'Cell Number',
                          key: _cellNoKey,
                          initialValue: _cellNo,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _cellNo = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid cell number',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Placeholder(
            color: Colors.red,
          ),
        )
      ]),
    );
  }
}
