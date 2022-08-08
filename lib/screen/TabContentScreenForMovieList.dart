import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_for_movie/Model/Movie.dart';
import 'package:provider_for_movie/provider/MovieChangeNotifierProvider.dart';

class TabContentScreenForMovieList extends StatelessWidget {
  TabContentScreenForMovieList({Key? key}) : super(key: key);
  MovieChangeNotifierProvider? _movies;

  @override
  Widget build(BuildContext context) {
    _movies = Provider.of<MovieChangeNotifierProvider>(context, listen: false); // 여기에서 listen 을 false 로 해주지 않으면 밑의 문장 실행하면서 build 가 계속 호출되게 된다. 성능저하발생. 중요한부분임.
    var a = _movies
        ?.loadMovies(); // 무비 불러드리고.. 어디로 들어가는데? 해당 클래스의 변수에 값이 들어가잖아.. 그럴려고 클래스로 만든거고..
    //print(" 리턴되 무비 리스트 $a");
    return Consumer<MovieChangeNotifierProvider>(
        builder: (context, movieChangeNotifierProvider, child) {
      if (movieChangeNotifierProvider.movies.isNotEmpty) {
        //print("무비의 값은 ${movieChangeNotifierProvider.movies.length}");
        return _makeListView(movieChangeNotifierProvider.movies);
      }
      return const Center(
        child: CircularProgressIndicator(), // 살짝 보였었어.. 그래서 여기에 있어야 된다.
      );
    });
  }

  // [question] The body might complete normally, causing 'null' to be returned, but the return type, 'Widget', is a potentially non-nullable type.
  // [answer] return 문이 들어가야 하거나. 아니면 null 처리를 해주던가..
  // [question] Error: Expected a value of type 'String', but got one of type 'Null'
  // [answer] 데이터 객체로 만들어줄 때 필드의 이름이 잘못되었었다. postpath -> post_path 로
  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        // 뭘해야할까? 리스트의 아이템을 만들어야지? 아마도 어떤 위젯도 될거같은데
        return Center(
          child: Text(movies[index].title),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
