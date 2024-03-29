import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;
  final AnimationController animationController;

  const VideoWidget({
    super.key,
    required this.videoUrl,
    required this.animationController,
  });

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoPlayerController;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then(
            (value) {
              if (mounted) {
                Future.delayed(const Duration(seconds: 1)).then(
                  (value) => setState(
                    () {
                      isLoading = false;
                    },
                  ),
                );
                widget.animationController.duration = _videoPlayerController.value.duration;
                _videoPlayerController.play();
                widget.animationController.forward();
                _videoPlayerController.setVolume(1);
              }
            },
          );

  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: isLoading
          ? Container(
              color: Colors.grey,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          : VideoPlayer(
              _videoPlayerController,
            ),
    );
  }
}
