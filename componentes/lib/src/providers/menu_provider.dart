import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  
  List<dynamic> opciones =[];

  //constructor
  _MenuProvider(){
    // cargarData();
  }

  //Future promete algo que si se cumplira igual que Promise
  Future<List<dynamic>> cargarData() async {

   final resp = await rootBundle.loadString('data/menu-opts.json');
    Map dataMap = json.decode(resp);
    opciones=dataMap['rutas'];
    return opciones;
  }

}
final menuProvider = new _MenuProvider();