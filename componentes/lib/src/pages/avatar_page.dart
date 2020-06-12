import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  // Nombre del Widge otra forma de paginación
  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://nacion4.com/wp-content/uploads/2019/05/STAN-LEE-UN-INFIERNO-EN-SUS-ULTIMOS-A%C3%91OS-DE-VIDA.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
          child: FadeInImage(
        image: NetworkImage(
            'https://nacion4.com/wp-content/uploads/2019/05/STAN-LEE-UN-INFIERNO-EN-SUS-ULTIMOS-A%C3%91OS-DE-VIDA.jpg'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
      )),
    );
  }
}
