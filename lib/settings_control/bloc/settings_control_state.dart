// ignore_for_file: public_member_api_docs

part of 'settings_control_bloc.dart';

class SettingsControlState extends Equatable {
  const SettingsControlState({
    this.size = 4,
  });

  /// Size of puzzle
  final int size;

  @override
  List<Object> get props => [size];
}
