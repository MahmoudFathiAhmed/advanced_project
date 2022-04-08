import 'package:advanced_project/app/constants.dart';
import 'package:advanced_project/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced_project/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

abstract class FlowState{
  StateRendererType getStateRendererType();
  String getMessage();
}

//loading state (POPUP, FULL SCREEN)
class LoadingState extends FlowState{
  StateRendererType stateRendererType;
  String? message;

  LoadingState({required this.stateRendererType, this.message = AppStrings.loading});

  @override
  String getMessage() =>message?? AppStrings.loading;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

}

//Error state (POPUP, FULL SCREEN)
class ErrorState extends FlowState{
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() =>message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

}

//content state
class ContentState extends FlowState{
  ContentState();

  @override
  String getMessage() =>Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;

}

//emptyState
class EmptyState extends FlowState{
  String message;
  EmptyState(this.message);

  @override
  String getMessage() =>message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.fullScreenEmptyState;

}

extension FlowStateExtension on FlowState{
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget, Function retryActionFunction){
    switch(runtimeType){
      case LoadingState: {
        if(getStateRendererType() == StateRendererType.popupLoadingState){
          //show popup loading
          showPopup(context, getStateRendererType(), getMessage());
          //show ui content of the screen
          return contentScreenWidget;
        }else{
          //full screen loading state
          return StateRenderer(
            message: getMessage(),
            stateRendererType: getStateRendererType(),
            retryActionFunction: retryActionFunction,
          );
        }
      }
      case ErrorState: {
        dismissDialog(context);
        if(getStateRendererType() == StateRendererType.popupErrorState){
          //show popup error
          showPopup(context, getStateRendererType(), getMessage());
          //show ui content of the screen
          return contentScreenWidget;
        }else{
          //full screen error state
          return StateRenderer(
            message: getMessage(),
            stateRendererType: getStateRendererType(),
            retryActionFunction: retryActionFunction,
          );
        }
      }
      case EmptyState: {
        return StateRenderer(
            stateRendererType: getStateRendererType(),
            message: getMessage(),
            retryActionFunction: (){});
      }
      case ContentState: {
        dismissDialog(context);
        return contentScreenWidget;
      }
      default:{
        dismissDialog(context);
        return contentScreenWidget;
      }
    }
  }

  _isCurrentDialogShowing(BuildContext context)=> ModalRoute.of(context)?.isCurrent != true;

  dismissDialog(BuildContext context){
    if(_isCurrentDialogShowing(context)){
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  showPopup(BuildContext context, StateRendererType stateRendererType, String message){
    WidgetsBinding.instance?.addPostFrameCallback((_)=>
    showDialog(context: context, builder: (BuildContext context)=>
        StateRenderer(
            stateRendererType: stateRendererType,
            message: message,
            retryActionFunction: (){},
        )));
  }
}