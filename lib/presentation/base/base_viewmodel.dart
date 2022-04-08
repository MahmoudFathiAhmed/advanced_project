import 'dart:async';

import 'package:advanced_project/presentation/common/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs{
  //shared variables and function that will be used throw any view model.
  final StreamController _inputController = StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputController.sink;

  @override
  Stream<FlowState> get outputState => _inputController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputController.close();
  }

}
abstract class BaseViewModelInputs{
  void start(); //start view model job

  void dispose(); //will be called when view model dies

  Sink get inputState;
}

abstract class BaseViewModelOutputs{
  //will be implemented later
  Stream<FlowState> get outputState;
}