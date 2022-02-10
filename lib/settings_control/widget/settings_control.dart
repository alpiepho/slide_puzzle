import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/settings_control/settings_control.dart';
//import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

// TODO(alpiepho): finish dialog, https://no-issue.

/// {@template audio_control}
/// Displays and allows to update the current settings of the puzzle.
/// {@endtemplate}
class SettingsControl extends StatelessWidget {
  /// {@macro audio_control}
  const SettingsControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final nameColor = theme.nameColor;
    final backgroundColor =
        theme.name == 'Simple' ? Colors.white : theme.buttonColor;
    final puzzleSize =
        context.select((SettingsControlBloc bloc) => bloc.state.size);
    final puzzleSize3x3 = puzzleSize == 3;
    final puzzleSize4x4 = puzzleSize == 4;
    final puzzleSize5x5 = puzzleSize == 5;
    final parentContext = context;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                backgroundColor: backgroundColor,
                title: Text(
                  'Settings',
                  style: TextStyle(color: nameColor),
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      CheckboxListTile(
                        title: Text(
                          '3 x 3',
                          style: TextStyle(color: nameColor),
                        ),
                        value: puzzleSize3x3,
                        onChanged: (val) {
                          parentContext
                              .read<SettingsControlBloc>()
                              .add(const SettingsSizeTapped(size: 3));
                        },
                      ),
                      CheckboxListTile(
                        title: Text(
                          '4 x 4',
                          style: TextStyle(color: nameColor),
                        ),
                        value: puzzleSize4x4,
                        onChanged: (val) {
                          parentContext
                              .read<SettingsControlBloc>()
                              .add(const SettingsSizeTapped(size: 4));
                        },
                      ),
                      CheckboxListTile(
                        title: Text(
                          '5 x 5',
                          style: TextStyle(color: nameColor),
                        ),
                        value: puzzleSize5x5,
                        onChanged: (val) {
                          parentContext
                              .read<SettingsControlBloc>()
                              .add(const SettingsSizeTapped(size: 5));
                        },
                      ),
                      CheckboxListTile(
                        title: Text(
                          'Same shuffle',
                          style: TextStyle(color: nameColor),
                        ),
                        value: false,
                        onChanged: null,
                      ),
                      CheckboxListTile(
                        title: Text(
                          'Overlay numbers',
                          style: TextStyle(color: nameColor),
                        ),
                        value: false,
                        onChanged: null,
                      ),
                      CheckboxListTile(
                        title: Text(
                          'Record moves',
                          style: TextStyle(color: nameColor),
                        ),
                        value: false,
                        onChanged: null,
                      ),
                    ],
                  ),
                ),
                // actions: <Widget>[
                //   TextButton(
                //     child: Text(
                //       'Done',
                //       style: TextStyle(color: nameColor),
                //     ),
                //     onPressed: () {
                //       Navigator.of(context).pop();
                //     },
                //   ),
                // ],
              );
            },
          );
        },
        child: Icon(
          Icons.settings,
          color: nameColor,
        ),
      ),
    );
  }
}
