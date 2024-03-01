import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/shared/utils/utils.dart';

class QRItemRow extends StatelessWidget {
  final String date;
  final String time;
  final String url;
  final bool backColorDifferent;

  const QRItemRow({
    Key? key,
    required this.date,
    required this.time,
    required this.url,
    required this.backColorDifferent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Material(
        elevation: 1.0,
        shadowColor: Colors.blueGrey,
        child: ListTile(
            visualDensity: const VisualDensity(horizontal: -4),
            tileColor: backColorDifferent ?  const Color(0XffF2F2F2) :  Colors.white,
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                         FaIcon(FontAwesomeIcons.solidCalendarDays, size: 15, color:  Config.primaryColor,),
                        const SizedBox(width: 10,),
                        Text(date, style: getTextStyle(size: 15.0, color: Config.primaryColor, weight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      children: [
                         FaIcon(FontAwesomeIcons.solidClock, size: 15, color: Config.primaryColor,),
                        const SizedBox(width: 10,),
                        Text(time, style: getTextStyle(size: 15.0, color: Config.primaryColor,),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                url,
                style: getTextStyle(),),
            )
        ),
      ),
    );
  }
}
