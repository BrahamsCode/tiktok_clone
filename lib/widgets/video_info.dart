import 'package:flutter/material.dart';
import '../models/video.dart';

class VideoInfo extends StatelessWidget {
  final Video video;

  const VideoInfo({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Username
          Text(
            video.username,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          
          // Description
          Text(
            video.description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          
          // Song info with marquee effect
          Row(
            children: [
              const Icon(
                Icons.music_note,
                size: 16,
                color: Colors.white,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  video.songName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}