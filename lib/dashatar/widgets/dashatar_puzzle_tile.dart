import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/dashatar/dashatar.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/theme/themes/themes.dart';

import 'package:image/image.dart' as imglib;

abstract class _TileSize {
  static double small = 75;
  static double medium = 100;
  static double large = 112;
}

/// {@template dashatar_puzzle_tile}
/// Displays the puzzle tile associated with [tile]
/// based on the puzzle [state].
/// {@endtemplate}
class DashatarPuzzleTile extends StatefulWidget {
  /// {@macro dashatar_puzzle_tile}
  const DashatarPuzzleTile({
    Key? key,
    required this.tile,
    required this.state,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  /// The tile to be displayed.
  final Tile tile;

  /// The state of the puzzle.
  final PuzzleState state;

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<DashatarPuzzleTile> createState() => DashatarPuzzleTileState();
}

/// The state of [DashatarPuzzleTile].
@visibleForTesting
class DashatarPuzzleTileState extends State<DashatarPuzzleTile>
    with SingleTickerProviderStateMixin {
  AudioPlayer? _audioPlayer;
  late final Timer _timer;

  /// The controller that drives [_scale] animation.
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: PuzzleThemeAnimationDuration.puzzleTileScale,
    );

    _scale = Tween<double>(begin: 1, end: 0.94).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1, curve: Curves.easeInOut),
      ),
    );

    // Delay the initialization of the audio player for performance reasons,
    // to avoid dropping frames when the theme is changed.
    _timer = Timer(const Duration(seconds: 1), () {
      _audioPlayer = widget._audioPlayerFactory()
        ..setAsset('assets/audio/tile_move.mp3');
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer?.dispose();
    super.dispose();
  }

  // Image copyCrop(Image src, int x, int y, int w, int h) {
  //   // Make sure crop rectangle is within the range of the src image.
  //   src.
  //   x = x.clamp(0, src.width - 1).toInt();
  //   y = y.clamp(0, src.height - 1).toInt();
  //   if (x + w > src.width.toInt()) {
  //     w = src.width - x;
  //   }
  //   if (y + h > src.height) {
  //     h = src.height - y;
  //   }

  //   final dst = Image(
  //     width: w,
  //     height: h,
  //     src,
  //     image: src.image,
  //   );

  //   for (var yi = 0, sy = y; yi < h; ++yi, ++sy) {
  //     for (var xi = 0, sx = x; xi < w; ++xi, ++sx) {
  //       dst.setPixel(xi, yi, src.getPixel(sx, sy));
  //     }
  //   }

  //   return dst;
  // }

  List<Image> splitImage(List<int> input, int splitSize) {
    final output = <Image>[];

    // convert image to image from image package
    final image = imglib.decodeImage(input);

    if (image != null) {
      var x = 0, y = 0;
      final width = (image.width / splitSize).round();
      final height = (image.height / splitSize).round();

      // split image to parts
      List<imglib.Image> parts = [];
      for (var i = 0; i < splitSize; i++) {
        for (var j = 0; j < splitSize; j++) {
          parts.add(imglib.copyCrop(image, x, y, width, height));
          x += width;
        }
        x = 0;
        y += height;
      }

      // convert image from image package to Image Widget to display
      for (final img in parts) {
        final iList = imglib.encodeJpg(img);
        final u8List = Uint8List.fromList(iList);
        output.add(Image.memory(u8List));
      }
    }

    return output;
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.state.puzzle.getDimension();
    final theme = context.select((DashatarThemeBloc bloc) => bloc.state.theme);
    final status =
        context.select((DashatarPuzzleBloc bloc) => bloc.state.status);
    final hasStarted = status == DashatarPuzzleStatus.started;
    final puzzleIncomplete =
        context.select((PuzzleBloc bloc) => bloc.state.puzzleStatus) ==
            PuzzleStatus.incomplete;

    final movementDuration = status == DashatarPuzzleStatus.loading
        ? const Duration(milliseconds: 800)
        : const Duration(milliseconds: 370);

    final canPress = hasStarted && puzzleIncomplete;

    final img = Image.asset(
      theme.themeAsset, //.dashAssetForTile(widget.tile),
      //scale: 10,
      semanticLabel: context.l10n.puzzleTileLabelText(
        widget.tile.value.toString(),
        widget.tile.currentPosition.x.toString(),
        widget.tile.currentPosition.y.toString(),
      ),
      fit: BoxFit.cover,
    );
    // img.
    // // ignore: avoid_dynamic_calls
    // final img2 = IImage.copyCrop(img, 0, 0, 100, 100);

    return AudioControlListener(
      audioPlayer: _audioPlayer,
      child: AnimatedAlign(
        alignment: FractionalOffset(
          (widget.tile.currentPosition.x - 1) / (size - 1),
          (widget.tile.currentPosition.y - 1) / (size - 1),
        ),
        duration: movementDuration,
        curve: Curves.easeInOut,
        child: ResponsiveLayoutBuilder(
          small: (_, child) => SizedBox.square(
            key: Key('dashatar_puzzle_tile_small_${widget.tile.value}'),
            dimension: _TileSize.small,
            child: child,
          ),
          medium: (_, child) => SizedBox.square(
            key: Key('dashatar_puzzle_tile_medium_${widget.tile.value}'),
            dimension: _TileSize.medium,
            child: child,
          ),
          large: (_, child) => SizedBox.square(
            key: Key('dashatar_puzzle_tile_large_${widget.tile.value}'),
            dimension: _TileSize.large,
            child: child,
          ),
          child: (_) => MouseRegion(
            onEnter: (_) {
              if (canPress) {
                _controller.forward();
              }
            },
            onExit: (_) {
              if (canPress) {
                _controller.reverse();
              }
            },
            child: ScaleTransition(
              key: Key('dashatar_puzzle_tile_scale_${widget.tile.value}'),
              scale: _scale,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: canPress
                    ? () {
                        context.read<PuzzleBloc>().add(TileTapped(widget.tile));
                        unawaited(_audioPlayer?.replay());
                      }
                    : null,
                icon: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: img,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
