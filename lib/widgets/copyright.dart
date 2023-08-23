import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: 50,
      child: const Center(
        child: Text(
          "© Copyright 2023, All right reserved",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
