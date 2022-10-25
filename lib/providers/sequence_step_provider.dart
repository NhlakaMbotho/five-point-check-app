import 'package:flutter/material.dart';
import '../constants/sequence_step.dart';
import '../models/sequence_step.dart';

class SequenceStepProvider with ChangeNotifier {
  Map<int, SequenceStep> _steps = {};
  int _currentPosition = 0;

  SequenceStepProvider() {
    _steps = {};
  }

  loadSteps(List<SequenceStep> newList) {
    _steps = newList.asMap();
    _currentPosition = 0;
    if (_steps.length > 0) {
      updateStep(0, SequenceState.ACTIVE);
    }
    notifyListeners();
  }

  Map<int, SequenceStep> get steps {
    return _steps;
  }

  void updateStep(int key, SequenceState statue) {
    if (steps.containsKey(key)) {
      int i = _steps.length - 1;
      while (i > key) {
        steps[i]?.state = SequenceState.INIT;
        i--;
      }
      steps[key]?.state = statue;
    }
  }

  get currentPosition {
    return _currentPosition;
  }

  get activeStep {
    if (steps.containsKey(_currentPosition)) {
      return steps.entries.elementAt(_currentPosition);
    }
    return null;
  }

  void incrementPosition() {
    updateStep(_currentPosition, SequenceState.COMPLETE);
    if (_steps.containsKey(_currentPosition + 1)) {
      _currentPosition++;
      updateStep(currentPosition, SequenceState.ACTIVE);
    }
    notifyListeners();
  }

  bool canNavigateBack() {
    return _currentPosition > 0;
  }

  void decrementPosition() {
    if (_currentPosition <= 0) {
      return;
    }
    updateStep(_currentPosition, SequenceState.INIT);
    _currentPosition--;
    updateStep(currentPosition, SequenceState.ACTIVE);
    notifyListeners();
  }

  bool jumpBack(toPosition) {
    if (toPosition > _currentPosition) {
      return false;
    }
    updateStep(toPosition, SequenceState.ACTIVE);
    _currentPosition = toPosition;
    notifyListeners();
    return true;
  }
}
