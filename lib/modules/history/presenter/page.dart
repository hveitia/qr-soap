import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/shared/utils/utils.dart';
import 'package:rq_soap/shared/widgets/qr-item-row.dart';

class History extends StatelessWidget {
  const History({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _View();
  }
}

class _View extends StatelessWidget {
  const _View({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  _Body();
  }
}

class _Body extends StatelessWidget {
   _Body({Key? key,}) : super(key: key);
  final TextEditingController observationController = TextEditingController();
  final TextEditingController dateStartController = TextEditingController(text: '10 - 12 - 2023');
  final TextEditingController dateEndController = TextEditingController(text: '20 - 12 - 2023');

  _getMostScannedQR() {
    return ['https://toshiro.precompro.com/menudigital',
      'https://andrescarnederes.c.om/menuplaza.pdf',
      'https://teriyaki.com.co/index.php',
      'https://picadasricasole.com/index.php',
      'https://picadasricasole.com/index.php'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 115,
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
            actions: const [],
            backgroundColor: Config.primaryColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  color: Colors.white,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: observationController,
                          maxLines: 1,
                          decoration:  InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: const Color(0xFFF2F2F2),
                            suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass, color: Config.primaryColor,),
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(width: 1, color: Color(0xFFB6B2B2)),
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(width: 1, color: Color(0xFFB6B2B2),),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Fecha',
                              style: getTextStyle(
                                  size: 20.0,
                                  color: const Color(0xFF032C3C),
                                  weight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(FontAwesomeIcons.solidCalendarDays, color: Config.primaryColor,),
                            const SizedBox(width: 10,),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.38,
                            child: TextField(
                              controller: dateStartController,
                              maxLines: 1,
                              showCursor: false,
                              readOnly: true,
                              onTap: () async {
                                final date = await showDatePickerDialog(
                                  context: context,
                                  minDate: DateTime(2021, 1, 1),
                                  maxDate: DateTime(2025, 12, 31),
                                );
                                dateStartController.text =
                                    date.toString().substring(0, 10);
                              },
                              decoration:  getTextFieldDecoration(),
                            ),),
                            const SizedBox(width: 10,),
                            Icon(FontAwesomeIcons.solidCalendarDays, color: Config.primaryColor,),
                            const SizedBox(width: 10,),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.38,
                                child: TextField(
                                  controller: dateEndController,
                                  maxLines: 1,
                                  showCursor: false,
                                  readOnly: true,
                                  onTap: () async {
                                    final date = await showDatePickerDialog(
                                      context: context,
                                      minDate: DateTime(2021, 1, 1),
                                      maxDate: DateTime(2025, 12, 31),
                                    );
                                    dateEndController.text =
                                        date.toString().substring(0, 10);
                                  },
                                  decoration: getTextFieldDecoration(),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return QRItemRow(
                      date: '12 - 12 - 2021',
                      time: '12:12:45',
                      url: _getMostScannedQR()[index],
                      backColorDifferent: false,
                    );
                  },
                  itemCount: _getMostScannedQR().length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ));
  }
}