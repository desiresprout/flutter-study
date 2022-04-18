import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:clone_youtube/class/video.dart';
import 'package:clone_youtube/widgets/actionRow.dart';
import 'package:clone_youtube/widgets/actionInfo.dart';

class VideoInfo extends StatelessWidget {
  final Video video;

  const VideoInfo({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            '${video.viewCount} views • ${timeago.format(video.timestamp)}',
            style:
                Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
          ),
          const Divider(),
          ActionsRow(video: video),
          const Divider(),
          AuthorInfo(user: video.author),
          const Divider(),
        ],
      ),
    );
  }
}
