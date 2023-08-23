import 'package:avua/core/color_constants.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstant.primaryColor,
      width: width * 0.4,
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            trailing: const Text(
              "About",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Do something when the home tile is tapped.
            },
          ),
          ListTile(
            trailing: const Text(
              "Blogs",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Do something when the about tile is tapped.
            },
          ),
          ListTile(
            trailing: const Text(
              "Contact Us",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Do something when the settings tile is tapped.
            },
          ),
        ],
      ),
    );
  }
}
