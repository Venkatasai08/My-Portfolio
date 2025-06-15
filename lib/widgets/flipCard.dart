import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final Widget frontWidget;
  final Widget backWidget;
  final bool isFlipped;
  const FlipCard(
      {super.key,
      required this.frontWidget,
      required this.backWidget,
      required this.isFlipped});

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    // _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    if (widget.isFlipped == false) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCard() {
    if (widget.isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(FlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFlipped != widget.isFlipped) {
      _toggleCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final isFront = _controller.value < 0.5;
        final rotationAngle = _controller.value * 3.14159265359; // π for 180°

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Perspective
            ..rotateY(rotationAngle),
          child: isFront ? _buildFrontCard() : _buildBackCard(),
        );
      },
    );
  }

  Widget _buildFrontCard() {
    return widget.frontWidget;
  }

  Widget _buildBackCard() {
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateY(3.14159265359), // Flip back
        child: widget.backWidget);
  }
}
