import 'package:flutter/material.dart';

class ExpandedCard extends StatefulWidget {
  final double height;
  final double width;
  final Widget frontWidget;
  final Widget backWidget;
  final bool isExpanded;
  final Color backWidgetBgColor;

  const ExpandedCard(
      {super.key,
      required this.height,
      required this.width,
      required this.frontWidget,
      required this.backWidget,
      required this.isExpanded,
      this.backWidgetBgColor = Colors.white});

  @override
  State<ExpandedCard> createState() => _ExpandedCardState();
}

class _ExpandedCardState extends State<ExpandedCard> {
  bool isExpanded = false;
  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }

  @override
  void didUpdateWidget(covariant ExpandedCard oldWidget) {
    if (isExpanded != widget.isExpanded) {
      isExpanded = widget.isExpanded;
      setState(() {});
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: isExpanded ? 0 : widget.height * 0.8,
          height: isExpanded ? widget.height + 20 : widget.height,
          width: isExpanded ? widget.width + 35 : widget.width,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isExpanded ? 1 : 0,
            child: Material(
              elevation: 10,
              color: Colors.transparent,
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: widget.backWidgetBgColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned.fill(
                      child: Column(
                        children: [
                          Expanded(child: widget.backWidget),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: isExpanded ? widget.height * 0.65 : widget.height * 0.0,
          height: widget.height,
          width: widget.width,
          child: GestureDetector(
            onTap: () {
              // setState(() {
              //   isExpanded = !isExpanded;
              // });
            },
            child: Material(
              color: Colors.transparent,
              elevation: 20,
              child: widget.frontWidget,
            ),
          ),
        ),
      ],
    );
  }
}
