
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rq_soap/modules/auth/presenter/login.dart';
import 'package:rq_soap/modules/auth/presenter/register.dart';
import 'package:rq_soap/modules/home/bloc/home_bloc.dart';
import 'package:rq_soap/modules/qr-scan/bloc/qr_scan_bloc.dart';

import 'configs/configs.dart';
import 'modules/tabs/presenter/page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
        BlocProvider<QrScanBloc>(
          create: (BuildContext context) => QrScanBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          duration: 1500,
          splash:  const Image(
            image: AssetImage(Config.splashIcon),
          ),
          splashIconSize: 1000,
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor:  Config.primaryColor,
          nextScreen: const Login(),
        ),
        routes: {
          'tabs': (BuildContext context) => const TabsPage(),
          'login': (BuildContext context) => const Login(),
          'register': (BuildContext context) => const Register(),

        },
      ),
    );
  }
}