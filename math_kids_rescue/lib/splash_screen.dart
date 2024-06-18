import 'package:flutter/material.dart';
import 'dart:async';
import 'constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFBFD7EA), // Defina a cor de fundo aqui
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: 200, // Defina a largura da imagem
                height: 200, // Defina a altura da imagem
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain, // Ajuste o comportamento da imagem dentro do Container
                ),
              ),
              const SizedBox(height: 10), // Reduzi o espaçamento aqui
              const Text(
                'MATH KIDS RESCUE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.fontColor, // Defina a cor do texto
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
