import '../../data/network/failure.dart';
import '../../domain/model/models.dart';
import '../../domain/repository/repository.dart';
import '../../domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject>{

  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async{
    return await _repository.getHomeData();
  }
  
}