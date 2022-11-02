import 'package:driving_school_app/models/user_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import '../../constants/colors.dart';
import '../../models/user.dart';
import '../app_button.dart';
import '../app_text_form_field.dart';
import '../profile_edit.dart';

class UserForm extends StatefulWidget {
  User? _user = null;
  final bool isEdit;
  final String title;
  final void Function(UserCreateModel user) saveHandler;
  void Function()? backHandler;
  void Function()? resetHandler;
  UserForm({
    User? user,
    required String title,
    required bool isEdit,
    required void Function(UserCreateModel user) saveHandler,
    void Function()? backHandler,
    void Function()? resetHandler,
  })  : isEdit = isEdit,
        saveHandler = saveHandler,
        backHandler = backHandler,
        title = title,
        resetHandler = resetHandler {
    user = _user;
  }
  @override
  State<UserForm> createState() => _UserFormState(
      user: _user,
      isEdit: isEdit,
      saveHandler: saveHandler,
      backHandler: backHandler,
      title: title,
      resetHandler: resetHandler);
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final _firstNameKey = GlobalKey<FormFieldState>();
  final _lastNameKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _cellNoKey = GlobalKey<FormFieldState>();
  final _addressLine1Key = GlobalKey<FormFieldState>();
  final _addressLine2Key = GlobalKey<FormFieldState>();
  final _addressLine3Key = GlobalKey<FormFieldState>();
  final _addressLine4Key = GlobalKey<FormFieldState>();
  final _addressLine5Key = GlobalKey<FormFieldState>();
  final bool isEdit;
  final String title;
  UserCreateModel? _user = UserCreateModel();
  void Function(UserCreateModel user) saveHandler;
  void Function()? backHandler;
  void Function()? resetHandler;
  _UserFormState({
    User? user,
    required bool isEdit,
    required String title,
    required void Function(UserCreateModel user) saveHandler,
    void Function()? backHandler,
    void Function()? resetHandler,
  })  : isEdit = isEdit,
        title = title,
        saveHandler = saveHandler,
        backHandler = backHandler,
        resetHandler = resetHandler {
    if (user != null) {
      _user = UserCreateModel.fromExistingUser(user);
    }
    if (isEdit && resetHandler == null) {
      throw Exception('Please provide implementation to handle reset button');
    } else if (!isEdit && backHandler == null) {
      throw Exception('Please provide implementation to handle back button');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
        ),
        ProfileAvatarWrapper(
          firstName: _user!.firstName,
          lastName: _user!.lastName,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Form(
                    key: _form,
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
                            setState(() => _user!.firstName = value);
                            _firstNameKey.currentState?.validate();
                          },
                          key: _firstNameKey,
                          initialValue: _user!.firstName,
                          textInputAction: TextInputAction.next,
                          styleType: AppStyleTypes.SECONDARY,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _user!.firstName = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid first name',
                        ),
                        AppTextFormField(
                          label: 'Last Name',
                          onChanged: (value) {
                            setState(() => _user!.lastName = value);
                            _lastNameKey.currentState?.validate();
                          },
                          key: _lastNameKey,
                          initialValue: _user!.lastName,
                          textInputAction: TextInputAction.next,
                          styleType: AppStyleTypes.SECONDARY,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _user!.lastName = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid last name',
                        ),
                        AppTextFormField(
                          label: 'Email',
                          onChanged: (value) {
                            setState(() => _user!.email = value);
                            _emailKey.currentState?.validate();
                          },
                          key: _emailKey,
                          initialValue: _user!.email,
                          textInputAction: TextInputAction.next,
                          styleType: AppStyleTypes.SECONDARY,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _user!.email = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid email address',
                        ),
                        AppTextFormField(
                          onChanged: (value) {
                            setState(() => _user!.phoneNo = value);
                            _cellNoKey.currentState?.validate();
                          },
                          label: 'Phone No',
                          key: _cellNoKey,
                          initialValue: _user!.phoneNo,
                          textInputAction: TextInputAction.next,
                          styleType: AppStyleTypes.SECONDARY,
                          inputFormatters: [
                            MaskedInputFormatter('(###) ###-####')
                          ],
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _user!.phoneNo = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid address',
                        ),
                        AppTextFormField(
                          onChanged: (value) {
                            setState(() => _user!.addressLine1 = value);
                            _addressLine1Key.currentState?.validate();
                          },
                          label: 'Address Line 1',
                          key: _addressLine1Key,
                          initialValue: '',
                          textInputAction: TextInputAction.next,
                          styleType: AppStyleTypes.SECONDARY,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _user!.addressLine1 = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid address',
                        ),
                        AppTextFormField(
                          onChanged: (value) {
                            setState(() => _user!.addressLine2 = value);
                            _addressLine2Key.currentState?.validate();
                          },
                          label: 'Address Line 2',
                          key: _addressLine2Key,
                          initialValue: '',
                          textInputAction: TextInputAction.next,
                          styleType: AppStyleTypes.SECONDARY,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _user!.addressLine2 = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid address',
                        ),
                        AppTextFormField(
                          onChanged: (value) {
                            setState(() => _user!.addressLine3 = value);
                            _addressLine3Key.currentState?.validate();
                          },
                          label: 'Address Line 3',
                          key: _addressLine3Key,
                          initialValue: '',
                          textInputAction: TextInputAction.next,
                          styleType: AppStyleTypes.SECONDARY,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _user!.addressLine3 = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid address',
                        ),
                        AppTextFormField(
                          onChanged: (value) {
                            setState(() => _user!.addressLine4 = value);
                            _addressLine4Key.currentState?.validate();
                          },
                          label: 'Address Line 4',
                          key: _addressLine4Key,
                          initialValue: '',
                          textInputAction: TextInputAction.next,
                          styleType: AppStyleTypes.SECONDARY,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _user!.addressLine4 = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid address',
                        ),
                        AppTextFormField(
                          onChanged: (value) {
                            setState(() => _user!.addressLine5 = value);
                            _addressLine5Key.currentState?.validate();
                          },
                          label: 'Address Line 5',
                          key: _addressLine5Key,
                          initialValue: '',
                          textInputAction: TextInputAction.next,
                          styleType: AppStyleTypes.SECONDARY,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (_) => _user!.addressLine5 = _!,
                          validator: (value) => value!.length > 0
                              ? null
                              : 'Please enter a valid address',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          child: Text(isEdit ? 'Reset' : 'Back'),
                          onPressed: isEdit ? resetHandler : backHandler,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: AppButton(
                          child: Text('Save'),
                          onPressed: () => saveHandler(_user!),
                          type: AppStyleTypes.PRIMARY,
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
}
