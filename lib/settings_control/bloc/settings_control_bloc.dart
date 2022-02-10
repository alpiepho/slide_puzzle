// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_control_event.dart';
part 'settings_control_state.dart';

class SettingsControlBloc
    extends Bloc<SettingsControlEvent, SettingsControlState> {
  SettingsControlBloc() : super(const SettingsControlState()) {
    on<SettingsSizeTapped>(_onSettingsSizeTapped);
  }

  void _onSettingsSizeTapped(
    SettingsSizeTapped event,
    Emitter<SettingsControlState> emit,
  ) {
    print('got ${event.size}\n');
    emit(SettingsControlState(size: event.size));
  }
}
