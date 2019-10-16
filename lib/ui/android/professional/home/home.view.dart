import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Consultas de hoje"),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Center(child: Text("Minhas consultas do dia")),
    );
  }
}
