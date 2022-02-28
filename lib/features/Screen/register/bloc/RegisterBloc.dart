import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/Preference.dart';
import 'package:golden_cleaver/features/Screen/register/api/register_remote.dart';
import 'package:golden_cleaver/features/Screen/register/bloc/RegisterEvent.dart';
import 'package:golden_cleaver/features/Screen/register/bloc/register_state.dart';
import 'package:golden_cleaver/features/Screen/register/model/data.dart';
import 'package:golden_cleaver/features/Screen/register/model/register_response.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterState> {
  RegisterRemoteDataSource registerRemoteDataSource;

  RegisterBloc({required this.registerRemoteDataSource})
      : super(RegisterState.initial());

  void onRegister(
      String email, String mobile,String password, String name, String passwordConfirmation) {
    add(RegisterEvent(
        email: email,
        mobile: mobile,
        password: password,
        password_confirmation: passwordConfirmation,
        name: name));
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvents event) async* {
    if (event is RegisterEvent) {
      yield state.rebuild((b) => b
        ..isLoading = true
        ..isSuccess = false
        ..errorMessage = ''
        ..registerModel = RegisterResponseModel(
            code: 0, statue: false, message: '',
            data: Data(
              api_token: '',
             id: 0,
              name: ''

            )));
      final result = await registerRemoteDataSource.register(
          email:event.email, mobile: event.mobile,name: event.name, password: event.password, password_confirmation: event.password_confirmation);
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
        if (r.data != null)
          {
            Preferences.saveUserToken(r.data!.api_token!);
            Global.userToken=r.data!.api_token;
            Preferences.saveUserId(r.data!.id!);
            Global.userId=r.data!.id;
            Preferences.saveUserName(r.data!.name!);

          }
        yield state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = true
          ..errorMessage = ''
          ..registerModel = r);
      });
    }
  }
}
