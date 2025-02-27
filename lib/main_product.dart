import 'dart:async';

import 'package:base/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env.product");
  mainApp();
}
