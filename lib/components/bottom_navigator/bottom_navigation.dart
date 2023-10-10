import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 452.0,
      height: 54.55,
      padding: const EdgeInsets.fromLTRB(46.76, 15.59, 46.76, 15.59),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Ícone de localização
          Icon(Icons.location_on, size: 30.0, color: Color(0xFF939393)),
          // Ícone de pesquisa
          Icon(Icons.search, size: 30.0, color: Color(0xFF939393)),
          // Ícone de notificações
          Icon(Icons.notifications_outlined,
              size: 30.0, color: Color(0xFF939393)),
          // Ícone de e-mail
          Icon(Icons.email_outlined, size: 30.0, color: Color(0xFF939393)),
        ],
      ),
    );
  }
}
