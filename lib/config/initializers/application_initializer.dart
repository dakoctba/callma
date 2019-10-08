import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info/package_info.dart';

class ApplicationInitializer {
  static Future<void> initialize() async {
    await DotEnv().load('.env');

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    print("${packageInfo.appName} (${packageInfo.version})");

    DotEnv().env.forEach((k, v) => print("$k = $v"));
  }
}
