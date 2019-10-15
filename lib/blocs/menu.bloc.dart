import 'package:flutter/material.dart';

class MenuBloc extends ChangeNotifier {
  int _selectedOption = 0;
  int get selectedOption => _selectedOption;

  void setOption(int option) {
    this._selectedOption = option;

    notifyListeners();
  }
}
