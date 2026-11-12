import 'package:flutter/material.dart';

import 'widgets/create_story_item.dart';
import 'widgets/story_item.dart';
import 'widgets/post_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/facebook.png', width: 156),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/add.png', width: 22),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/search.png', width: 22),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/messenger.png', width: 22),
            ),
          ],
          bottom: const TabBar(
            labelColor: Color(0xFF1877F2),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF1877F2),
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.zero,
            tabs: [
              Tab(
                icon: ImageIcon(AssetImage('assets/icons/home.png'), size: 25),
              ),
              Tab(
                icon: ImageIcon(AssetImage('assets/icons/video.png'), size: 25),
              ),
              Tab(
                icon: ImageIcon(AssetImage('assets/icons/store.png'), size: 25),
              ),
              Tab(
                icon: ImageIcon(
                  AssetImage('assets/icons/profile.png'),
                  size: 25,
                ),
              ),
              Tab(
                icon: ImageIcon(
                  AssetImage('assets/icons/notification.png'),
                  size: 25,
                ),
              ),
              Tab(
                icon: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/images/account.png'),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'What\u2019s in Your Mind?',
                        filled: false,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Image.asset('assets/icons/photos.png', width: 28),
                ],
              ),
            ),
            const Divider(height: 1),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(12),
                children: const [
                  CreateStoryItem(),
                  SizedBox(width: 12),
                  StoryItem(
                    image: 'assets/images/messi_story.png',
                    profile: 'assets/images/messi_avatar.png',
                  ),
                  SizedBox(width: 12),
                  StoryItem(
                    image: 'assets/images/yamal_story.png',
                    profile: 'assets/images/yamal_avatar.png',
                  ),
                  SizedBox(width: 12),
                  StoryItem(
                    image: 'assets/images/third_story.png',
                    profile: 'assets/images/third_avatar.png',
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            for (int i = 0; i < 10; i++) ...[
              const PostItem(),
              const Divider(height: 1),
            ],
          ],
        ),
      ),
    );
  }
}
