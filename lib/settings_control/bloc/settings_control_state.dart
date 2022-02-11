// ignore_for_file: public_member_api_docs

part of 'settings_control_bloc.dart';

class SettingsControlState extends Equatable {
  const SettingsControlState({
    this.puzzleSize = 4,
    this.sameShuffle = false,
    this.overlayNumbers = false,
    this.recordMoves = false,
  });

  final int puzzleSize;
  final bool sameShuffle;
  final bool overlayNumbers;
  final bool recordMoves;

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
