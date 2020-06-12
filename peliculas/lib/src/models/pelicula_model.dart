class Peliculas {
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList){

    if (jsonList==null) return;

    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

//creamos pelicula para volver a asignar
class Pelicula {
  //declaramos todos los objetos que tiene la pelicula 
  int voteCount;
  double popularity;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  //contructor
  Pelicula({
    this.voteCount,
    this.popularity,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });
  //asignacion
  Pelicula.fromJsonMap(Map<String,dynamic> json){

    voteCount         = json['vote_count'];
    id                = json['id'];
    video             = json['video'];
    posterPath        = json['poster_path'];
    adult             = json['adult'];
    backdropPath      = json['backdrop_path'];
    originalLanguage  = json['original_language'];
    popularity        = json['popularity']/1;
    originalTitle     = json['origina_title'];
    genreIds          = json['genre_ids'].cast<int>();
    title             = json['title'];
    voteAverage       = json['vote_average']/1;
    overview          = json['overview'];
    releaseDate       = json['release_date'];

  }
  getPosterImg(){
    if (posterPath==null) {
      return 'https://image.tmdb.org/t/p/original//naXUDz0VGK7aaPlEpsuYW8kNVsr.jpg';
    }
  return 'https://image.tmdb.org/t/p/original/$posterPath';
}
}



enum OriginalLanguage { KO, EN, ES }
