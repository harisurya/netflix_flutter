part of 'services.dart';

class MovieServices {
  static Future<List<Movie>> getMovies(
    int page,
  ) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&$page";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);

    List result = data['results'];

    return result.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<MovieDetail> getDetails({required int movieId}) async {
    String url =
        "https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=en-US";

    var response = await client.get(Uri.parse(url));

    var data = json.decode(response.body);

    List genres = (data as Map<String, dynamic>)["genres"];
    String language = "English";

    switch ((data)['original_language'].toString()) {
      case 'ja':
        language = "Japanese";
        break;
      case 'in':
        language = "Indonesian";
        break;
      case 'ko':
        language = "Korean";
        break;
      case 'en':
        language = "English";
        break;
    }
    return MovieDetail(Movie.fromJson(data),
        language: language,
        genres: genres
            .map((e) => (e as Map<String, dynamic>)['name'].toString())
            .toList());
  }

  static Future<List<Movie>> getUpComingMovies(
    int page,
  ) async {
    String url =
        "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=$page";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);

    List result = data['results'];
    return result.map((e) => Movie.fromJson(e)).toList();
  }
}
