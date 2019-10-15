import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Consultas de hoje"),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Text("Minhas consultas do dia"),
    );
  }
}
