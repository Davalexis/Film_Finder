import 'package:Film_Finder/API/tmbd_api_service.dart';
import 'package:Film_Finder/model/movie_model.dart';

class MovieRepository {

  final TmbdApiService apiService;


  MovieRepository(this.apiService);
  Future <List<Movie>> getPopularMovies(){
    return apiService.fetchPopularMovies();
  }
}