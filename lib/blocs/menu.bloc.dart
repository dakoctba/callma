import 'package:bloc_pattern/bloc_pattern.dart';

class MenuBloc extends BlocBase {
  int _selectedOption = 0;
  int get selectedOption => _selectedOption;

  void setOption(int option) {
    this._selectedOption = option;

    notifyListeners();
  }
}
