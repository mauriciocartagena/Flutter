import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
    ));
  }

  Widget _crearImagen() {
    return Container(
        width: double.infinity,
        child: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage(
              'https://www.photographytalk.com/images/articles/2017_1/iStock-545347988.jpg'),
          fit: BoxFit.cover,
          height: 250.0,
        ));
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: (Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Montañas hermosas', style: estiloTitulo),
                  SizedBox(height: 7.0),
                  Text('Montalla grandes muy bonitos', style: estiloSubtitulo),
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.red, size: 30.0),
            Text('41', style: TextStyle(fontSize: 20.0)),
          ],
        ),
      )),
    );
  }

  Widget _crearAcciones() {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'Share')
      ],
    ));
  }

  Widget _accion(IconData icon, String texto) {
    return (Column(
      children: <Widget>[
        Icon(icon, color: Colors.blue, size: 40.0),
        SizedBox(height: 5.0),
        Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue))
      ],
    ));
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          'Non esse labore culpa exercitation voluptate ut quis dolore id culpa qui non exercitation. Est commodo do id in et velit esse excepteur veniam sint aute non proident. Pariatur laborum proident veniam Lorem minim tempor nisi cillum Lorem ad. Nisi ad in Lorem pariatur nostrud. Fugiat elit incididunt aute elit elit occaecat fugiat sit reprehenderit anim irure tempor enim. Ullamco consequat exercitation proident ea elit. Ipsum ullamco ullamco aliquip ad ullamco laboris non excepteur exercitation. Et nostrud cillum exercitation qui nostrud. Ad sit anim fugiat deserunt enim non ea sit do aute tempor ex esse sint.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
