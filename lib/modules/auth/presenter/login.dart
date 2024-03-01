
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/shared/utils/utils.dart';
import 'package:sign_in_button/sign_in_button.dart';

class Login extends StatelessWidget {

  const Login({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _View();
  }
}

class _View extends StatelessWidget {
  const _View({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Config.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children:  [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0,),
                  child: SvgPicture.asset(
                    color: Colors.white,
                    'assets/images/logo_svg.svg',
                    semanticsLabel: 'Logo',
                    height: 80,
                    width: 80,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0,),
              child: Text(
                'Iniciar sesión',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0,),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0,),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0,),
              child: ElevatedButton(
                onPressed: () {
                  HapticFeedback.vibrate();
                  Navigator.pushNamedAndRemoveUntil(context, 'tabs', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: const Size.fromHeight(50), // NEW
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
                  child: Text(
                    'Iniciar sesión',
                    style: getTextStyle(size: 20.0, weight: FontWeight.w700, color: Config.primaryColor,),
                    ),
                  ),
                ),
              ),
            Text(
              '¿Haz olvidado tu contraseña?',
              style: getTextStyle(size: 12.0, weight: FontWeight.w400, color: Colors.white),
            ),
            const SizedBox(height: 40,),
            SignInButton(
              Buttons.google,
              text: 'Entra  con Google',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0,),
              onPressed: () {},
            ),
            const SizedBox(height: 40,),
            Text(
              '¿Aún no estás registrado?',
              style: getTextStyle(size: 12.0, weight: FontWeight.w400, color: Colors.white),
            ),
            GestureDetector(
              onTap: () {
                HapticFeedback.vibrate();
                Navigator.pushNamed(context, 'register');
              },
              child: Text(
                '¡Regístrate ahora!',
                style: getTextStyle(size: 12.0, weight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}