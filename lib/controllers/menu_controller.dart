import 'package:callma/enumerations/menu_option.dart';
import 'package:rxdart/subjects.dart';

class MenuController {
  final _menuController = BehaviorSubject<MenuOption>.seeded(MenuOption.home);
  Stream<MenuOption> get menuStream => _menuController.stream;

  MenuOption get option {
    return _menuController.value;
  }

  void setOption(MenuOption option) {
    _menuController.sink.add(option);
  }
}
