import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/video.dart';
import 'video_actions.dart';
import 'video_info.dart';

class VideoPlayerItem extends StatefulWidget {
  final Video video;

  const VideoPlayerItem({
    super.key,
    required this.video,
  });

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoPlayerController;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.video.videoUrl),
    )..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
      }).catchError((error) {
        // Manejo de errores
        print('Error al cargar el video: $error');
        setState(() {
          // Actualiza el estado para mostrar un mensaje de error
        });
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _videoPlayerController.play();
      } else {
        _videoPlayerController.pause();
      }
    });
  }

@override
Widget build(BuildContext context) {
  return Stack(
    fit: StackFit.expand, 
    children: [
      // Video Player
      GestureDetector(
        onTap: _togglePlayPause,
        child: Container(
          color: Colors.black,
          child: _videoPlayerController.value.isInitialized
              ? FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _videoPlayerController.value.size.width,
                    height: _videoPlayerController.value.size.height,
                    child: VideoPlayer(_videoPlayerController),
                  ),
                )
              : const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text(
                          'Cargando video...',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
          ),
        ),

        // Play/Pause Icon
        if (!_isPlaying)
          Center(
            child: Icon(
              Icons.play_arrow,
              size: 80,
              color: Colors.white.withOpacity(0.7),
            ),
          ),

        // Video Info (username, description, song)
        Positioned(
          bottom: 20,
          left: 10,
          child: VideoInfo(video: widget.video),
        ),

        // Video Actions (like, comment, share)
        Positioned(
          bottom: 20,
          right: 10,
          child: VideoActions(video: widget.video),
        ),
      ],
    );
  }
}
