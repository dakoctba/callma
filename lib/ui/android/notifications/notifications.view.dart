import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Notificações"),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Text("Você não tem nenhuma notificação"),
    );
  }
}
