import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/shared/utils/utils.dart';

class ContainerWithCircle extends StatelessWidget {
  final double circleRadius = 80.0;
  final double circleBorderWidth = 8.0;
  final String text;
  final IconData icon;
  final Color color;

  const ContainerWithCircle({Key? key, required this.text, required this.icon, required this.color}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: circleRadius / 2.0),
          child: Container(
            height: 160,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Card(
                color: const Color(0XFFF2F2F2),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: Text(text,
                        textAlign: TextAlign.center,
                        style: getTextStyle(
                            size: 15.0,
                            color: const Color(0xFF032C3C),
                            weight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          width: circleRadius,
          height: circleRadius,
          decoration:
          ShapeDecoration(shape: const CircleBorder(), color: color),
          child: Padding(
            padding: EdgeInsets.all(circleBorderWidth),
            child: Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
          ),
        )
      ],
    );
  }
}