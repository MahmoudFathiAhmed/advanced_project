import 'package:advanced_project/data/data_source/remote_data_source.dart';
import 'package:advanced_project/data/mapper/mapper.dart';
import 'package:advanced_project/data/network/error_handler.dart';
import 'package:advanced_project/data/network/failure.dart';
import 'package:advanced_project/data/network/network_info.dart';
import 'package:advanced_project/data/network/requests.dart';
import 'package:advanced_project/domain/model/models.dart';
import 'package:advanced_project/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository{
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{

    if(await _networkInfo.isConnected){
      //it's connected to the internet, it's safe to call API
      try{
        final response  = await _remoteDataSource.login(loginRequest);
        if (response.status==ApiInternalStatus.SUCCESS){
          //success
          //return either right
          //return data
          return Right(response.toDomain());
        }else{
          //failure -- business error
          //return either left
          return Left(Failure(ApiInternalStatus.FAILURE, response.message??ResponseMessage.DEFAULT));
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }else{
      //return internet connection error
      //return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async{
    if(await _networkInfo.isConnected){
      //it's connected to the internet, it's safe to call API
      try{
        final response  = await _remoteDataSource.forgotPassword(email);
        if (response.status==ApiInternalStatus.SUCCESS){
          //success
          //return either right
          //return data
          return Right(response.toDomain());
        }else{
          //failure -- business error
          //return either left
          return Left(Failure(response.status??ResponseCode.DEFAULT,
            response.message??ResponseMessage.DEFAULT
          ));
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }else{
      //return internet connection error
      //return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(RegisterRequest registerRequest) async{
    if(await _networkInfo.isConnected){
      //it's connected to the internet, it's safe to call API
      try{
        final response  = await _remoteDataSource.register(registerRequest);
        if (response.status==ApiInternalStatus.SUCCESS){
          //success
          //return either right
          //return data
          return Right(response.toDomain());
        }else{
          //failure -- business error
          //return either left
          return Left(Failure(response.status??ResponseCode.DEFAULT,
              response.message??ResponseMessage.DEFAULT
          ));
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }else{
      //return internet connection error
      //return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}