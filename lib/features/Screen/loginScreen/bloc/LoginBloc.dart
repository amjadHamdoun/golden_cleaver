import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/Preference.dart';
import 'package:golden_cleaver/features/Screen/loginScreen/api/log_in_remote.dart';
import 'package:golden_cleaver/features/Screen/loginScreen/model/data.dart';
import 'package:golden_cleaver/features/Screen/loginScreen/model/login_response.dart';

import 'LoginEvent.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LogInRemoteDataSource logInRemoteDataSource;

  LoginBloc({required this.logInRemoteDataSource}) : super(LoginState.initial());

  void onLogin(String email,String password) {
    add(LoginEvent(
      email: email,
      password: password
    ));
  }


  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is LoginEvent) {
      yield state.rebuild((b) => b
        ..isLoading = true
        ..isSuccess = false
        ..errorMessage=''
        ..loginModel=LoginResponseModel(
            code: 0,
            statue: false,
            message: '',
            data: Data(
                api_token: ''
            )
        )
      );
      final result = await logInRemoteDataSource.logIn(
      password:  event.password,
        email:  event.email,
      );
        print("result");
      print(result);
      print("result");
      yield* result.fold((l) async* {
        yield state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = false
          ..errorMessage = l);
      }, (r) async* {

        print('sucesss');
        if(r.data!=null)
          {
            Preferences.saveUserToken(r.data!.api_token!);
            Global.userToken=r.data!.api_token;
          }

        yield state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = true
          ..errorMessage = ''
            ..loginModel=r
          );
      });
    }


  }
}
