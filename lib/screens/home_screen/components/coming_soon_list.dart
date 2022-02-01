import 'package:flutter/material.dart';
import 'package:movies_app/dummy_data.dart';

class ComingSoonMoviesList extends StatefulWidget {
  const ComingSoonMoviesList({Key? key}) : super(key: key);

  @override
  _ComingSoonMoviesListState createState() => _ComingSoonMoviesListState();
}

class _ComingSoonMoviesListState extends State<ComingSoonMoviesList> {
  final pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
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
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        itemCount: commingSoonMoviesList.length,
        itemBuilder: (ctx, i) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(commingSoonMoviesList[i].imageUrl),
                    colorFilter: const ColorFilter.mode(
                      Colors.black26,
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: Text(
                  commingSoonMoviesList[i].title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                      ),
                      Shadow(
                        blurRadius: 30,
                        color: Colors.black,
                      ),
                      Shadow(
                        blurRadius: 30,
                        color: Colors.orange,
                      ),
                      Shadow(
                        blurRadius: 30,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                right: 20,
                top: 20,
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              Positioned(
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.redAccent.withOpacity(0.7),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
