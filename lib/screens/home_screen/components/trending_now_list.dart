import 'package:flutter/material.dart';
import 'package:movies_app/dummy_data.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/screens/detail_screen/movie_detail_screen.dart';

class TrendingNowList extends StatefulWidget {
  const TrendingNowList({Key? key}) : super(key: key);

  @override
  _TrendingNowListState createState() => _TrendingNowListState();
}

class _TrendingNowListState extends State<TrendingNowList> {
  int currentIndex = 1;

  late final pageController = PageController(
    viewportFraction: 0.7,
    initialPage: currentIndex,
  );

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              controller: pageController,
              itemCount: movies.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MovieDetailScreen(
                          movieModel: movies[i],
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: movies[i].name,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: currentIndex == i ? 5 : 15, horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white38,
                            blurRadius: 10,
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(movies[i].coverUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 900),
            builder: (_, value, __) {
              return Opacity(
                opacity: value,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        if (movies[currentIndex].y18plus)
                          const _MovieInfoCard(
                            child: Text(
                              '18+',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        _MovieInfoCard(
                          child: Text(
                            getTextByCategry(movies[currentIndex].movieCategry),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        _MovieInfoCard(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[700],
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                movies[currentIndex].rate.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      movies[currentIndex].name,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

getTextByCategry(MovieCategry movieCategry) {
  String string = '';

  switch (movieCategry) {
    case MovieCategry.action:
      string = 'Action';
      break;
    case MovieCategry.comedy:
      string = 'Comedy';
      break;
    case MovieCategry.romance:
      string = 'Romance';
      break;
    case MovieCategry.fantasy:
      string = 'Fantasy';
      break;
  }

  return string;
}

class _MovieInfoCard extends StatelessWidget {
  final Widget child;

  const _MovieInfoCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.white38,
            blurRadius: 10,
          )
        ],
      ),
      child: child,
    );
  }
}
