import 'package:flutter/material.dart';
import '../constants/colors.dart';

enum SequenceState { INIT, ACTIVE, COMPLETE, ERROR }

class SequenceStep {
  String title;
  SequenceState state;
  SequenceStep(this.title, this.state) {}
}

class StepStyling {
  final Color innerText;
  final Color titleText;
  final Color backgroundColor;
  final Color borderColor;

  StepStyling({
    this.titleText = AppColors.Primary,
    this.innerText = AppColors.Primary,
    this.backgroundColor = Colors.white,
    this.borderColor = AppColors.Primary,
  });
}

class SequenceStepWidget extends StatelessWidget {
  MapEntry<int, SequenceStep> _step;

  SequenceStepWidget(this._step);

  @override
  Widget build(BuildContext context) {
    const double radius = 60;
    var styling = getStyling(_step.value);
    bool isComplete = _step.value.state == SequenceState.COMPLETE;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: radius,
          width: radius,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: styling.borderColor,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(radius),
            color: styling.backgroundColor,
          ),
          child: Center(
            child: isComplete
                ? Icon(
                    Icons.check_rounded,
                    color: styling.innerText,
                  )
                : Text(
                    (_step.key + 1).toString(),
                    style: TextStyle(
                      color: styling.innerText,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
          ),
        ),
        Text(
          _step.value.title,
          style: TextStyle(
            color: styling.titleText,
            fontSize: 12,
            fontWeight: FontWeight.w200,
          ),
        )
      ],
    );
  }
}

StepStyling getStyling(SequenceStep step) {
  switch (step.state) {
    case SequenceState.ACTIVE:
      return StepStyling(
        titleText: AppColors.Primary,
        innerText: Colors.white,
        backgroundColor: AppColors.Primary,
        borderColor: AppColors.Primary,
      );
    case SequenceState.ERROR:
      return StepStyling(
        titleText: Colors.red,
        innerText: Colors.red,
        backgroundColor: Colors.white,
        borderColor: Colors.red,
      );
    case SequenceState.COMPLETE:
      return StepStyling(
        titleText: Colors.green,
        innerText: Colors.white,
        backgroundColor: Colors.green,
        borderColor: Colors.green,
      );
    default:
      return StepStyling(
        titleText: AppColors.Primary,
        innerText: AppColors.Primary,
        backgroundColor: Colors.white,
        borderColor: AppColors.Primary,
      );
  }
}

class SequenceTrack extends StatelessWidget {
  final Map<int, SequenceStep> steps;
  const SequenceTrack(Map<int, SequenceStep> steps) : steps = steps;

  List<Widget> getLineBrokenWidgetList(List<Widget> widgets, double width) {
    List<Widget> list = [];
    int k = 0;

    for (var i = 0; i < ((widgets.length * 2) - 1); i++) {
      var isPreviousStepComplete =
          steps[k] != null && steps[k]?.state == SequenceState.COMPLETE;
      if (i % 2 != 0) {
        list.add(
          Container(
            color: isPreviousStepComplete ? Colors.green : AppColors.Primary,
            height: 1,
            width: width,
          ),
        );
      } else {
        list.add(widgets[k++]);
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.06;

    return Row(
      children: getLineBrokenWidgetList(
        steps.entries.map((_step) => SequenceStepWidget(_step)).toList(),
        width,
      ),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
