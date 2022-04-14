import 'package:advanced_project/data/network/app_api.dart';
import 'package:advanced_project/data/network/requests.dart';
import 'package:advanced_project/data/response/responses.dart';

abstract class RemoteDataSource{
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
  Future<HomeResponse> getHomeData();
}

class RemoteDataSourceImpl implements RemoteDataSource{
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async{
    return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

  @override
  Future<AuthenticationResponse> register(RegisterRequest registerRequest) async{
    return await _appServiceClient.register(
        registerRequest.userName,
        registerRequest.countryMobileCode,
        registerRequest.mobileNumber,
        registerRequest.email,
        registerRequest.password,
        ""
        // registerRequest.profilePicture
    );
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async{
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<HomeResponse> getHomeData() async{
    return await _appServiceClient.getHome();
  }
  
}