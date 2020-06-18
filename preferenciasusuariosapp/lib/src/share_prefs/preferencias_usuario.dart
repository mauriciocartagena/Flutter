import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  //Ninguna de estas propiedades se usa
  // bool    _colorSecundario;
  // int     _genero;
  // String _nombre;

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //Get y Set del genero

  get genero{
    return _prefs.getInt('genero') ?? 1;
  }
  set genero(int value){
    _prefs.setInt('genero', value);
  }

  //Get y Set del _colorSecundario
  get colorSecundario{
    return _prefs.getBool('colorSecundario') ?? false;
  }
  set colorSecundario(bool value){
    _prefs.setBool('colorSecundario',value);
  }

  //Get y Set del NombreUsuario
  get nombreUsuario{
    return _prefs.getString('nombreUsuario') ?? '';
  }
  set nombreUsuario(String value){
    _prefs.setString('nombreUsuario',value);
  }

  //Get y Set del ültimaPagina
  get ultimaPagina{
    return _prefs.getString('ultimaPagina') ?? 'home';
  }
  set ultimaPagina(String value){
    _prefs.setString('ultimaPagina',value);
  }





}