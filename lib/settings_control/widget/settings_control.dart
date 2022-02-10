import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/settings_control/settings_control.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

// TODO(alpiepho): finish dialog, https://no-issue.

/// {@template settings_control}
/// Displays dialog for application settings.
/// {@endtemplate}
class SettingsControl extends StatelessWidget {
  /// {@macro settings_control}
  const SettingsControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO(alpiepho): move to SettingsDialog, https://no-issue.
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
              return SettingsDialog(
                backgroundColor: backgroundColor,
                nameColor: nameColor,
                puzzleSize3x3: puzzleSize3x3,
                parentContext: parentContext,
                puzzleSize4x4: puzzleSize4x4,
                puzzleSize5x5: puzzleSize5x5,
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

/// dialog for settings
class SettingsDialog extends StatelessWidget {
  /// constructor
  const SettingsDialog({
    Key? key,
    required this.backgroundColor,
    required this.nameColor,
    required this.puzzleSize3x3,
    required this.puzzleSize4x4,
    required this.puzzleSize5x5,
    required this.parentContext,
  }) : super(key: key);

  /// theme background color
  final Color backgroundColor;

  /// theme text color
  final Color nameColor;

  /// initial value of checkbox
  final bool puzzleSize3x3;

  /// initial value of checkbox
  final bool puzzleSize4x4;

  /// initial value of checkbox
  final bool puzzleSize5x5;

  /// parent context for reporting settings changes
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      backgroundColor: backgroundColor,
      // title: Text(
      //   'Settings',
      //   style: TextStyle(color: nameColor),
      // ),
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
                Navigator.of(context).pop();
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
                Navigator.of(context).pop();
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
                Navigator.of(context).pop();
              },
            ),
            CheckboxListTile(
              title: Text(
                'Same shuffle',
                style: TextStyle(color: nameColor),
              ),
              value: false,
              onChanged: (val) {
                Navigator.of(context).pop();
              },
            ),
            CheckboxListTile(
              title: Text(
                'Overlay numbers',
                style: TextStyle(color: nameColor),
              ),
              value: false,
              onChanged: (val) {
                Navigator.of(context).pop();
              },
            ),
            CheckboxListTile(
              title: Text(
                'Record moves',
                style: TextStyle(color: nameColor),
              ),
              value: false,
              onChanged: (val) {
                Navigator.of(context).pop();
              },
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
  }
}
