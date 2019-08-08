import 'package:flutter/material.dart';
import '../CallmaColors.dart';

class CallmaBottomNavigationBar extends StatefulWidget {
  CallmaBottomNavigationBar({Key key}) : super(key: key);

  @override
  _CallmaBottomNavigationBarState createState() => _CallmaBottomNavigationBarState();
}

class _CallmaBottomNavigationBarState extends State<CallmaBottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);



  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Consultas')),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), title: Text('Notificações')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Configurações')),
        BottomNavigationBarItem(icon: Icon(Icons.help), title: Text('Ajuda')),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: CallmaColors.BACKGROUND_COLOR,
      selectedItemColor: Colors.white,
      unselectedItemColor: CallmaColors.VERDE_ESCURO,
      //fixedColor: backgroundColor,
      showSelectedLabels: false,   // <-- HERE
      showUnselectedLabels: false, // <-- AND HERE
    );
  }
}