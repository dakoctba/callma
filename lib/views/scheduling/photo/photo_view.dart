import 'package:callma/config/callma_config.dart';
import 'package:callma/models/professional.dart';
import 'package:flutter/material.dart';

class PhotoView extends StatelessWidget {
  final Professional professional;

  PhotoView(this.professional);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child:
              professional.photo != null ? Image.network(professional.photo) : AssetImage(CallmaConfig.DEFAULT_PHOTO)),
    );
  }
}
