// ignore_for_file: public_member_api_docs

part of 'settings_control_bloc.dart';

// ignore: must_be_immutable
class SettingsControlState extends Equatable {
  SettingsControlState({
    this.puzzleSize = 4,
    this.sameShuffle = false,
    this.overlayNumbers = false,
    this.recordMoves = false,
  });

  late int puzzleSize;
  late bool sameShuffle;
  late bool overlayNumbers;
  late bool recordMoves;

  @override
  List<Object> get props =>
      [puzzleSize, sameShuffle, overlayNumbers, recordMoves];

  SettingsControlState copyWith({
    int? puzzleSize,
    bool? sameShuffle,
    bool? overlayNumbers,
    bool? recordMoves,
  }) {
    return SettingsControlState(
      puzzleSize: puzzleSize ?? this.puzzleSize,
      sameShuffle: sameShuffle ?? this.sameShuffle,
      overlayNumbers: overlayNumbers ?? this.overlayNumbers,
      recordMoves: recordMoves ?? this.recordMoves,
    );
  }
}
