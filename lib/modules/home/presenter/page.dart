
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/modules/home/bloc/home_bloc.dart';
import 'package:rq_soap/shared/utils/utils.dart';
import 'package:rq_soap/shared/widgets/circle-container.dart';
import 'package:rq_soap/shared/widgets/qr-item-row.dart';

import '_widgets/swiper_card.dart';

class Home extends StatelessWidget {
    const Home({super.key, required this.callback});

  final Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc()..add(InitialEvent()),
      child:   _View(callback: callback,),
    );
  }
}

class _View extends StatelessWidget {
  const _View({Key? key, required this.callback}) : super(key: key);
  final Function(String) callback;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if(state is CameraGetDataState){
          BlocProvider.of<HomeBloc>(context).add(CloseCameraEvent());
          callback(state.data);
        }
      },
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  _getMostScannedQR() {
    return ['https://toshiro.precompro.com/menudigital',
      'https://andrescarnederes.c.om/menuplaza.pdf',
      'https://teriyaki.com.co/index.php',
      'https://picadasricasole.com/index.php',
    'https://picadasricasole.com/index.php'];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if(state is InitialState){
          return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  toolbarHeight: 115,
                  centerTitle:false,
                  title: SvgPicture.asset(
                    color: Colors.white,
                    'assets/images/logo_svg.svg',
                    semanticsLabel: 'Logo',
                    height: 80,
                    width: 80,
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: IconButton(
                        icon: const FaIcon(FontAwesomeIcons.circleUser),
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
                      SizedBox(
                        width: double.infinity,
                        height: 350,
                        child: Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return SwiperCard(img: index + 1,);
                            },
                            autoplay: true,
                            itemCount: 10,
                            viewportFraction: 0.9,
                            scale: 0.9,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 15, right: 90),
                        child: Text(
                          'Hay muchos QRs impostores en el espacio publico para ello hemos creado una aplicación que te permite saber si un qr es seguro o no.',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/vector.svg',
                              semanticsLabel: 'Vector',
                              height: 30,
                            ),
                            const SizedBox(width: 20,),
                            const Text('Tus Qrs más escaneados',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                fontSize: 22,
                              ),),
                          ],
                        ),
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            child: Material(
                              elevation: 1.0,
                              shadowColor: Colors.blueGrey,
                              child: ListTile(
                                dense: true,
                                visualDensity: const VisualDensity(horizontal: -4),
                                leading: CircleContainer(text: '${index + 1}'),
                                tileColor: Colors.white,
                                title: Text(
                                  _getMostScannedQR()[index],
                                  style: getTextStyle(),),
                              ),
                            ),
                          );
                        },
                        itemCount: _getMostScannedQR().length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/last-scan.svg',
                              semanticsLabel: 'Vector',
                              height: 30,
                            ),
                            const SizedBox(width: 20,),
                            const Text('Tus últimos scaneos',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                fontSize: 22,
                              ),),
                          ],
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
                floatingActionButton: FloatingActionButton.extended(
                  backgroundColor: Config.primaryColor,
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(OpenCameraEvent());
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  label: const Text('Scan now'),
                  icon: const Icon(Icons.qr_code),
                ),
              ));
        }else if(state is CameraOpenedState){
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: 115,
                centerTitle:false,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.xmark),
                    iconSize: 45,
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context).add(CloseCameraEvent());
                    },
                  ),
                ),
                backgroundColor: Config.primaryColor,
              ),
              body: Center(
                child: SizedBox(
                  height: 1000,
                  width: 500,
                  child: QRBarScannerCamera(
                    onError: (context, error) => Text(
                      error.toString(),
                      style: const TextStyle(color: Colors.red),
                    ),
                    qrCodeCallback: (code) {
                      var dataRead = code ?? '';
                      BlocProvider.of<HomeBloc>(context).add(CameraGetDataEvent(data: dataRead));
                    },
                  ),
                ),
              ),
            ),
          );
        }
        else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
