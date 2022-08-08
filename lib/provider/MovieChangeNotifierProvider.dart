import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_for_movie/Model/Movie.dart';
import 'package:provider_for_movie/repository/MovieRepository.dart';

class MovieChangeNotifierProvider extends ChangeNotifier {
  MovieRepository _movieRepository = MovieRepository();   // 프로바이더가 한번만 생성되는걸 알고 있지? create 합수를 이용해서, 반드시 Provide 에서 불러야한다. UI 에서 부르면 안된다.
  List<Movie> _movies = []; // 외부에서 접근 불가
  List<Movie> get movies => _movies;
  loadMovies() async {
    // respsitory 에 접근해서 데이터를 불러온다.
    List<Movie> listMovies = await _movieRepository.loadMovies();
    // listMovies 예외 처리해주고,
    // 추가적인 가공절차가 필요하다.
    _movies = listMovies;
    //print("값은 $_movies");
    notifyListeners(); // 데이터가 새롭게 불려들여왔으니 반영해라 라는 뜻
  }
}