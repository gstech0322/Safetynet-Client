import 'dart:isolate';
import 'dart:ui';

import 'package:background_locator/background_locator.dart';
import 'package:background_locator/location_dto.dart';

import '../../constants/api_constants.dart';
import '../helpers/get_token.dart';
import 'rest_api_service.dart';

Future<void> backgroundLocation() async {
  await BackgroundLocator.initialize();
  const String _isolateName = "LocatorIsolate";
  ReceivePort port = ReceivePort();
  IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  BackgroundLocator.registerLocationUpdate(_callback);
}

void _callback(LocationDto locationDto) async {
  var token = await getToken();
  var body = <String, dynamic>{
    'id': token,
    'lat': locationDto.latitude,
    'lon': locationDto.longitude
  };
  await RestCalls.put(UPDATE_LOCATION, body);
}
