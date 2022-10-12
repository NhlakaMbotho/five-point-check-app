import 'package:driving_school_app/models/user_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import '../../constants/colors.dart';
import '../app_button.dart';
import '../app_text_form_field.dart';

class InstructorSignUpForm extends StatefulWidget {
  InstructorSignUpForm();
  @override
  State<InstructorSignUpForm> createState() => _UserFormState();
}

class _UserFormState extends State<InstructorSignUpForm> {
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
  UserCreateModel? _user = UserCreateModel();
  _UserFormState();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      print('width ${constrains.maxWidth} heigh ${constrains.maxHeight}');

      return Container(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
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
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              onSaved: (_) => _user!.firstName = _!,
              validator: (value) =>
                  value!.length > 0 ? null : 'Please enter a valid first name',
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
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              onSaved: (_) => _user!.lastName = _!,
              validator: (value) =>
                  value!.length > 0 ? null : 'Please enter a valid last name',
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
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
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
              inputFormatters: [MaskedInputFormatter('(###) ###-####')],
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              onSaved: (_) => _user!.phoneNo = _!,
              validator: (value) =>
                  value!.length > 0 ? null : 'Please enter a valid address',
            ),
          ],
        ),
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.black,
        //     style: BorderStyle.solid,
        //     width: 1,
        //   ),
        // ),
        // height: constrains.maxHeight * .4,
        // width: constrains.maxWidth * .6,
      );
    });
  }
}
