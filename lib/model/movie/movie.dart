import 'dart:convert';

class Movie {
  String title;
  String posterPath;

  Movie({required this.title, required this.posterPath});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'posterPath': posterPath,
    };
  }

  String get fullImageURL => 'https://image.tmdb.org/t/p/w200$posterPath';

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      posterPath: map['poster_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
