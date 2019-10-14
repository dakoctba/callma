import 'package:callma/settings.dart';
import 'package:flutter/material.dart';

class ProfessionalsHelper {
  static ImageProvider getPhoto(String photo) {
    try {
      return NetworkImage(photo);
    } catch (e) {
      return AssetImage(Settings.DEFAULT_PHOTO);
    }
  }
}
