import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
Widget build(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 80.0, 
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 24, 14, 163), 
                Color.fromARGB(255, 46, 20, 230),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ), 
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 4), 
              ),
            ],
          ),
          child: Center(
            child: Text(
              "MENU", 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 30, 
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0, 
                shadows: [
                  Shadow(
                    color: Colors.black54, 
                    offset: Offset(2, 2), 
                    blurRadius: 4.0, 
                  ),
                ],
              ),
            ),
          ),
        ),

          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8.0), 
              decoration: BoxDecoration(
                color: Colors.blueAccent, 
                borderRadius: BorderRadius.circular(8.0), 
              ),
              child: Icon(
                Icons.home,
                color: Colors.white, 
              ),
            ),
            title: Text(
              "CURSOS", 
              style: const TextStyle(
                fontSize: 20.0, 
                color: Colors.black, 
                fontWeight: FontWeight.bold, 
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },
          ),
          
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8.0), 
              decoration: BoxDecoration(
                color: Colors.blueAccent, 
                borderRadius: BorderRadius.circular(8.0), 
              ),
              child: Icon(
                Icons.home,
                color: Colors.white, 
              ),
            ),
            title: Text(
              "FERIADOS", 
              style: const TextStyle(
                fontSize: 20.0, 
                color: Colors.black, 
                fontWeight: FontWeight.bold, 
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/holidays');
            },
          ),
          
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8.0), 
              decoration: BoxDecoration(
                color: Colors.blueAccent, 
                borderRadius: BorderRadius.circular(8.0), 
              ),
              child: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
            ),
            title: Text(
              "SAIR", 
              style: const TextStyle(
                fontSize: 20.0, 
                color: Colors.black, 
                fontWeight: FontWeight.bold, 
              ),
            ),
            onTap: () async {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
