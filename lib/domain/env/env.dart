import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConstants {
  const EnvConstants._();

  static String appName = dotenv.env['APP_NAME'] ?? '';
}
