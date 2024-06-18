import 'package:flutter/material.dart';

class SubtractScreen extends StatelessWidget {
  const SubtractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subtração'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'configurações':
                  Navigator.pushNamed(context, '/configuration');
                  break;
                case 'sobre':
                  Navigator.pushNamed(context, '/about');
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'configurações', 'sobre'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade500],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 8.0],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Image.asset(
                  'assets/bt-sos.png',
                  width: 60,
                  height: 60,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/sos');
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/subtracao.png', // Coloque o caminho da sua imagem de soma aqui
                    width: 300, // Ajuste o tamanho da imagem conforme necessário
                    height: 300,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCircleButton(context, '4', '/erro'),
                      const SizedBox(width: 16),
                      _buildCircleButton(context, '6', '/erro'),
                      const SizedBox(width: 16),
                      _buildCircleButton(context, '0', '/parabens'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(BuildContext context, String number, String routeName) {
    return ElevatedButton(
      onPressed: () {
        if (number == '0') {
          Navigator.pushNamed(context, routeName);
        } else {
          Navigator.pushNamed(context, '/erro');
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor: Colors.blue, // Altere as cores conforme necessário
      ),
      child: Text(
        number,
        style: const TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
