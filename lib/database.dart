

class WeatherData {
  double long, lat;
  var location;
  void setCoordinates(double long, double lat) {
    this.lat = lat;
    this.long = long;
  }

  void setLocation(var location) {
    this.location = location;
  }
}
