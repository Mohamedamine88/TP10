import 'package:flutter/material.dart';
import 'pages/comptes_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Comptes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5E60CE),
          primary: const Color(0xFF5E60CE),
          secondary: const Color(0xFF56CFE1),
          surface: const Color(0xFFF7F7FB),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F7FB),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF5E60CE),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: const Color(0xFFFFFFFF),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
      home: ComptesPage(),
    );
  }
}
