import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/shared/utils/utils.dart';
import 'package:rq_soap/shared/widgets/circle-container.dart';

class Fav extends StatelessWidget{
  const Fav({Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _View();
  }
}

class _View extends StatelessWidget{
  const _View({Key? key,}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends StatelessWidget{
  const _Body({Key? key,}): super(key: key);

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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.solidImage),
                iconSize: 45,
                onPressed: () {},
              ),
            ),
          ],
          backgroundColor: Config.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                              FontAwesomeIcons.solidStar,
                              size: 30,
                              color: Color(0XFF1FABDE)
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Favoritos',
                            style: getTextStyle(
                                size: 20.0,
                                color: const Color(0xFF032C3C),
                                weight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4),
                    leading: CircleContainer(text: '${index + 1}'),
                    tileColor: index % 2 != 0 ? Colors.white : const Color(
                        0XffF2F2F2),
                    title: Text(
                      _getMostScannedQR()[index],
                      style: getTextStyle(),),
                  );
                },
                itemCount: _getMostScannedQR().length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              Container(
                height: 70,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                              FontAwesomeIcons.solidBookmark,
                              size: 30,
                              color: Color(0XFF1FABDE)
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Restaurantes',
                            style: getTextStyle(
                                size: 20.0,
                                color: const Color(0xFF032C3C),
                                weight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4),
                    leading: CircleContainer(text: '${index + 1}'),
                    tileColor: index % 2 != 0 ? Colors.white : const Color(
                        0XffF2F2F2),
                    title: Text(
                      _getMostScannedQR()[index],
                      style: getTextStyle(),),
                  );
                },
                itemCount: _getMostScannedQR().length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}