class Movie {
  // 이미지, 제목, 설명이 넘어온다.  title, poster_path, overview 에서 데이터를 받아온다.
  String overView;
  String posterPath;
  String title;
  Movie({required this.overView, required this.posterPath, required this.title});

  factory Movie.fromJson(Map<String, dynamic> json) { // 즉 Json에서 받은 map 값을 가지고 Movie 객체를 만들어준다는 것, named constructor 를 통해서 붕어빵 찍어내듯 만들어낸다.
    return Movie(
      overView : json["overview"] as String,
      posterPath: json["poster_path"] as String,
      title : json["title"] as String
    );
  }


}