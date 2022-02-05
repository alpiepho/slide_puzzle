import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:just_audio/just_audio.dart';
import 'package:very_good_slide_puzzle/settings_control/settings_control.dart';

/// {@template audio_control_listener}
/// Listens to the current audio status and mutes/unmutes audioPlayer accordingly.
/// {@endtemplate}
class SettingsControlListener extends StatefulWidget {
  /// {@macro audio_control_listener}
  const SettingsControlListener({
    Key? key,
    //this.audioPlayer,
    required this.child,
  }) : super(key: key);

  /// The audio player to be muted/unmuted when the audio status changes.
  //final AudioPlayer? audioPlayer;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  @override
  State<SettingsControlListener> createState() 
    => _SettingsControlListenerState();
}

class _SettingsControlListenerState extends State<SettingsControlListener> {
  @override
  void didChangeDependencies() {
    updateSettings(muted: context.read<SettingsControlBloc>().state.muted);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant SettingsControlListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateSettings(muted: context.read<SettingsControlBloc>().state.muted);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsControlBloc, SettingsControlState>(
      listener: (context, state) => updateSettings(muted: state.muted),
      child: widget.child,
    );
  }

  void updateSettings({required bool muted}) {
    //widget.audioPlayer?.setVolume(muted ? 0.0 : 1.0);
  }
}
