// ignore_for_file: public_member_api_docs

part of 'settings_control_bloc.dart';

class SettingsControlState extends Equatable {
  const SettingsControlState({
    this.muted = false,
  });

  /// Whether the audio is muted.
  final bool muted;

  @override
  List<Object> get props => [muted];
}
