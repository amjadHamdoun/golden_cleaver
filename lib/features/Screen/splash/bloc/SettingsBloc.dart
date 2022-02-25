import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:golden_cleaver/features/Screen/splash/api/settings_remote.dart';
import 'package:golden_cleaver/features/Screen/splash/bloc/settingsEvent.dart';
import 'package:golden_cleaver/features/Screen/splash/model/settings_model.dart';
import 'settings_state.dart';


class SettingsBloc extends Bloc<SettingsEvents, SettingsState> {
  SettingsRemoteDataSource settingsRemoteDataSource;

  SettingsBloc({
    required this.settingsRemoteDataSource
  }) : super(SettingsState.initial());

  void onSettingsGetEvent() {

    add(GetSettingsEvent(
    ));
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsEvents event) async* {
    print(event);
    if (event is GetSettingsEvent) {
      yield state.rebuild((b) => b
        ..isLoading = true
        ..isSuccess = false
        ..errorMessage=''
        ..settingsModel=SettingsModel(data: null)
      );

      final result = await settingsRemoteDataSource.getSettings(
      );

      yield* result.fold((l) async* {
        yield state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = false
          ..errorMessage = l);
      }, (r) async* {

        print('sucesss');

        yield state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = true
          ..errorMessage = ''
          ..settingsModel=r
        );
      });
    }

  }

}
