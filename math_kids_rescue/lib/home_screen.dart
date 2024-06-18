import 'package:flutter/material.dart';
import 'constants.dart';
import 'about_screen.dart'; // Importe a tela de sobre
import 'profile_screen.dart'; // Importe a tela de perfil

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeContent(), // Aqui deve ser o conteúdo da sua HomeScreen atual
    ProfileScreen(), // Tela de perfil
    AboutScreen(), // Tela de sobre
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Sobre',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                width: 60, // Aumenta o tamanho do botão SOS
                height: 60, // Aumenta o tamanho do botão SOS
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/sos');
              },
            ),
          ),
          const SizedBox(height: 16), // Espaço entre o botão SOS e o texto
          const Text(
            'Bem-vindo!',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.fontColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'O que gostaria de\npraticar hoje?',
            style: TextStyle(fontSize: 24, color: AppColors.fontColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 22),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: [
                _buildGridButton(context, '+', const Color(0xFDC8CB0E), '/sum'),
                _buildGridButton(context, '—', const Color(0xFDD511C1), '/subtract'),
                _buildGridButton(context, 'x', const Color(0xFF33AA15), '/multiply'),
                _buildGridButton(context, '÷', const Color(0xFFD1180B), '/divide'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String symbol, Color color, String routeName) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Bordas arredondadas
        ),
        padding: const EdgeInsets.all(8), // Ajuste do preenchimento interno
        minimumSize: const Size(80, 80), // Tamanho do botão menor
        maximumSize: const Size(100, 100), // Tamanho máximo do botão
      ),
      child: Text(
        symbol,
        style: const TextStyle(
          fontSize: 70, // Aumenta o tamanho da fonte
          color: Colors.white,
        ),
      ),
    );
  }
}
