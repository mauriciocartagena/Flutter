import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/pages/alert_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData();
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context,AsyncSnapshot <List<dynamic>>  snapshot){
        return ListView(
          children: _listaItems(snapshot.data,context),
        );

      }
    );

    
  }

  List<Widget> _listaItems(List<dynamic> data,BuildContext context) {
    
    final List<Widget> opciones = [];

    //Sustraemos el List de rutas en mi caso el texto
    data.forEach((opt) { 
      final widgetTemp = ListTile(
        title:Text(opt['texto']),
        leading: getIcon(opt['icon']) ,
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){

          //Navegacion con expecificacion
          Navigator.pushNamed(context, opt['ruta']);
          //Navegacion sin expecificacion
          // final route = MaterialPageRoute(
          //   builder: (context)=> AlertPage()          
          // );
          // Navigator.push(context, route);
        },
      );

      opciones..add(widgetTemp) 
              ..add(Divider());
    });
    
    return opciones;
  }
}