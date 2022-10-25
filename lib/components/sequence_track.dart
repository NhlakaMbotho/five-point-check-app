import 'package:driving_school_app/providers/sequence_step_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/sequence_step.dart';
import '../models/sequence_step.dart';

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
  final MapEntry<int, SequenceStep> _step;

  SequenceStepWidget(this._step);

  @override
  Widget build(BuildContext context) {
    var _sequence = Provider.of<SequenceStepProvider>(context, listen: true);

    const double radius = 46;
    var styling = getStyling(_step.value);
    bool isComplete = _step.value.state == SequenceState.COMPLETE;
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: radius,
            width: radius,
            margin: EdgeInsets.only(bottom: 10),
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
                      size: 16,
                    )
                  : Text(
                      (_step.key + 1).toString(),
                      style: TextStyle(
                        color: styling.innerText,
                        fontSize: 16,
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
      ),
      onTap: () => _sequence.jumpBack(_step.key),
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
  List<Widget> getLineBrokenWidgetList(
      Map<int, SequenceStep> steps, double width) {
    List<Widget> list = [];
    List<Widget> widgets =
        steps.entries.map((_step) => SequenceStepWidget(_step)).toList();
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
            margin: EdgeInsets.only(bottom: 22),
          ),
        );
      } else {
        var step = steps.entries.elementAt(k++);
        list.add(SequenceStepWidget(step));
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    var _sequence = Provider.of<SequenceStepProvider>(context, listen: true);

    var width = MediaQuery.of(context).size.width * 0.08;

    return Row(
      children: getLineBrokenWidgetList(_sequence.steps, width),
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
