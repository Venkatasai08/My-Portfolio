import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../globals/app_assets.dart';

class ProfileAnimation extends StatefulWidget {
  const ProfileAnimation({Key? key}) : super(key: key);

  @override
  _ProfileAnimationState createState() => _ProfileAnimationState();
}

class _ProfileAnimationState extends State<ProfileAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);

    _animation = Tween(begin: const Offset(0.05, 0.05), end: const Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Column(
        children: [
          Text(
            "With a peaceful mind....            ",
            style:
                GoogleFonts.calligraffitti(color: Colors.white, fontSize: 20),
          ),
          Text(
            "           ...The perfect developer ",
            style:
                GoogleFonts.calligraffitti(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              AppAssets.meTemple,
              width: 340,
              height: 420,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
