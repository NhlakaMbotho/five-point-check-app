import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../models/user.dart';
import '../providers/user.provider.dart';
import 'app_button.dart';
import 'app_text_form_field.dart';
import 'profile_edit.dart';

class UserForm extends StatefulWidget {
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
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
    return Column(
      children: [
        ProfileAvatarWrapper(firstName: _firstName, lastName: _lastName),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Form(
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          styleType: AppStyleTypes.SECONDARY,
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
                          styleType: AppStyleTypes.SECONDARY,
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
                          styleType: AppStyleTypes.SECONDARY,
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
                          inputFormatters: [
                            MaskedInputFormatter('(###) ###-####')
                          ],
                          initialValue: user.phoneNo,
                          textInputAction: TextInputAction.next,
                          styleType: AppStyleTypes.SECONDARY,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _cellNo = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid cell number',
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Placeholder(
                    color: Colors.red,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          child: Text('Reset'),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: AppButton(
                          child: Text('Save'),
                          onPressed: () {},
                          selected: true,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void initValues(User user) {
    _firstName = _firstName.length > 0 ? _firstName : user.firstName;
    _lastName = _lastName.length > 0 ? _lastName : user.lastName;
  }
}
