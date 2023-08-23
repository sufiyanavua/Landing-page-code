import 'package:flutter/material.dart';

class OnHoverWidget extends StatefulWidget {
  const OnHoverWidget({super.key, required this.child});
  final Widget child;
  @override
  State<OnHoverWidget> createState() => _OnHoverWidgetState();
}

class _OnHoverWidgetState extends State<OnHoverWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoverTransform = Matrix4.identity()..scale(1.3);
    final transform = isHovered ? hoverTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEnter(true),
      onExit: (event) => onEnter(false),
      child: AnimatedContainer(
        transform: transform,
        duration: const Duration(
          milliseconds: 400,
        ),
        child: widget.child,
      ),
    );
  }

  void onEnter(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
