import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/models/user.dart';
import 'package:driving_school_app/models/user_create.dart';
import 'package:driving_school_app/providers/sequence_step_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../mixins/base.mixin.dart';
import '../../mixins/post-frame.mixin.dart';
import '../app_button.dart';
import '../app_text_form_field.dart';
import 'sequence_footer.dart';

class InstructorSignUpForm extends StatefulWidget {
  InstructorSignUpForm();
  @override
  State<InstructorSignUpForm> createState() => _UserFormState();
}

class _UserFormState extends State<InstructorSignUpForm>
    with PostFrameMixin, BaseMixin {
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

  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNo = '';
  String line1 = '';
  String line2 = '';
  String line3 = '';
  String line4 = '';

  _UserFormState();

  @override
  void initState() {
    print('set state called!!!!');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Center(
        child: SizedBox(
          width: constraints.maxWidth * .6,
          child: GridView(
            shrinkWrap: true,
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
                  setState(() => firstName = value);
                  _firstNameKey.currentState?.validate();
                },
                key: _firstNameKey,
                initialValue: firstName,
                textInputAction: TextInputAction.next,
                styleType: AppStyleTypes.SECONDARY,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                onSaved: (_) => firstName = _!,
                validator: (value) => value!.length > 0
                    ? null
                    : 'Please enter a valid first name',
              ),
              AppTextFormField(
                label: 'Last Name',
                onChanged: (value) {
                  setState(() => lastName = value);
                  _lastNameKey.currentState?.validate();
                },
                key: _lastNameKey,
                initialValue: lastName,
                textInputAction: TextInputAction.next,
                styleType: AppStyleTypes.SECONDARY,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                onSaved: (_) => lastName = _!,
                validator: (value) =>
                    value!.length > 0 ? null : 'Please enter a valid last name',
              ),
              AppTextFormField(
                label: 'Email',
                onChanged: (value) {
                  setState(() => email = value);
                  _emailKey.currentState?.validate();
                },
                key: _emailKey,
                initialValue: email,
                textInputAction: TextInputAction.next,
                styleType: AppStyleTypes.SECONDARY,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                onSaved: (_) => email = _!,
                validator: (value) => value!.length > 0
                    ? null
                    : 'Please enter a valid email address',
              ),
              AppTextFormField(
                onChanged: (value) {
                  setState(() => phoneNo = value);
                  _cellNoKey.currentState?.validate();
                },
                label: 'Phone No',
                key: _cellNoKey,
                initialValue: phoneNo,
                textInputAction: TextInputAction.next,
                styleType: AppStyleTypes.SECONDARY,
                inputFormatters: [MaskedInputFormatter('(###) ###-####')],
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                onSaved: (_) => phoneNo = _!,
                validator: (value) =>
                    value!.length > 0 ? null : 'Please enter a valid address',
              ),
              AppTextFormField(
                onChanged: (value) {
                  setState(() => line1 = value);
                  _addressLine1Key.currentState?.validate();
                },
                label: 'Address Line 1',
                key: _addressLine1Key,
                initialValue: '',
                textInputAction: TextInputAction.next,
                styleType: AppStyleTypes.SECONDARY,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                onSaved: (_) => line1 = _!,
                validator: (value) =>
                    value!.length > 0 ? null : 'Please enter a valid address',
              ),
              AppTextFormField(
                onChanged: (value) {
                  setState(() => line2 = value);
                  _addressLine2Key.currentState?.validate();
                },
                label: 'Address Line 2',
                key: _addressLine2Key,
                initialValue: '',
                textInputAction: TextInputAction.next,
                styleType: AppStyleTypes.SECONDARY,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                onSaved: (_) => line2 = _!,
                validator: (value) =>
                    value!.length > 0 ? null : 'Please enter a valid address',
              ),
              AppTextFormField(
                onChanged: (value) {
                  setState(() => line3 = value);
                  _addressLine3Key.currentState?.validate();
                },
                label: 'Address Line 3',
                key: _addressLine3Key,
                initialValue: '',
                textInputAction: TextInputAction.next,
                styleType: AppStyleTypes.SECONDARY,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                onSaved: (_) => line3 = _!,
                validator: (value) =>
                    value!.length > 0 ? null : 'Please enter a valid address',
              ),
              AppTextFormField(
                onChanged: (value) {
                  setState(() => line4 = value);
                  _addressLine4Key.currentState?.validate();
                },
                label: 'Address Line 4',
                key: _addressLine4Key,
                initialValue: '',
                textInputAction: TextInputAction.next,
                styleType: AppStyleTypes.SECONDARY,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                onSaved: (_) => line4 = _!,
                validator: (value) =>
                    value!.length > 0 ? null : 'Please enter a valid address',
              )
            ],
          ),
        ),
      );
    }));
  }
}
