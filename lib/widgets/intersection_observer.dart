// import 'package:flutter/material.dart';
// import 'package:visibility_detector/visibility_detector.dart';

// class IntersectionObserver extends StatefulWidget {
//   final Widget child;

//   const IntersectionObserver({required super.key, required this.child});

//   @override
//   State<IntersectionObserver> createState() => _IntersectionObserverState();
// }

// class _IntersectionObserverState extends State<IntersectionObserver> {
//   bool isVisible = false;
//   @override
//   Widget build(BuildContext context) {
//     return VisibilityDetector(
//       key: widget.key!,
//       onVisibilityChanged: (info) {
//         debugPrint("${info.visibleFraction}  contagct us");
//         setState(() {
//           isVisible = info.visibleFraction > 0; // Check if widget is visible
//         });
//       },
//       child: isVisible ? widget.child : const SizedBox(),
//     );
//   }
// }
