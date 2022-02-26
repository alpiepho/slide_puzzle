// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:very_good_slide_puzzle/dashatar/dashatar.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

import '../../helpers/helpers.dart';

void main() {
  final prefs = SharedPreferences.getInstance() as SharedPreferences;

  group('ThemeBloc', () {
    test('initial state is ThemeState', () {
      final themes = [MockPuzzleTheme()];
      expect(
        ThemeBloc(prefs, initialThemes: themes).state,
        equals(ThemeState(themes: themes)),
      );
    });

    group('ThemeChanged', () {
      late PuzzleTheme theme;
      late List<PuzzleTheme> themes;

      blocTest<ThemeBloc, ThemeState>(
        'emits new theme',
        setUp: () {
          theme = MockPuzzleTheme();
          themes = [MockPuzzleTheme(), theme];
        },
        build: () => ThemeBloc(prefs, initialThemes: themes),
        act: (bloc) => bloc.add(ThemeChanged(themeIndex: 1)),
        expect: () => <ThemeState>[
          ThemeState(themes: themes, theme: theme),
        ],
      );
    });

    group('ThemeUpdated', () {
      late List<PuzzleTheme> themes;

      blocTest<ThemeBloc, ThemeState>(
        'replaces the theme identified by name '
        'in the list of themes',
        setUp: () {
          themes = [
            /// Name: 'Simple'
            SimpleTheme(),

            ///  Name: 'Dashatar'
            GreenDashatarTheme(),
          ];
        },
        build: () => ThemeBloc(prefs, initialThemes: themes),
        act: (bloc) => bloc.add(ThemeUpdated(theme: YellowDashatarTheme())),
        expect: () => <ThemeState>[
          ThemeState(
            themes: const [
              /// Name: 'Simple'
              SimpleTheme(),

              ///  Name: 'Dashatar'
              YellowDashatarTheme(),
            ],
            theme: YellowDashatarTheme(),
          ),
        ],
      );
    });
  });
}
