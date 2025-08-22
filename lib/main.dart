import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stocks_cryto/app/module/app_module.dart';
import 'package:stocks_cryto/app/presentation/app_widget.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
