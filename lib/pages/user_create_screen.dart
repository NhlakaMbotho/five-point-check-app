import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/providers/sequence_step_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/instructor_sign_up/sign_up_form.dart';
import '../components/scheduler/main_header.dart';
import '../components/sequence_track.dart';
import '../constants/sequence_step.dart';
import '../models/sequence_step.dart';
import '../models/user_create.dart';

class UserCreatePage extends StatefulWidget {
  @override
  State<UserCreatePage> createState() => _UserCreatePageState();
}

class _UserCreatePageState extends State<UserCreatePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    var sequenceProvider =
        Provider.of<SequenceStepProvider>(context, listen: false);
    sequenceProvider.loadSteps([
      SequenceStep('Sign Up', SequenceState.INIT),
      SequenceStep('Avatar', SequenceState.INIT),
      SequenceStep('Verification', SequenceState.INIT),
      SequenceStep('Complete', SequenceState.INIT)
    ]);
    var router = AutoTabsRouter.of(context);
    return Scaffold(
      appBar: const MainAppBar('Enroll Instructor'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Card(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(children: [
                        Expanded(child: SizedBox(), flex: 1),
                        Expanded(child: SequenceTrack(), flex: 3),
                        Expanded(child: SizedBox(), flex: 1),
                      ]),
                    ),
                    Expanded(
                      child: showView(sequenceProvider.activeStep),
                      flex: 5,
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
          );
        },
      ),
    );
  }

  saveChanges(UserCreateModel user) {
    print('user to be saved $user');
  }

  showView(MapEntry<int, SequenceStep> currentActiveEntry) {
    switch (currentActiveEntry.key) {
      case 0:
        return InstructorSignUpForm();
      case 1:
        return Center(child: Text('Avatar'));
      case 2:
        return Center(child: Text('Verification'));
      case 3:
        return Center(child: Text('Complete'));
      default:
    }
  }
}
