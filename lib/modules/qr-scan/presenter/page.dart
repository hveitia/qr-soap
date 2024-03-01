import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/modules/qr-scan/bloc/qr_scan_bloc.dart';
import 'package:rq_soap/modules/qr-scan/presenter/_widgets/action_item.dart';
import 'package:rq_soap/modules/qr-scan/presenter/_widgets/container_circle.dart';
import 'package:rq_soap/shared/domain/analysis_result.dart';
import 'package:rq_soap/shared/utils/utils.dart';

class QRScanPage extends StatelessWidget {
  const QRScanPage({Key? key, required this.callback}) : super(key: key);

  final Function() callback;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QrScanBloc>(
      create: (BuildContext context) =>
      QrScanBloc()
        ..add(InitialEvent()),
      child: _View(callback: callback,),
    );
  }
}

class _View extends StatelessWidget{
  const _View({Key? key, required this.callback}) : super(key: key);
  final Function() callback;
  @override
  Widget build(BuildContext context) {
    return BlocListener<QrScanBloc, QrScanState>(
      listener: (context, state) {
      },
      child: _Body(callback: callback,),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key, required this.callback}) : super(key: key);
  final Function() callback;

  ContainerWithCircle getMessage(AnalysisResult analysisResult) {
    if (analysisResult.isSuspicious) {
      HapticFeedback.vibrate();
      return ContainerWithCircle(
        text: 'Analizamos la url que escaneaste esta puede no ser segura ya que ha sido denunciada en un servidor.',
        icon: FontAwesomeIcons.triangleExclamation,
        color: Config.urlSuspiciousColor,);
    } else if (analysisResult.isMalicious) {
      HapticFeedback.vibrate();
      return ContainerWithCircle(
        text: 'Analizamos la url que escaneaste esta no es segura no la deberías abrir, copiar, compartir y guardar.',
        icon: FontAwesomeIcons.xmark,
        color: Config.urlMaliciousColor,);
    } else {
      return ContainerWithCircle(
        text: 'Analizamos la url que escaneaste esta es segura puedes abrirla, copiar, compartir y guardar tu link.',
        icon: FontAwesomeIcons.check,
        color: Config.urlOkColor,);
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrScanBloc, QrScanState>(
      builder: (context, state) {
        if (state is CameraGetDataState) {
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
                        height: 110,
                        width: double.infinity,
                        color: const Color(0XFFF2F2F2),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    color: const Color(0XFF1E3050),
                                    'assets/images/window-maximize-regular.svg',
                                    semanticsLabel: 'windows',
                                    height: 25,
                                    width: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'URL',
                                    style: getTextStyle(
                                        size: 20.0,
                                        weight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  state.data,
                                  style: getTextStyle(
                                      size: 10.0,
                                      weight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      getMessage(state.analysisResult),
                      const SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              width: 100,
                              child: CustomItem(icon: FontAwesomeIcons
                                  .solidFolderOpen,
                                text: 'Abrir',
                                callback: () {
                                  HapticFeedback.vibrate();
                                  launchURL(context, state.data);
                                },)
                          ),
                          SizedBox(
                              width: 100,
                              child: CustomItem(icon: FontAwesomeIcons
                                  .solidCopy, text: 'Copiar', callback: () {})),
                          SizedBox(
                              width: 100,
                              child: CustomItem(icon: FontAwesomeIcons
                                  .solidBookmark,
                                  text: 'Guardar',
                                  callback: () {})),
                        ],
                      ),
                      const SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: 150,
                              child: CustomItem(icon: FontAwesomeIcons
                                  .solidStar,
                                  text: 'Favoritos',
                                  callback: () {})),
                          SizedBox(
                              width: 150,
                              child: CustomItem(icon: FontAwesomeIcons
                                  .shareNodes,
                                  text: 'Compartir',
                                  callback: () {})),
                        ],
                      ),
                    ],
                  ),
                ),
              )
          );
        } else if (state is CameraOpenedState) {
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
                      callback();
                      BlocProvider.of<QrScanBloc>(context).add(
                          CloseCameraAndGoHomeEvent());
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
                    onError: (context, error) =>
                        Text(
                          error.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                    qrCodeCallback: (code) {
                      var dataRead = code ?? '';
                      BlocProvider.of<QrScanBloc>(context).add(
                          CameraGetDataEvent(data: dataRead));
                    },
                  ),
                ),
              ),
            ),
          );
        } else if (state is CameraClosedAndGoHomeState) {
          return Container();
        }
        else {
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
                body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 20,),
                        Text(
                          'Estamos analizando tu url...',
                          style: getTextStyle(size: 20.0, color: Config.textColor, weight: FontWeight.w400),
                        ),
                      ],
                    )
                ),
              )
          );
        }
      },
    );
  }
}
