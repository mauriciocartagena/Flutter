import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/models/actores_model.dart';

class PeliculasProvider {
  String _apikey = 'e1725fb0bab58f907a1ba6409066dba4';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';
  
  int _popularesProvider=0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function (List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams(){
    _popularesStreamController?.close();
  }




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
    
    if (_cargando) return [];

    _cargando = true;

    _popularesProvider++;

    print('cargando siguientes');
    //declaramos la ruta donde podremos obtener las peliculas populares
    final url = Uri.https(_url, '3/movie/popular',{
       'api_key'  : _apikey,
       'language' : _languaje,
       'page'     : _popularesProvider.toString()
    });

   final resp =  await _procesarRespuesta(url);

   _populares.addAll(resp);
   popularesSink(_populares);  

  _cargando=false;
   return resp;

  }

  Future <List <Actor>> getCast(String peliId) async{

    final url =Uri.https(_url, '3/movie/$peliId/credits',{
       'api_key': _apikey,
      'language': _languaje,
    });

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final cast = new Cast.fromJsonList(decodeData['cast']);

    return cast.actores;


  }

  Future<List<Pelicula>> buscarPelicula(String query) async {
    final url = Uri.https(_url, '3/search/movie', {
      'api_key': _apikey,
      'language': _languaje,
      'query'   :query
    });
    return await _procesarRespuesta(url);
  }
}
