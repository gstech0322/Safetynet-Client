import 'package:client/utils/helpers/get_token.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../utils/helpers/vibrate.dart';
import '../utils/services/send_alert_service.dart';
import '../utils/services/notifications_service.dart';
import '../utils/services/update_location_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await PushNotificationsManager().init();
    await backgroundLocation();
  }

  void loading() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator());
        });
  }

  Future<void> alert() async {
    loading();
    vibrate();
    var alerted = await sendAlert();
    Navigator.pop(context);
    CoolAlert.show(
      context: context,
      type: CoolAlertType.info,
      text: '$alerted device(s) have been alerted',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            await alert();
          },
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 3,
              child: Image.asset('assets/images/exclamation.png'),
            ),
          ),
        ),
      ),
    );
  }
}
