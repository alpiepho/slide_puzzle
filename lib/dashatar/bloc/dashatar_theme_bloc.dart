// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:very_good_slide_puzzle/dashatar/dashatar.dart';

part 'dashatar_theme_event.dart';
part 'dashatar_theme_state.dart';

/// {@template dashatar_theme_bloc}
/// Bloc responsible for the currently selected [DashatarTheme].
/// {@endtemplate}
class DashatarThemeBloc extends Bloc<DashatarThemeEvent, DashatarThemeState> {
  /// {@macro dashatar_theme_bloc}
  DashatarThemeBloc(this.prefs, {required List<DashatarTheme> themes})
      : super(DashatarThemeState(themes: themes)) {
    on<DashatarThemeInitialized>(_onDashatarThemeInitialized);
    on<DashatarThemeChanged>(_onDashatarThemeChanged);
  }

  late SharedPreferences prefs;

  Future<int> _loadPrefs() async {
    final packed = prefs.getString('theme-dashatar') ?? '';
    final parts = packed.split(';');
    if (parts.isNotEmpty) {
      var index = 0;
      final version = parts[index++];
      if (version == '0.1') {
        return int.parse(parts[index++]);
      }
    }
    return 1;
  }

  // ignore: avoid_void_async
  void _savePrefs(int themeIndex) async {
    var result = '';
    result += '0.1;';
    result += '$themeIndex;';
    await prefs.setString('theme-dashatar', result);
  }

  Future<void> _onDashatarThemeInitialized(
    DashatarThemeInitialized event,
    Emitter<DashatarThemeState> emit,
  ) async {
    final themeIndex = await _loadPrefs();
    emit(state.copyWith(theme: state.themes[themeIndex]));
  }

  void _onDashatarThemeChanged(
    DashatarThemeChanged event,
    Emitter<DashatarThemeState> emit,
  ) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
    _savePrefs(event.themeIndex);
  }
}
