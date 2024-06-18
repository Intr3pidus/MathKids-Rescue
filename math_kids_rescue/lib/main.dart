import 'package:flutter/material.dart';
import 'screens/sum_screen.dart';
import 'screens/subtract_screen.dart';
import 'screens/multiply_screen.dart';
import 'screens/divide_screen.dart';
import 'configuration_screen.dart';
import 'about_screen.dart';
import 'sos_screen.dart';
import 'splash_screen.dart';
import 'erro_screen.dart';
import 'home_screen.dart'; // Importe as telas necessárias aqui
import 'parabens_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash', // Rota inicial após splash
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(), 
        '/sum': (context) => const SumScreen(),
        '/subtract': (context) => const SubtractScreen(),
        '/multiply': (context) => const MultiplyScreen(),
        '/divide': (context) => const DivideScreen(),
        '/configuration': (context) => const ConfigurationScreen(),
        '/about': (context) => const AboutScreen(),
        '/sos': (context) => const SosScreen(),
        '/erro': (context) => const ErroScreen(),
        '/parabens': (context) => const ParabensScreen(),
      },
    );
  }
}
