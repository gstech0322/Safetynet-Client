class Device {
  final String id;
  final double lat;
  final double lon;

  Device(this.id, {this.lat, this.lon});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'lat': lat, 'lon': lon};
  }
}
