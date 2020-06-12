import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () => _mostrarAlert(context),
          shape: StadiumBorder(),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed:() {
          //con esta parte nosotros podemos volver a la pagina anterior
          Navigator.pop(context);
        },
      ),
    );
  }   

  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      //el BarrierDismissible sirve para salir cuando damos clicks en la parte del != cuerpo del alert
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Esto es el contenido de la caja de alerta'),
              FlutterLogo(size: 100.0)
            ],
          ),
          actions: <Widget>[
            FlatButton(onPressed: ()=>Navigator.of(context).pop() , child: Text('Cancelar')),
            FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Ok'))
          ],
        );
      }
    );
  }

}