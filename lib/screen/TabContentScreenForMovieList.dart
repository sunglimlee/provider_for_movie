import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_for_movie/Model/Movie.dart';
import 'package:provider_for_movie/provider/MovieChangeNotifierProvider.dart';

class TabContentScreenForMovieList extends StatelessWidget {
  TabContentScreenForMovieList({Key? key}) : super(key: key);
  MovieChangeNotifierProvider? _movies;

  @override
  Widget build(BuildContext context) {
    _movies = Provider.of<MovieChangeNotifierProvider>(context,
        listen: false); // 여기에서 listen 을 false 로 해주지 않으면 밑의 문장 실행하면서 build 가 계속 호출되게 된다. 성능저하발생. 중요한부분임.
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
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(height: 200, // 여기 감싸주고 있는 컨테이너를 좀더 예쁘게 바꾸려고 하네.
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(  // QnALayout
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 0),
                )
              ]
            ),
            //color: Colors.transparent,
            // Container 를 이용해서 세로의 길이를 미리 정해주었네. 바탕화면 배경색깔도 정해주었고.
            child: _makeMovieOne(movies[index]),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget _makeMovieOne(Movie movie) {
    return Row(
      children: [
        ClipRRect(borderRadius : BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)), child: Image.network(movie.posterUrl)),
        Expanded(child: Padding( // 여기 패딩 넣은거 잘봐라.. 컬럼이 상당히 맘에 든다.
          padding: const EdgeInsets.all(15.0),
          child: Column( // 예상대로 나머지 여백을 Expanded 로 에러없이 채운다. // Expanded 에는 Padding 을 넣지 말자.
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
                child: Text(movie.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              ),
              Expanded(child: Text(movie.overView,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                maxLines: 8, // overflow 와 함께 사용하자. Text 에 이런기능도 있네. // QnALayout
                overflow:TextOverflow.ellipsis,
              ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
