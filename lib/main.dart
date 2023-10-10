import 'package:flutter/material.dart';
import 'View/profile_page/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPageIndex = 0; // Variável para rastrear a página atual

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Configurando o tema do aplicativo
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4E97FE)),
        useMaterial3: true,
      ),
      // Definindo a página inicial como a página de perfil
      home: ProfilePage(
        currentPageIndex: currentPageIndex,
        // Callback que será chamado quando uma guia for selecionada na página de perfil
        onTabSelected: (index) {
          setState(() {
            currentPageIndex = index; // Atualize o índice da página atual
          });
        },
      ),
    );
  }
}
