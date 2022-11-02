import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/sequence_step_provider.dart';
import '../app_button.dart';

class SequenceFooter extends StatelessWidget {
  final double buttonWWidth;
  const SequenceFooter(double buttonWWidth) : buttonWWidth = buttonWWidth;

  @override
  Widget build(BuildContext context) {
    var tabsRouter = AutoTabsRouter.of(context);
    var sequenceProvider =
        Provider.of<SequenceStepProvider>(context, listen: false);
    return Center(
      child: sequenceProvider.sequenceComplete
          ? null
          : SizedBox(
              width: buttonWWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: AppButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.keyboard_arrow_left_sharp),
                          SizedBox(width: 10),
                          Text('Next'),
                        ],
                      ),
                      onPressed: (() =>
                          navigateBack(sequenceProvider, tabsRouter)),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: AppButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Next'),
                          SizedBox(width: 10),
                          Icon(Icons.keyboard_arrow_right_sharp),
                        ],
                      ),
                      onPressed: (() => navigateForward(sequenceProvider)),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  navigateBack(SequenceStepProvider stepProvider, TabsRouter router) {
    if (stepProvider.canNavigateBack()) {
      return stepProvider.decrementPosition();
    }
    router.setActiveIndex(0);
  }

  navigateForward(SequenceStepProvider stepProvider) {
    bool validation = true;
    if (validation) {
      return stepProvider.incrementPosition();
    }
  }
}
