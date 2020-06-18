import 'package:flutter/material.dart';
import 'package:preferenciasusuariosapp/src/pages/home_page.dart';
import 'package:preferenciasusuariosapp/src/pages/settings_page.dart';
import 'package:preferenciasusuariosapp/src/share_prefs/preferencias_usuario.dart';
 
void main() async{

  final prefs = new PreferenciasUsuario();
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initPrefs();
  runApp(MyApp());

}
 
class MyApp extends StatelessWidget {
  
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName     :(BuildContext context) => HomePage(),
        SettingsPage.routeName :(BuildContext context) => SettingsPage(),
      },
    );
  }
}