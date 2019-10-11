import 'package:callma/config/callma_config.dart';
import 'package:flutter/material.dart';

class ProfessionalsHelper {
  static ImageProvider getPhoto(String photo) {
    try {
      return NetworkImage(photo);
    } catch (e) {
      return AssetImage(CallmaConfig.DEFAULT_PHOTO);
    }
  }
}
