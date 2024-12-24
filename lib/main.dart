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
      home: const MainPage(), 
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
  bool _isLoggedIn = false; 

  
  void _onLoginSuccess(bool isSuccess) {
    if (isSuccess) {
      setState(() {
        _isLoggedIn = true; 
      });
      _pageController.jumpToPage(1); 
    } else {
      setState(() {
        _isLoggedIn = false; 
      });
      _pageController.jumpToPage(0); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          LoginPage(onLoginSuccess: _onLoginSuccess), 
          if (_isLoggedIn) const ToDoPage(), 
        if (_isLoggedIn) CalculatorPage(),
        ],
      ),
    );
  }
}
