import 'package:flutter/material.dart';

class CounterChangeNotifierProvider extends ChangeNotifier {
  int _counter;

  CounterChangeNotifierProvider({counter = 0}) : _counter = counter;

  int get counter => _counter;

  increment() {
    _counter++;
    notifyListeners();
  }
}