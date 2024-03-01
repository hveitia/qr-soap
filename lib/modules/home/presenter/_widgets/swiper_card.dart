
import 'package:flutter/material.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/shared/utils/utils.dart';

class SwiperCard extends StatelessWidget {
  const SwiperCard({Key? key, required this.img}) : super(key: key);
  final int img;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: GestureDetector(
              onTap: () {},
              child: FadeInImage(
                  height: double.infinity,
                  width: double.infinity,
                  image: NetworkImage('https://picsum.photos/600/300?random=$img'),
                  placeholder: const AssetImage('assets/images/loading.gif'),
                  fit: BoxFit.cover,
                  imageErrorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Image(image: AssetImage('assets/images/logo.png'));
                  }
              ),
            )), GestureDetector(
          child: Container(
            height: 200,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.50),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )
            ),
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                    '¿Por QUÉ ELEGIR secure QR Scan?',
                    style: getTextStyle(size: 20.0, color: Colors.white, weight: FontWeight.bold)
                ),
                const SizedBox(height: 5,),
                Text(
                    'Hay muchos qrs impostores en el espacio publico para ello hemos creado una aplicación que te permite saber si un qr es seguro o no.',
                    style: getTextStyle(size: 12.0, color: Colors.white, weight: FontWeight.normal)
                ),
              ],
            ),
          ),
          onTap: () {},
        )],
      ),
    );
  }
}
