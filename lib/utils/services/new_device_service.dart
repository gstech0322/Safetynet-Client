import 'dart:io';

import 'location_service.dart';
import 'rest_api_service.dart';
import '../../constants/api_constants.dart';
import '../../modules/models/device.dart';

Future<String> newDevice(String token) async {
  var location = await determinePosition();
  var body =
      Device(token, lat: location.latitude, lon: location.longitude).toJson();

  var response = await RestCalls.post(NEW_DEVICE, body: body);

  if (response.statusCode != 500) {
    return response.body;
  }
  exit(0);
}
