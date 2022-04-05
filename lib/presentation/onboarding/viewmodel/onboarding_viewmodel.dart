import 'dart:async';


import 'package:advanced_project/domain/models.dart';
import 'package:advanced_project/presentation/base/base_viewmodel.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs{
  //stream controllers outputs
  final StreamController _streamController= StreamController<SliderViewObject>();
  late final List<SliderObject>_list;
  int _currentIndex= 0;

  //onBoarding view model inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    //view model start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if(nextIndex == _list.length){
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if(previousIndex == -1){
      previousIndex = _list.length-1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;


  //onBoarding view model outputs
  @override
  // TODO: implement OutputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //onBoarding private functions
  void _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

  List<SliderObject> _getSliderData()=>[
    SliderObject(
        AppStrings.onBoardingTitle1,
        AppStrings.onBoardingSubTitle1,
        ImageAssets.onBoardingLogo1
    ),
    SliderObject(
        AppStrings.onBoardingTitle2,
        AppStrings.onBoardingSubTitle2,
        ImageAssets.onBoardingLogo2
    ),
    SliderObject(
        AppStrings.onBoardingTitle3,
        AppStrings.onBoardingSubTitle3,
        ImageAssets.onBoardingLogo3
    ),
    SliderObject(
        AppStrings.onBoardingTitle4,
        AppStrings.onBoardingSubTitle4,
        ImageAssets.onBoardingLogo4
    ),
  ];


}
//inputs means "orders" that our view model will receive from view
abstract class OnBoardingViewModelInputs  {
 int goNext(); // when user clicks on the right arrow or swipe right
 int goPrevious(); // when user clicks on the left arrow or swipe left
 void onPageChanged(int index);
 //stream controller input
 Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs{
  //stream controller output
Stream<SliderViewObject> get outputSliderViewObject;
}


