
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/tabs/gf_tabbar.dart';
import 'package:getwidget/components/tabs/gf_tabbar_view.dart';
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/modules/favs/presenter/page.dart';
import 'package:rq_soap/modules/history/presenter/page.dart';
import 'package:rq_soap/modules/home/presenter/page.dart';
import 'package:rq_soap/modules/qr-scan/presenter/page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => TabsPageState();
}

class TabsPageState extends State<TabsPage> with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  var qrScannedData = '';

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: GFTabBarView(
            controller: tabController,
            children:  <Widget>[
              Home(callback: (String dataFromCamera) {
                setState(() {
                  qrScannedData = dataFromCamera;
                });
                tabController.animateTo(1);
              },),
              QRScanPage(callback: (){
                tabController.animateTo(0);
              },),
              const Fav(),
              const History(),
            ]),
        bottomNavigationBar: GFTabBar(
          length: 4,
          tabBarHeight:  75,
          indicatorWeight: 0.1,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          controller: tabController,
          tabBarColor: Config.primaryColor,
          unselectedLabelColor: Colors.grey[500],
          labelStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          tabs: const [
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.house,
              ),
              iconMargin: EdgeInsets.only(bottom: 1.0),
              text: 'Inicio',
            ),
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.qrcode,
              ),
              iconMargin: EdgeInsets.only(bottom: 5.0),
              text: 'QR Scan',
            ),
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.solidThumbsUp,
              ),
              iconMargin: EdgeInsets.only(bottom: 5.0),
              text: 'Favoritos',
            ),
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.book,
              ),
              iconMargin: EdgeInsets.only(bottom: 5.0),
              text: 'Historial',
            ),
          ],
        ),
      ),
    );
  }
}
