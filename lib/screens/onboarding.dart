import 'package:client/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Onboarding extends StatelessWidget {
  Future<void> permissionsAndHome(BuildContext context) async {
    var permission = await Geolocator.requestPermission();

    if (permission != LocationPermission.always) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset('assets/images/location.png'),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      'This app collects location data to enable location tracking even when the app is closed or not in use. Only your current coordinates will be saved, whenever your location changes, your previous coordinates will be overwritten with the new ones. Your coordinates will be permanently removed upon app uninstallation.',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            RaisedButton.icon(
                label: Text('I understand'),
                icon: Icon(Icons.check),
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                onPressed: () async => await permissionsAndHome(context))
          ],
        ),
      ),
    );
  }
}
