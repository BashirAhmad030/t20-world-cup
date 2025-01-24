import 'package:flutter/material.dart';

class HomeScreenItems extends StatelessWidget {
  final String title;

  final IconData iconData;

  final VoidCallback onpressed;

  const HomeScreenItems({
    required this.title,
    required this.iconData,
    required this.onpressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.purple,
        ),
        child: Column(
          children: [
            Icon(
              iconData,
              size: 90,
              color: Colors.white,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
