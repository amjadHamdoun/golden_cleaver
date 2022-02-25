import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SettingsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class GetSettingsEvent extends SettingsEvents{

}
