import 'dart:async';
import 'dart:ffi';

import 'package:advanced_project/domain/model/models.dart';
import 'package:advanced_project/domain/usecase/store_details_usecase.dart';
import 'package:advanced_project/presentation/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/state_renderer_impl.dart';

class StoreDetailsViewModel extends BaseViewModel with StoreDetailsViewModelInput, StoreDetailsViewModelOutput{
final  _storeDetailsStreamController = BehaviorSubject<StoreDetails>();
final StoreDetailsUseCase storeDetailsUseCase;

StoreDetailsViewModel(this.storeDetailsUseCase);

  @override
  void start() {
    _loadData();
  }

  _loadData()async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    (await storeDetailsUseCase.execute(Void))
        .fold((failure) => {
      //left -> failure
      inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.message))
    }, (storeDetails) {
      //right -> data(success)
      //content
      inputState.add(ContentState());
      inputStoreDetails.add(storeDetails);
    });
  }

  @override
  void dispose() {
    _storeDetailsStreamController.close();
  }

@override
Sink get inputStoreDetails => _storeDetailsStreamController.sink;

@override
Stream<StoreDetails> get outputStoreDetails => _storeDetailsStreamController.stream.map((stores) => stores);

}

abstract class StoreDetailsViewModelInput{
  Sink get inputStoreDetails;
}

abstract class StoreDetailsViewModelOutput{
  Stream <StoreDetails> get outputStoreDetails;
}