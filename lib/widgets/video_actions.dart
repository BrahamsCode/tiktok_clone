import 'package:flutter/material.dart';
import '../models/video.dart';

class VideoActions extends StatelessWidget {
  final Video video;

  const VideoActions({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Picture
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
          ),
          child: ClipOval(
            child: Image.network(
              video.userPic,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        
        // Like Button
        Column(
          children: [
            const Icon(
              Icons.favorite,
              size: 35,
              color: Colors.white,
            ),
            const SizedBox(height: 4),
            Text(
              video.likes,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        
        // Comment Button
        Column(
          children: [
            const Icon(
              Icons.comment,
              size: 35,
              color: Colors.white,
            ),
            const SizedBox(height: 4),
            Text(
              video.comments,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        
        // Share Button
        Column(
          children: [
            const Icon(
              Icons.share,
              size: 35,
              color: Colors.white,
            ),
            const SizedBox(height: 4),
            Text(
              video.shares,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        
        // Music Disc
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            image: DecorationImage(
              image: NetworkImage(video.userPic),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}