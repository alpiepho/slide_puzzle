// ignore_for_file: prefer_const_constructors, avoid_redundant_argument_values

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';

void main() {
  final prefs = SharedPreferences.getInstance() as SharedPreferences;

  group('AudioControlBloc', () {
    group('AudioToggled', () {
      blocTest<AudioControlBloc, AudioControlState>(
        'emits a new state '
        'with muted equal to true '
        'if the current value is false',
        seed: () => AudioControlState(muted: false),
        build: () => AudioControlBloc(prefs),
        act: (bloc) => bloc.add(AudioToggled()),
        expect: () => <AudioControlState>[
          AudioControlState(muted: true),
        ],
      );

      blocTest<AudioControlBloc, AudioControlState>(
        'emits a new state '
        'with muted equal to false '
        'if the current value is true',
        seed: () => AudioControlState(muted: true),
        build: () => AudioControlBloc(prefs),
        act: (bloc) => bloc.add(AudioToggled()),
        expect: () => <AudioControlState>[
          AudioControlState(muted: false),
        ],
      );
    });
  });
}
