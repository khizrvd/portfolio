import 'package:flutter/material.dart';

class CustomAnimation extends StatelessWidget {
  const CustomAnimation({
    Key? key,
    required this.animationController,
    required this.beginOffset,
    required this.endOffset,
    required this.child,
  }) : super(key: key);

  final AnimationController animationController;
  final Offset beginOffset;
  final Offset endOffset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: beginOffset, end: endOffset)
          .animate(animationController),
      child: FadeTransition(
        opacity: animationController,
        child: child,
      ),
    );
  }
}
