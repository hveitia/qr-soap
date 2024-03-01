
import 'package:flutter/material.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/shared/utils/utils.dart';

class CustomItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function callback;

  const CustomItem({super.key, required this.icon, required this.text, required this.callback,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              icon,
              size: 40,
              color: const Color(0XFF1E3050)
          ),
          const SizedBox(height: 8),
          Text(
              text,
              style: getTextStyle(
                  size: 20.0,
                  color: const Color(0xFF3E415A),
                  weight: FontWeight.w400)
          ),
        ],
      ),
    );
  }
}