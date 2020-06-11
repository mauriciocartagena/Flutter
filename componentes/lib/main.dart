import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes APP',
      debugShowCheckedModeBanner: false,
       localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Espańol
      ],
      // home: HomePage(),
      //Ruta por defecto
      initialRoute: '/',
      //Rutas definidas
      routes: getApplicationRoutes(),
      //Sirve para las rutas que no esta definadas
      onGenerateRoute: (RouteSettings settings ){
        return MaterialPageRoute(
          builder: (BuildContext context)=>AlertPage()
        );

      },
    );
  }
}