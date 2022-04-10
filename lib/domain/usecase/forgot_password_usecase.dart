import 'package:advanced_project/data/network/failure.dart';
import 'package:advanced_project/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, String>{
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async{
    return await _repository.forgotPassword(input);
  }

}