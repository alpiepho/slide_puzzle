// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this.prefs, {required List<PuzzleTheme> initialThemes})
      : super(ThemeState(themes: initialThemes)) {
    on<ThemeInitialized>(_onThemeInitialized);
    on<ThemeChanged>(_onThemeChanged);
    on<ThemeUpdated>(_onThemeUpdated);
  }

  late SharedPreferences prefs;
  bool initialized = false;

  Future<int> _loadPrefs() async {
    final packed = prefs.getString('theme') ?? '';
    final parts = packed.split(';');
    if (parts.isNotEmpty) {
      var index = 0;
      final version = parts[index++];
      if (version == '0.1') {
        return int.parse(parts[index++]);
      }
    }
    return 0;
  }

  // ignore: avoid_void_async
  void _savePrefs(int themeIndex) async {
    var result = '';
    result += '0.1;';
    result += '$themeIndex;';
    await prefs.setString('theme', result);
  }

  Future<void> _onThemeInitialized(
    ThemeInitialized event,
    Emitter<ThemeState> emit,
  ) async {
    final themeIndex = await _loadPrefs();
    emit(state.copyWith(theme: state.themes[themeIndex]));
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
    _savePrefs(event.themeIndex);
  }

  void _onThemeUpdated(ThemeUpdated event, Emitter<ThemeState> emit) {
    final currentTheme = state.theme;
    final themeIndex =
        state.themes.indexWhere((theme) => theme.name == event.theme.name);

    // TODO(alpiepho): fix init vs dashatar theme change, https:/URL-to-issue.
    // on init, want to keep theme
    // on change, want what is below
    // NOTE mostly works, but blue/yellow dash are shown with green background
    if (themeIndex != -1) {
      final newThemes = [...state.themes];
      newThemes[themeIndex] = event.theme;
      if (initialized) {
        emit(
          state.copyWith(
            themes: newThemes,
            theme: event.theme,
          ),
        );
      } else {
        emit(
          state.copyWith(
            themes: newThemes,
            theme: currentTheme,
          ),
        );
        initialized = true;
      }
    }
  }
}
