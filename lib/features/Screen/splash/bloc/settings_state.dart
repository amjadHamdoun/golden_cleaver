

import 'package:built_value/built_value.dart';
import 'package:golden_cleaver/features/Screen/splash/model/settings_model.dart';

part 'settings_state.g.dart';


abstract class SettingsState implements Built<SettingsState, SettingsStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get errorMessage;
  SettingsModel? get settingsModel;


  SettingsState._();

  factory SettingsState([void Function(SettingsStateBuilder) updates]) = _$SettingsState;

  factory SettingsState.initial() {
    return SettingsState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..settingsModel=SettingsModel(data: null)
      ..errorMessage = ''
    );
  }
}


