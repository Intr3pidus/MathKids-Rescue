import 'package:flutter/material.dart';
import 'package:math_kids_rescue/constants.dart';

class ErroScreen extends StatelessWidget {
  const ErroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Não foi dessa vez'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Que pena! Mas é errando\nque se aprende',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.fontColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Image.asset(
              'assets/triste.png', // Caminho da imagem de tristeza
              width: 200, // Tamanho da imagem
              height: 200,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a tela anterior
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16), backgroundColor: Colors.blue, // Cor do botão
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Tentar novamente',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
