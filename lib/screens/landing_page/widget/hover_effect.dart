import 'package:flutter/material.dart';

class HoveringWidget extends StatefulWidget {
  const HoveringWidget({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  State<HoveringWidget> createState() => _HoveringWidgetState();
}

class _HoveringWidgetState extends State<HoveringWidget> {
  @override
  Widget build(BuildContext context) {
    // bool isHovering = false;
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          // isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          // isHovering = false;
        });
      },
      child: Column(
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: widget.color,
            ),
          ),
        ],
      ),
    );
  }
}
