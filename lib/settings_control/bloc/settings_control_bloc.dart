// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_control_event.dart';
part 'settings_control_state.dart';

class SettingsControlBloc 
    extends Bloc<SettingsControlEvent, SettingsControlState> {
  SettingsControlBloc() : super(const SettingsControlState()) {
    on<SettingsToggled>(_onSettingsToggled);
  }

  void _onSettingsToggled(
    SettingsToggled event, 
    Emitter<SettingsControlState> emit,
    ) {
    emit(SettingsControlState(muted: !state.muted));
  }
}
