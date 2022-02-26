// ignore_for_file: public_member_api_docs

part of 'settings_control_bloc.dart';

abstract class SettingsControlEvent extends Equatable {
  const SettingsControlEvent();

  @override
  List<Object> get props => [];
}

class SettingsSizeTapped extends SettingsControlEvent {
  const SettingsSizeTapped({
    required this.puzzleSize,
  });

  final int puzzleSize;

  @override
  List<Object> get props => [puzzleSize];
}

class SettingsInitialized extends SettingsControlEvent {}

class SettingsSameShuffleToggle extends SettingsControlEvent {}

class SettingsOverlayNumbersToggle extends SettingsControlEvent {}

class SettingsRecordMovesToggle extends SettingsControlEvent {}
