import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apikey = 'e1725fb0bab58f907a1ba6409066dba4';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  Future<List <Pelicula>> _procesarRespuesta(Uri url) async{
    final resp = await http.get(url);
    final dataDecode =  json.decode(resp.body);

    final populares = new Peliculas.fromJsonList(dataDecode['results']);

    return populares.items;
  }

  Future<List<Pelicula>> getEncines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _languaje,
    });
    return await _procesarRespuesta(url);
  }
  Future<List<Pelicula>> getPopulares() async{
    
    //declaramos la ruta donde podremos obtener las peliculas populares
    final url = Uri.https(_url, '3/movie/popular',{
       'api_key': _apikey,
      'language': _languaje,
    });
    //obtenemos la respueta de la Https
    return await _procesarRespuesta(url);

  }
}
