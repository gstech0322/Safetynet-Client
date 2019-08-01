import 'package:geolocator/geolocator.dart';

Future<Position> determinePosition() async {
  return await Geolocator.getCurrentPosition();
}
