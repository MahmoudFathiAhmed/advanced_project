import 'package:advanced_project/data/network/requests.dart';
import 'package:advanced_project/domain/model/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';


abstract class Repository{
  Future <Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future <Either<Failure, String>> forgotPassword(String email);
  Future <Either<Failure, Authentication>> register(RegisterRequest registerRequest);
}