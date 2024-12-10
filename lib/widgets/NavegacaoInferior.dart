import 'package:flutter/material.dart';

class buildBottomNavigationBar extends StatelessWidget {
  const buildBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cadastro');
            },
            icon: const Icon(Icons.add_circle_outline, color: Colors.white),
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
    );
  }
}