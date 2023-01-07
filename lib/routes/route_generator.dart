import 'package:flutter/material.dart';

import '../pages/Home/home_page.dart';
class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
     final args = settings.arguments; 
     switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) =>  HomePage());
      default:
        return _errorRoute(); 
     }
     

  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Ups, ocurrio un error'),
        ),
      );
    });
  }
}