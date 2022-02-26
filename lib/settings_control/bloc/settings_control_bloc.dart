// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_control_event.dart';
part 'settings_control_state.dart';

class SettingsControlBloc
    extends Bloc<SettingsControlEvent, SettingsControlState> {
  SettingsControlBloc(this.prefs) : super(SettingsControlState()) {
    on<SettingsInitialized>(_onSettingsInitialized);
    on<SettingsSizeTapped>(_onSettingsSizeTapped);
    on<SettingsSameShuffleToggle>(_onSettingsSameShuffleToggle);
    on<SettingsOverlayNumbersToggle>(_onSettingsOverlayNumbersToggle);
    on<SettingsRecordMovesToggle>(_onSettingsRecordMovesToggle);
  }

  // TODO(alpiepho): base class for bloc with shared preferences, https:/URL-to-issue.
  late SharedPreferences prefs;

  Future<void> _loadPrefs() async {
    final packed = prefs.getString('settings') ?? '';
    final parts = packed.split(';');
    var index = 0;

    final version = parts[index++];
    if (version == '0.1') {
      state.puzzleSize = int.parse(parts[index++]);
      final sameShuffle = parts[index++] == 'true';
      state.sameShuffle = sameShuffle;
      final overlayNumbers = parts[index++] == 'true';
      state.overlayNumbers = overlayNumbers;
    }
  }

  // ignore: avoid_void_async
  void _savePrefs() async {
    var result = '';
    result += '0.1;';
    result += '${state.puzzleSize};';
    result += state.sameShuffle ? 'true;' : 'false;';
    result += state.overlayNumbers ? 'true;' : 'false;';
    await prefs.setString('settings', result);
  }

  void _onSettingsInitialized(
    SettingsInitialized event,
    Emitter<SettingsControlState> emit,
  ) {
    _loadPrefs();
    emit(
      state,
    );
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
    _savePrefs();
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
    _savePrefs();
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
    _savePrefs();
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
    _savePrefs();
  }
}
