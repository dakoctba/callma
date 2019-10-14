import 'package:callma/enumerations/menu_option.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class MenuBloc extends ChangeNotifier {
  final _menuBloc = BehaviorSubject<MenuOption>.seeded(MenuOption.home);
  Stream<MenuOption> get menuStream => _menuBloc.stream;

  MenuOption get option {
    return _menuBloc.value;
  }

  void setOption(MenuOption option) {
    _menuBloc.sink.add(option);
  }
}
