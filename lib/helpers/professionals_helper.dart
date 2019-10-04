import 'package:callma/config/callma_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProfessionalsHelper {
  static getPhoto(String photo) {
    if (DotEnv().env['ENVIRONMENT'] == 'development' || photo == null) {
      return AssetImage(CallmaConfig.DEFAULT_PHOTO);
    }

    return NetworkImage(photo);
  }
}
