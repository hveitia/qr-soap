import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, String url) async {
  final Uri urlToLaunch = Uri.parse(url);
  if (!await launchUrl(urlToLaunch)) {
    throw Exception('Could not launch $urlToLaunch');
  }
}

TextStyle getTextStyle ({size = 10.0, color = const Color(0xFF032C3C), weight = FontWeight.w300}) {
  return TextStyle(
    fontSize: size,
    fontWeight: weight,
    color: color,
    fontFamily: 'Poppins',
  );
}

InputDecoration getTextFieldDecoration() {
  return InputDecoration(
    filled: true,
    isDense: true,
    fillColor: const Color(0xFFF2F2F2),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: Color(0xFFB6B2B2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: Color(0xFFB6B2B2),),
    ),
  );
}
