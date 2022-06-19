import 'package:flutter/material.dart';
import 'package:ott_demo_app/videoplayer_screen.dart';

class LiveTvTab extends StatefulWidget {
  const LiveTvTab({Key? key}) : super(key: key);

  @override
  State<LiveTvTab> createState() => _LiveTvTabState();
}

class _LiveTvTabState extends State<LiveTvTab> {
  List<String> videoUrls = [
    'https://firebasestorage.googleapis.com/v0/b/ott-app-a9250.appspot.com/o/The%20Crew%20-%20E3%202013%20-%20Announcement%20Trailer%20%5BUK%5D.mp4?alt=media&token=6a4a4302-fa3d-4f04-b95f-99f913513ff0',
    'https://firebasestorage.googleapis.com/v0/b/ott-app-a9250.appspot.com/o/The%20Crew%20-%20Launch%20Trailer.mp4?alt=media&token=1f197a55-20df-45ba-bd4c-9df12d7b344a',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 125),
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VideoPlayerScreen(
                  videoUrl: videoUrls[0],
                ),
              ),
            );
          },
          child: Card(
            color: Colors.transparent,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.grey[700],
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/youtube.png',
                  height: 36,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VideoPlayerScreen(
                  videoUrl: videoUrls[1],
                ),
              ),
            );
          },
          child: Card(
            color: Colors.transparent,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.pink.shade100,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/youtube.png',
                  height: 36,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
