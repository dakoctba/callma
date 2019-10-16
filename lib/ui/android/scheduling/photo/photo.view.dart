import 'package:callma/helpers/professionals_helper.dart';
import 'package:flutter/material.dart';

class PhotoView extends StatefulWidget {
  final String _photo;

  PhotoView(this._photo);

  @override
  _PhotoViewState createState() => _PhotoViewState(_photo);
}

class _PhotoViewState extends State<PhotoView> {
  final String _photo;

  _PhotoViewState(this._photo);

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
