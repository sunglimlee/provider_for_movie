import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationChangeNotifierProvider extends ChangeNotifier {
  // 내가 생각하는게 맞네.. ChangeNotifierProvider 를 통해서 값을 변경시켜주고 그 변경된 값을 이용해서 새로운 화면이 보이도록 해주는구나.
  int _index = 0;
  int get currentPage => _index;
  updateCurrentPage(int index) {
    _index = index;
    notifyListeners();
  }
}