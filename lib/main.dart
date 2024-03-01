
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rq_soap/shared/configurations/ioc.dart';

import 'app.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
  ));

  ErrorWidget.builder = (FlutterErrorDetails details) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
      'Ha ocurrido un error: ${details.exceptionAsString()}',
      style: const TextStyle(color: Colors.white),
    ),
  );

  Ioc.setupIocDependency();

  runApp(const MyApp());
}
