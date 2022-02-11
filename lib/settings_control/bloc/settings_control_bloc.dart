// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_control_event.dart';
part 'settings_control_state.dart';

//TODO: persist settings??? listener?

class SettingsControlBloc
    extends Bloc<SettingsControlEvent, SettingsControlState> {
  SettingsControlBloc() : super(const SettingsControlState()) {
    on<SettingsSizeTapped>(_onSettingsSizeTapped);
    on<SettingsSameShuffleToggle>(_onSettingsSameShuffleToggle);
    on<SettingsOverlayNumbersToggle>(_onSettingsOverlayNumbersToggle);
    on<SettingsRecordMovesToggle>(_onSettingsRecordMovesToggle);
  }

  void _onSettingsSizeTapped(
    SettingsSizeTapped event,
    Emitter<SettingsControlState> emit,
  ) {
    emit(
      state.copyWith(
        puzzleSize: event.puzzleSize,
      ),
      // NOTE: copyWith in SettingsControlState makes this cleaner
      // SettingsControlState(
      //   puzzleSize: event.puzzleSize,
      //   sameShuffle: state.sameShuffle,
      //   overlayNumbers: state.overlayNumbers,
      //   recordMoves: state.recordMoves,
      // ),
    );
  }

  void _onSettingsSameShuffleToggle(
    SettingsSameShuffleToggle event,
    Emitter<SettingsControlState> emit,
  ) {
    emit(
      state.copyWith(
        sameShuffle: !state.sameShuffle,
      ),
    );
  }

  void _onSettingsOverlayNumbersToggle(
    SettingsOverlayNumbersToggle event,
    Emitter<SettingsControlState> emit,
  ) {
    emit(
      state.copyWith(
        overlayNumbers: !state.overlayNumbers,
      ),
    );
  }

  void _onSettingsRecordMovesToggle(
    SettingsRecordMovesToggle event,
    Emitter<SettingsControlState> emit,
  ) {
    emit(
      state.copyWith(
        recordMoves: !state.recordMoves,
      ),
    );
  }
}
