import 'package:flutter/material.dart';
import 'constants.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/sos.png',
              width: 80, // Ajuste o tamanho da imagem conforme necessário
              height: 80,
            ),
            const SizedBox(height: 16),
            _buildContactSection(context),
            const SizedBox(height: 24),
            _buildPoliceSection(context),
            const SizedBox(height: 24),
            _buildCancelButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contato dos Responsáveis',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildContactItem(context, 'Mãe', '123456789', Icons.phone, const Color.fromARGB(255, 37, 44, 48)),
        _buildContactItem(context, 'Pai', '987654321', Icons.phone, const Color.fromARGB(255, 37, 44, 48)),
        _buildContactItem(context, 'Responsável 1', '555555555', Icons.phone, const Color.fromARGB(255, 37, 44, 48)),
        _buildContactItem(context, 'Responsável 2', '555555555', Icons.phone, const Color.fromARGB(255, 37, 44, 48)),
      ],
    );
  }

  Widget _buildContactItem(BuildContext context, String name, String number, IconData icon, Color iconColor) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        name,
        style: const TextStyle(color: AppColors.fontColor), // Cor da fonte vinda das constants.dart
      ),
      subtitle: Text(
        number,
        style: const TextStyle(color: AppColors.fontColor), // Cor da fonte vinda das constants.dart
      ),
      trailing: IconButton(
        icon: const Icon(Icons.phone, color: Colors.lightBlue),
        onPressed: () {
          // Implementar ação para ligar para o número
        },
      ),
    );
  }

  Widget _buildPoliceSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ligar para a Polícia',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListTile(
          leading: Image.asset(
            'assets/viatura.png',
            width: 50, // Ajuste o tamanho da imagem conforme necessário
            height: 50,
          ),
          title: const Text(
            'Polícia',
            style: TextStyle(color: AppColors.fontColor), // Cor da fonte vinda das constants.dart
          ),
          trailing: IconButton(
            icon: const Icon(Icons.phone, color: Colors.lightBlue),
            onPressed: () {
              // Implementar ação para ligar para a polícia
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 122, 118, 118),
      ),
      child: const Text('Cancelar', style: TextStyle(color: Colors.white),),
    );
  }
}
