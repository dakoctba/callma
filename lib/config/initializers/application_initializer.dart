import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info/package_info.dart';

class ApplicationInitializer {
  static Future<void> initialize() async {
    await DotEnv().load('.env');

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // ignore: avoid_print
    print("${packageInfo.appName} (${packageInfo.version})");

    // ignore: avoid_print
    DotEnv().env.forEach((k, v) => print("$k = $v"));
  }
}
