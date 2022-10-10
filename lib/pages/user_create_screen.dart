import 'dart:html';

import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/components/app_button.dart';
import 'package:flutter/material.dart';
import '../components/scheduler/main_header.dart';
import '../components/sequence_track.dart';
import '../models/user_create.dart';

class UserCreatePage extends StatefulWidget {
  @override
  State<UserCreatePage> createState() => _UserCreatePageState();
}

class _UserCreatePageState extends State<UserCreatePage> {
  int _index = 0;
  Map<int, SequenceStep> steps = [
    SequenceStep('Sign Up', SequenceState.COMPLETE),
    SequenceStep('Avatar', SequenceState.ACTIVE),
    SequenceStep('Verification', SequenceState.INIT),
    SequenceStep('Complete', SequenceState.INIT)
  ].asMap();

  @override
  Widget build(BuildContext context) {
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
                      flex: 1,
                      child: Row(children: [
                        Expanded(child: SizedBox(), flex: 1),
                        Expanded(child: SequenceTrack(steps), flex: 3),
                        Expanded(child: SizedBox(), flex: 1),
                      ]),
                    ),
                    Expanded(
                      flex: 5,
                      child: Placeholder(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: SizedBox(
                          width: 200,
                          child: AppButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Continue'),
                                SizedBox(width: 14),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10,
                                )
                              ],
                            ),
                            onPressed: (() => router.navigateBack()),
                            selected: true,
                          ),
                        ),
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
          );
        },
      ),
    );
  }

  saveChanges(UserCreateModel user) {
    print('user to be saved $user');
  }
}
