enum MovieCategry {
  action,
  comedy,
  romance,
  fantasy,
}

class ActorModel {
  final String name;
  final String imageUrl;

  ActorModel({required this.name, required this.imageUrl});
}

class MovieModel {
  final String name;
  final String desc;
  final String duration;
  final String coverUrl;
  final bool y18plus;
  final double rate;
  final MovieCategry movieCategry;
  final List<ActorModel> actors;

  MovieModel({
    required this.name,
    required this.desc,
    required this.duration,
    required this.coverUrl,
    required this.actors,
    required this.rate,
    required this.y18plus,
    required this.movieCategry,
  });
}
