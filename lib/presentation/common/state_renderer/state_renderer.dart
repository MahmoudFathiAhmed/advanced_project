import 'package:advanced_project/presentation/resources/assets_manager.dart';
import 'package:advanced_project/presentation/resources/color_manager.dart';
import 'package:advanced_project/presentation/resources/strings_manager.dart';
import 'package:advanced_project/presentation/resources/styles_manger.dart';
import 'package:advanced_project/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum StateRendererType{
  //POPUP STATES (DIALOG)
  popupLoadingState,
  popupErrorState,
  //FULL SCREEN STATES (FULL SCREEN)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,
  //GENERAL
  contentState
}
class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function retryActionFunction;
  StateRenderer({
    required this.stateRendererType,
    this.message=AppStrings.loading,
    this.title="",
    required this.retryActionFunction
  });
  // const StateRenderer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context){
    switch(stateRendererType){
      case StateRendererType.popupLoadingState:
        return _getPopupDialog(context, [_getAnimatedImage(JsonAssets.loading)]);
      case StateRendererType.popupErrorState:
        return _getPopupDialog(context, [
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context),
        ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.loading),
          _getMessage(message)
        ]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.retryAgain, context),
        ]);
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.empty),
          _getMessage(message)
        ]);
      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getPopupDialog(BuildContext context, List<Widget> children){
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: const [
            BoxShadow(color: Colors.black26,),
          ]
        ),
        child: _getDialogContext(context, children),
      ),
    );
  }

  Widget _getDialogContext(BuildContext context, List<Widget> children){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ) ;
  }

  Widget _getItemsColumn(List<Widget> children){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String annimationName){
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(annimationName)
    );
  }

  Widget _getMessage(String message){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: getRegularStyle(
              color: ColorManager.black,
              fontSize: AppSize.s18,
          ),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: (){
                if(stateRendererType == StateRendererType.fullScreenErrorState){
                  // retry function
                  retryActionFunction.call();
                }else{ // popup error state
                  Navigator.pop(context);
                }
              },
              child: Text(buttonTitle),
          ),
        ),
      ),
    );
  }
}
