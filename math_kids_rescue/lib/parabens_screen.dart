import 'package:flutter/material.dart';
import 'package:math_kids_rescue/constants.dart';

class ParabensScreen extends StatelessWidget {
  const ParabensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parabéns!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Muito bem! Você concluiu\no exercício',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.fontColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Image.asset(
              'assets/parabens.png', // Caminho da imagem de parabéns
              width: 200, // Tamanho da imagem
              height: 200,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/home'));
                // Isso vai pop até a tela inicial, que é a HomeScreen
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16), backgroundColor: Colors.blue, // Cor do botão
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
