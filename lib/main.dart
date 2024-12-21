import 'package:flutter/material.dart';
import 'login_page.dart';
import 'todo_page.dart';
import 'calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(), // Ana sayfa
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  bool _isLoggedIn = false; // Giriş durumu kontrolü

  // Giriş başarılı olduğunda yapılacak işlem
  void _onLoginSuccess(bool isSuccess) {
    if (isSuccess) {
      setState(() {
        _isLoggedIn = true; // Giriş başarılı olduğunda _isLoggedIn true olacak
      });
      _pageController.jumpToPage(1); // Giriş başarılıysa ToDoPage'e geç
    } else {
      setState(() {
        _isLoggedIn = false; // Giriş başarısızsa LoginPage'e geri dönülür
      });
      _pageController.jumpToPage(0); // Giriş başarısızsa LoginPage'e dön
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          LoginPage(onLoginSuccess: _onLoginSuccess), // LoginPage'e giriş fonksiyonu gönderilir
          if (_isLoggedIn) const ToDoPage(), // Giriş başarılıysa ToDoPage gösterilir
        if (_isLoggedIn) CalculatorPage(),
        ],
      ),
    );
  }
}
