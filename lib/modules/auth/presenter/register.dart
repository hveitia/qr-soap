
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/shared/utils/utils.dart';
import 'package:sign_in_button/sign_in_button.dart';

class Register extends StatelessWidget {

  const Register({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _View();
  }
}

class _View extends StatelessWidget {
  const _View({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   _Body();
  }
}

class _Body extends StatelessWidget {
   _Body({Key? key,}) : super(key: key);

  final TextEditingController observationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 115,
        automaticallyImplyLeading: false,
        centerTitle:false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SvgPicture.asset(
            color: Colors.white,
            'assets/images/logo_svg.svg',
            semanticsLabel: 'Logo',
            height: 80,
            width: 80,
          ),
        ),
        backgroundColor: Config.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0,),
              child: Text(
                'Crear tu cuenta',
                style: TextStyle(
                  color: Config.primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0),
                  child: Text('Nombre', style: getTextStyle(size: 15.0,
                    color: Colors.grey,),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0,),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.grey[200],
                  enabledBorder:  const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0XffCCCED1)),
                  ),
                  focusedBorder:  const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0XffCCCED1)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0),
                  child: Text('E-mail', style: getTextStyle(size: 15.0,
                    color: Colors.grey,),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0,),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.grey[200],
                  enabledBorder:  const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0XffCCCED1)),
                  ),
                  focusedBorder:  const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0XffCCCED1)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0),
                  child: Text('Contraseña', style: getTextStyle(size: 15.0,
                    color: Colors.grey,),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0,),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.grey[200],
                  enabledBorder:  const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0XffCCCED1)),
                  ),
                  focusedBorder:  const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0XffCCCED1)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0, vertical: 15.0,),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Config.primaryColor,
                  minimumSize: const Size.fromHeight(50), // NEW
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 45.0, vertical: 15.0),
                  child: Text(
                    'Crear cuenta',
                    style: getTextStyle(size: 20.0,
                      weight: FontWeight.w700,
                      color: Colors.white,),
                  ),
                ),
              ),
            ),
            Text(
              'Al hacer click en crear cuenta estas aceptando nuestros términos, condiciones y política de privacidad.',
              textAlign: TextAlign.center,
              style: getTextStyle(
                  size: 12.0, weight: FontWeight.w400, color: Colors.grey),
            ),
            const SizedBox(height: 30,),
            SignInButton(
              Buttons.google,
              text: 'Entra  con Google',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0, vertical: 10.0,),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ));
  }
}