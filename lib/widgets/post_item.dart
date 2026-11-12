import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage('assets/images/route_avatar.png'),
          ),
          title: const Text(
            'Route',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              const Text(
                '8h ago ',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Image.asset('assets/icons/earth.png', width: 12),
            ],
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ),
        Image.asset(
          'assets/images/route_post.png',
          width: double.infinity,
          height: 250,
          fit: BoxFit.contain,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border),
            ),
          ],
        ),
      ],
    );
  }
}
