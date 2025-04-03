import 'package:flutter/material.dart';
import 'video_player_item.dart';
import '../models/video.dart';

class VideoFeed extends StatelessWidget {
  const VideoFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Video> videos = [
      Video(
        id: '1',
        username: '@user1',
        description: 'This is a cool video #trending',
        songName: 'Original Sound - User1',
        likes: '10.2K',
        comments: '1.2K',
        shares: '3.4K',        
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        userPic: 'https://randomuser.me/api/portraits/women/85.jpg',
      ),
      Video(
        id: '2',
        username: '@user2',
        description: 'Check this out! #fyp #viral',
        songName: 'Original Sound - User2',
        likes: '25.7K',
        comments: '3.5K',
        shares: '8.9K',        
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
        userPic: 'https://randomuser.me/api/portraits/men/32.jpg',
      ),
      Video(
        id: '3',
        username: '@user3',
        description: 'Just another day #lifestyle',
        songName: 'Original Sound - User3',
        likes: '5.3K',
        comments: '500',
        shares: '1.2K',        
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',

        userPic: 'https://randomuser.me/api/portraits/women/33.jpg',
      ),
    ];

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return VideoPlayerItem(
          video: videos[index],
        );
      },
    );
  }
}