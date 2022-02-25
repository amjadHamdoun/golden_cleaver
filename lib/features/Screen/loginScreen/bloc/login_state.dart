

import 'package:built_value/built_value.dart';
import 'package:golden_cleaver/features/Screen/loginScreen/model/data.dart';
import 'package:golden_cleaver/features/Screen/loginScreen/model/login_response.dart';


part 'login_state.g.dart';


  abstract class LoginState implements Built<LoginState, LoginStateBuilder> {


  bool? get isSuccess;

  bool? get isLoading;

  String? get errorMessage;
  LoginResponseModel? get loginModel;


  LoginState._();

  factory LoginState([void Function(LoginStateBuilder) updates]) = _$LoginState;

  factory LoginState.initial() {
    return LoginState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..errorMessage = ''
        ..loginModel=LoginResponseModel(
          code: 0,
            statue: false,
          message: '',
          data: Data(
            api_token: ''
          )
        )



      );
  }
}
