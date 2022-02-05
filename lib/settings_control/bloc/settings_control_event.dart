// ignore_for_file: public_member_api_docs

part of 'settings_control_bloc.dart';

abstract class SettingsControlEvent extends Equatable {
  const SettingsControlEvent();

  @override
  List<Object> get props => [];
}

class SettingsToggled extends SettingsControlEvent {}
