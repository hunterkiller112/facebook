import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key, required this.image, required this.profile});

  final String image;
  final String profile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              image,
              width: 112,
              height: 196,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 6,
            left: 6,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFF1877F2),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(profile),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
