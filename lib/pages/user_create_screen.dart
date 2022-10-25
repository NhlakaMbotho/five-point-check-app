import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/providers/sequence_step_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../components/instructor_sign_up/sequence_footer.dart';
import '../components/instructor_sign_up/sign_up_form.dart';
import '../components/scheduler/main_header.dart';
import '../components/sequence_track.dart';
import '../constants/sequence_step.dart';
import '../mixins/base.mixin.dart';
import '../mixins/post-frame.mixin.dart';
import '../models/sequence_step.dart';
import '../models/user_create.dart';

class UserCreatePage extends StatefulWidget {
  UserCreatePage() {}

  @override
  State<UserCreatePage> createState() => _UserCreatePageState();
}

class _UserCreatePageState extends State<UserCreatePage>
    with PostFrameMixin, BaseMixin {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    var sequenceProvider =
        Provider.of<SequenceStepProvider>(context, listen: false);
    postFrame(() {
      sequenceProvider.loadSteps([
        SequenceStep('Sign Up', SequenceState.INIT),
        SequenceStep('Avatar', SequenceState.INIT),
        SequenceStep('Verification', SequenceState.INIT),
        SequenceStep('Complete', SequenceState.INIT)
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // _picker
    //     .pickImage(source: ImageSource.gallery)
    //     .then((value) => print('image = ${value!.readAsString()}'));
    var sequenceProvider =
        Provider.of<SequenceStepProvider>(context, listen: true);

    return Scaffold(
      appBar: const MainAppBar('Enroll Instructor'),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 70),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(children: [
                    Expanded(child: SizedBox(), flex: 1),
                    Expanded(child: SequenceTrack(), flex: 3),
                    Expanded(child: SizedBox(), flex: 1),
                  ]),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Flexible(
                        flex: 4,
                        fit: FlexFit.loose,
                        child: showView(sequenceProvider.activeStep),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        flex: 1,
                        child: SequenceFooter(200),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          elevation: 70,
          shadowColor: Colors.grey.withOpacity(.1),
        ),
      ),
    );
  }

  saveChanges(UserCreateModel user) {
    print('user to be saved $user');
  }

  showView(MapEntry<int, SequenceStep>? currentActiveEntry) {
    print('show view called!!!!');

    if (currentActiveEntry == null) {
      return Center(child: Text('Invalid Selection'));
    }
    switch (currentActiveEntry.key) {
      case 0:
        return InstructorSignUpForm();
      case 1:
        return AvatarUploader();
      case 2:
        return Center(child: Text('Verification'));
      case 3:
        return Center(child: Text('Complete'));
      default:
        return Center(child: Text('No Page'));
    }
  }
}

class AvatarUploader extends StatefulWidget {
  const AvatarUploader({Key? key}) : super(key: key);

  @override
  State<AvatarUploader> createState() => _AvatarState();
}

class _AvatarState extends State<AvatarUploader> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Container(
            width: constraints.maxWidth * .3,
            height: constraints.maxWidth * .2,
            decoration: BoxDecoration(
              color: AppColors.GreyDark.withOpacity(.20),
              // border: Border.all(
              //   color: AppColors.Primary,
              //   style: BorderStyle.solid,
              //   width: 1,
              // ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(Icons.add, size: 60, color: AppColors.GreyDark),
                ),
                Center(
                  child: Text(
                    'Upload Avatar',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.GreyDark,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
