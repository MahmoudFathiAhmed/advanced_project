import '../../data/network/failure.dart';
import '../../presentation/resources/strings_manager.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorHandler implements Exception{
  late Failure failure;

  ErrorHandler.handle(dynamic error){
    if(error is DioError){
      //dio error so it's an error from response of the API or from Dio itself
      failure = _handleError(error);
    }else{
      //default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.CONNECTED_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RECEIVE_TIMEOUT.getFailure();
    case DioErrorType.response:
      if(error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null ){
        return Failure(error.response?.statusCode??0, error.response?.statusMessage??"");
      }else{
        return DataSource.DEFAULT.getFailure();
      }
    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioErrorType.other:
      return DataSource.DEFAULT.getFailure();
  }
}
enum DataSource{
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECTED_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}
extension DataSourceExtension on DataSource{
  getFailure(){
    switch(this){
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS.tr());
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT.tr());
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST.tr());
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN.tr());
      case DataSource.UNAUTHORIZED:
        return Failure(ResponseCode.UNAUTHORIZED, ResponseMessage.UNAUTHORIZED.tr());
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND.tr());
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR, ResponseMessage.INTERNAL_SERVER_ERROR.tr());
      case DataSource.CONNECTED_TIMEOUT:
        return Failure(ResponseCode.CONNECTED_TIMEOUT, ResponseMessage.CONNECTED_TIMEOUT.tr());
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL.tr());
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT.tr());
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT.tr());
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR.tr());
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION.tr());
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT.tr());
    }
}
}
class ResponseCode{
  static const int SUCCESS = 200;//success with data
  static const int NO_CONTENT = 201;//success with no data(no content)
  static const int BAD_REQUEST = 400;// failure, API rejected request
  static const int FORBIDDEN = 403;// failure, API rejected request
  static const int UNAUTHORIZED = 401;//failure user is not authorized
  static const int NOT_FOUND = 404;//failure, not found
  static const int INTERNAL_SERVER_ERROR = 500;//failure, crash in server side

  //local status code
  static const int CONNECTED_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;

}
class ResponseMessage{
  static const String SUCCESS = AppStrings.success;//success with data
  static const String NO_CONTENT = AppStrings.success;//success with no data(no content)
  static const String BAD_REQUEST = AppStrings.badRequestError;// failure, API rejected request
  static const String FORBIDDEN = AppStrings.forbiddenError;// failure, API rejected request
  static const String UNAUTHORIZED = AppStrings.unauthorizedError;//failure user is not authorized
  static const String NOT_FOUND = AppStrings.notFoundError;//
  static const String INTERNAL_SERVER_ERROR = AppStrings.internalServerError;//failure, crash in server side

  //local status code
  static const String CONNECTED_TIMEOUT = AppStrings.timeoutError;
  static const String CANCEL = AppStrings.defaultError;
  static const String RECEIVE_TIMEOUT = AppStrings.timeoutError;
  static const String SEND_TIMEOUT = AppStrings.timeoutError;
  static const String CACHE_ERROR = AppStrings.cacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.noInternetError;
  static const String DEFAULT = AppStrings.defaultError;
}

class ApiInternalStatus{
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}