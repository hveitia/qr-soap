
import 'package:flutter/material.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/shared/utils/utils.dart';

class CircleContainer extends StatelessWidget {

  const CircleContainer({Key? key, required this.text,}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Config.textColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: getTextStyle(size: 12.0, color: Colors.white ),
          ),
        ],
      ),
    );
  }
}
