import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/settings_control/settings_control.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

/// {@template settings_control}
/// Displays dialog for application settings.
/// {@endtemplate}
class SettingsControl extends StatelessWidget {
  /// {@macro settings_control}
  const SettingsControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final nameColor = theme.nameColor;
    final backgroundColor =
        theme.name == 'Simple' ? Colors.white : theme.buttonColor;
    final parentContext = context;
    final puzzleSize =
        context.select((SettingsControlBloc bloc) => bloc.state.puzzleSize);
    final sameShuffle =
        context.select((SettingsControlBloc bloc) => bloc.state.sameShuffle);
    final overlayNumbers =
        context.select((SettingsControlBloc bloc) => bloc.state.overlayNumbers);
    final recordMoves =
        context.select((SettingsControlBloc bloc) => bloc.state.recordMoves);

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
                parentContext: parentContext,
                puzzleSize: puzzleSize,
                sameShuffle: sameShuffle,
                overlayNumbers: overlayNumbers,
                recordMoves: recordMoves,
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
class SettingsDialog extends StatefulWidget {
  /// constructor
  const SettingsDialog({
    Key? key,
    required this.backgroundColor,
    required this.nameColor,
    required this.parentContext,
    required this.puzzleSize,
    required this.sameShuffle,
    required this.overlayNumbers,
    required this.recordMoves,
  }) : super(key: key);

  /// theme background color
  final Color backgroundColor;

  /// theme text color
  final Color nameColor;

  /// parent context for reporting settings changes
  final BuildContext parentContext;

  /// initial value for checkbox
  final int puzzleSize;

  /// initial value for checkbox
  final bool sameShuffle;

  /// initial value for checkbox
  final bool overlayNumbers;

  /// initial value for checkbox
  final bool recordMoves;

  @override
  State<SettingsDialog> createState() =>
      // ignore: no_logic_in_create_state
      _SettingsDialogState(
        puzzleSize: puzzleSize,
        sameShuffle: sameShuffle,
        overlayNumbers: overlayNumbers,
        recordMoves: recordMoves,
      );
}

class _SettingsDialogState extends State<SettingsDialog> {
  _SettingsDialogState({
    //BuildContext context,
    required this.puzzleSize,
    required this.sameShuffle,
    required this.overlayNumbers,
    required this.recordMoves,
  });

  late int puzzleSize;
  late bool sameShuffle;
  late bool overlayNumbers;
  late bool recordMoves;

  @override
  Widget build(BuildContext context) {
    final puzzleSize3x3 = puzzleSize == 3;
    final puzzleSize4x4 = puzzleSize == 4;
    final puzzleSize5x5 = puzzleSize == 5;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      backgroundColor: widget.backgroundColor,
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
                style: TextStyle(color: widget.nameColor),
              ),
              value: puzzleSize3x3,
              onChanged: (val) {
                // TODO reenable
                // widget.parentContext
                //     .read<SettingsControlBloc>()
                //     .add(const SettingsSizeTapped(puzzleSize: 3));
                // setState(() {
                //   puzzleSize = 3;
                // });
              },
            ),
            CheckboxListTile(
              title: Text(
                '4 x 4',
                style: TextStyle(color: widget.nameColor),
              ),
              value: puzzleSize4x4,
              onChanged: (val) {
                // TODO reenable
                //   widget.parentContext
                //       .read<SettingsControlBloc>()
                //       .add(const SettingsSizeTapped(puzzleSize: 4));
                //   setState(() {
                //     puzzleSize = 4;
                //   });
              },
            ),
            CheckboxListTile(
              title: Text(
                '5 x 5',
                style: TextStyle(color: widget.nameColor),
              ),
              value: puzzleSize5x5,
              onChanged: (val) {
                // TODO reenable
                //   widget.parentContext
                //       .read<SettingsControlBloc>()
                //       .add(const SettingsSizeTapped(puzzleSize: 5));
                //   setState(() {
                //     puzzleSize = 5;
                //   });
              },
            ),
            CheckboxListTile(
              title: Text(
                'Same shuffle',
                style: TextStyle(color: widget.nameColor),
              ),
              value: sameShuffle,
              onChanged: (val) {
                widget.parentContext
                    .read<SettingsControlBloc>()
                    .add(SettingsSameShuffleToggle());
                setState(() {
                  sameShuffle = !sameShuffle;
                });
                //Navigator.of(context).pop();
              },
            ),
            CheckboxListTile(
              title: Text(
                'Overlay numbers',
                style: TextStyle(color: widget.nameColor),
              ),
              value: overlayNumbers,
              onChanged: (val) {
                widget.parentContext
                    .read<SettingsControlBloc>()
                    .add(SettingsOverlayNumbersToggle());
                setState(() {
                  overlayNumbers = !overlayNumbers;
                });
                //Navigator.of(context).pop();
              },
            ),
            CheckboxListTile(
              title: Text(
                'Record moves',
                style: TextStyle(color: widget.nameColor),
              ),
              value: recordMoves,
              onChanged: (val) {
                widget.parentContext
                    .read<SettingsControlBloc>()
                    .add(SettingsRecordMovesToggle());
                setState(() {
                  recordMoves = !recordMoves;
                });
                //Navigator.of(context).pop();
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
