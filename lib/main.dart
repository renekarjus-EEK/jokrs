import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/chuck_screen.dart';
import 'screens/prog_screen.dart';
import 'screens/corporate_screen.dart';
import 'screens/dad_screen.dart';
import 'screens/favorites_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Jokrs());
}

class Jokrs extends StatelessWidget {
  const Jokrs({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/chuck_screen': (context) => ChuckScreen(),
        '/prog_screen': (context) => ProgScreen(),
        '/corporate_screen': (context) => CorporateScreen(),
        '/dad_screen': (context) => DadScreen(),
        '/favorites_screen': (context) => FavoritesScreen(),
      },
      initialRoute: '/',
    );
  }
}
