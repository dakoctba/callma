import 'package:callma/helpers/professionals_helper.dart';
import 'package:flutter/material.dart';

class PhotoView extends StatelessWidget {
  final String _photo;

  PhotoView(this._photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircleAvatar(
        backgroundImage: ProfessionalsHelper.getPhoto(_photo),
        backgroundColor: Colors.purple,
      )),
    );
  }
}
