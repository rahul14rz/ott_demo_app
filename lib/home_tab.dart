import 'dart:async';

import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> bannerImages = [
    'assets/images/1.jpeg',
    'assets/images/2.jpeg',
    'assets/images/3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SliderWidget(),
        SizedBox(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  16.0,
                  30.0,
                  16.0,
                  0,
                ),
                child: Text(
                  'Trending TV Shows & Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: bannerImages.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        width: 125,
                        decoration: ShapeDecoration(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              bannerImages[index],
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int currentIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  List<String> bannerImages = [
    'assets/images/1.jpeg',
    'assets/images/2.jpeg',
    'assets/images/3.png',
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        if (currentIndex < 2) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }

        _pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeIn,
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.02, 0.2],
          colors: [
            Colors.black,
            Colors.transparent,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcOver,
      child: SizedBox(
        height: 475,
        child: PageView.builder(
          physics: const PageScrollPhysics(),
          controller: _pageController,
          itemCount: bannerImages.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Image.asset(
              bannerImages[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
