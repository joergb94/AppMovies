
import 'package:app_movies/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '30c92d31ce662a4b92ef46be564d60ef';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language ='en-US';
  List <Movie> onDisplayMovies = [];
  List <Movie>  popularMovies = [];
  int _popularPage = 0;
  
  MoviesProvider(){
    print('start');

    getOnDisplayMovies();
    getPopularMovies();

  }
  Future <String> _getJsonData( String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl,endpoint, 
                          {
                            'api_key':_apiKey,
                            'laguage':_language,
                            'page':'$page'
                          });

    final response = await http.get(url);
    return  response.body;
  }

  getOnDisplayMovies() async {
    
  
    final decodedData = await _getJsonData('3/movie/now_playing',1); 
    final  onDisplayMoviesData = NowPlayingResponse.fromJson(decodedData);
           onDisplayMovies = onDisplayMoviesData.results;

    notifyListeners();
  }

  getPopularMovies() async{
    _popularPage ++;
    final decodedData = await _getJsonData('3/movie/popular',_popularPage); 
    final  popularMoviesData = PopularsResponse.fromJson(decodedData);
    popularMovies = [...popularMovies, ...popularMoviesData.results];
    notifyListeners();
  }
}

