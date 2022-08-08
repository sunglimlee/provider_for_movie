import 'dart:convert';
import 'package:provider_for_movie/Model/Movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  // [question] The instance member '_queryParam' can't be accessed in an initializer.
  // [answer] 사용하고자하는 Uri.https 를 함수안에다가 넣어줘야지.. 지금 같은 곳에다 넣어주면 어쩌누???
  final _queryParam = { // 잘봐라.. map 을 또 사용하고 있다.
    'api_key' : '02bcc8de57f1ecc5b32035317c3042b9'
  };

  // 데이터를 실지로 받아오는 부분
  Future<List<Movie>> loadMovies() async {
    var url = Uri.https('api.themoviedb.org', '/3/movie/popular', _queryParam);
    var response = await http.get(url);
    Map<String, dynamic> body = json.decode(response.body);
    if (body["results"] != null) {
      List<dynamic> list = body["results"]; // result 자체가 List 이다. 뭐가 들어있는? map 객체가 들어있는..
      //print(list.toString());
      //print(" 널이 아닐때");
      return list.map<Movie>((item)=> Movie.fromJson(item)).toList(); // 그래서 각각의 맵 객체들을 Movie 객체로 변환해서 다시 List 로 만들어주는 과정이고.
    } else {
      //print(" 여기는 바디 리절트가 널일때");
      return [];
    }
  }
}

