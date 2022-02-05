import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
//import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

/// {@template audio_control}
/// Displays and allows to update the current settings of the puzzle.
/// {@endtemplate}
class SettingsControl extends StatelessWidget {
  /// {@macro audio_control}
  const SettingsControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    // final audioMuted =
    //     context.select((AudioControlBloc bloc) => bloc.state.muted);
    // final audioAsset =
    //     audioMuted ? theme.audioControlOffAsset : theme.audioControlOnAsset;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.read<AudioControlBloc>().add(AudioToggled()),
        child: const AnimatedSwitcher(
          duration: PuzzleThemeAnimationDuration.backgroundColorChange,
          // child:
          // ResponsiveLayoutBuilder(
          //   key: Key(audioAsset),
          //   small: (_, __) => Image.asset(
          //     audioAsset,
          //     key: const Key('audio_control_small'),
          //     width: 24,
          //     height: 24,
          //   ),
          //   medium: (_, __) => Image.asset(
          //     audioAsset,
          //     key: const Key('audio_control_medium'),
          //     width: 33,
          //     height: 33,
          //   ),
          //   large: (_, __) => Image.asset(
          //     audioAsset,
          //     key: const Key('audio_control_large'),
          //     width: 33,
          //     height: 33,
          //   ),
          // ),
        ),
      ),
    );
  }
}
