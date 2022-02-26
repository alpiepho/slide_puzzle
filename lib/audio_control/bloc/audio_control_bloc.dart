// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'audio_control_event.dart';
part 'audio_control_state.dart';

class AudioControlBloc extends Bloc<AudioControlEvent, AudioControlState> {
  AudioControlBloc(this.prefs) : super(const AudioControlState()) {
    on<AudioInitialized>(_onAudioControlInitialized);
    on<AudioToggled>(_onAudioToggled);
  }

  late SharedPreferences prefs;

  Future<bool> _loadPrefs() async {
    final packed = prefs.getString('audio') ?? '';
    final parts = packed.split(';');
    if (parts.isNotEmpty) {
      var index = 0;
      final version = parts[index++];
      if (version == '0.1') {
        final muted = parts[index++] == 'true';
        return muted;
      }
    }
    return false;
  }

  // ignore: avoid_void_async
  void _savePrefs() async {
    var result = '';
    result += '0.1;';
    result += '${state.muted};';
    await prefs.setString('audio', result);
  }

  Future<void> _onAudioControlInitialized(
    AudioInitialized event,
    Emitter<AudioControlState> emit,
  ) async {
    final muted = await _loadPrefs();
    emit(AudioControlState(muted: muted));
  }

  void _onAudioToggled(AudioToggled event, Emitter<AudioControlState> emit) {
    emit(AudioControlState(muted: !state.muted));
    _savePrefs();
  }
}
