import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import '../../constants/colors.dart';
import '../app_button.dart';
import '../app_text_form_field.dart';

class VerificationStep extends StatefulWidget {
  const VerificationStep({Key? key}) : super(key: key);

  @override
  State<VerificationStep> createState() => _VerificationStepState();
}

void validator(String value) {
  print('val: $value');
}

void resendVerificationCode() {
  print('resend code clicked');
}

class _VerificationStepState extends State<VerificationStep> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      print('heigh ${constraints.maxHeight}, ${constraints.maxHeight * 0.05}');
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Enter the verification code below',
                style: TextStyle(
                  color: AppColors.GreyDark,
                  fontSize: 20,
                )),
          ),
          SizedBox(height: constraints.maxHeight * .15),
          SizedBox(
            width: constraints.maxWidth * .2,
            child: AppTextFormField(
              styleType: AppStyleTypes.SECONDARY,
              label: 'Verification Code',
              initialValue: '',
              textAlign: TextAlign.center,
              inputFormatters: [
                MaskedInputFormatter('#  #  #   -   #  #  #   -   #  #  #')
              ],
              onChanged: validator,
            ),
          ),
          SizedBox(height: constraints.maxHeight * .15),
          SizedBox(
            width: constraints.maxWidth * .2,
            child: AppButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.rotate_right),
                  SizedBox(width: 10),
                  Text('Resend code'),
                ],
              ),
              type: AppStyleTypes.TERTIARY,
              elevation: MaterialStateProperty.all(0),
              onPressed: resendVerificationCode,
            ),
          ),
        ]),
      );
    }));
  }
}
