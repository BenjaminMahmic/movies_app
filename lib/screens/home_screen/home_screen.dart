import 'package:flutter/material.dart';

import 'components/coming_soon_list.dart';
import 'components/trending_now_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Icon(Icons.menu),
              title: Text('Hi Name'),
              titleSpacing: 0,
              actions: [
                Icon(Icons.notifications, color: Colors.grey),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/person.jpg'),
                ),
                SizedBox(width: 10),
              ],
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Coming Soon',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: ComingSoonMoviesList(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Trending Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 420,
                child: TrendingNowList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
