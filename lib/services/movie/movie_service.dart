import 'package:dio/dio.dart';
import 'package:what2watch/config/enviroment_config.dart';
import 'package:what2watch/model/movie/movie.dart';

class MovieService {
  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  MovieService(this._environmentConfig, this._dio);

  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieAPIKey}&language=en-US&page=1",
      );

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<Movie> movies = results
          .map((movieData) => Movie.fromMap(movieData))
          .toList(growable: false);
      return movies;
    } on DioError catch (dioError) {
      return List<Movie>.empty();
    }
  }
}
