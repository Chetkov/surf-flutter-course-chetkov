class Coordinates {
  double latitude;
  double longitude;

  Coordinates(this.latitude, this.longitude);
}

class Sight {
  String sightName;
  Coordinates coordinates;
  String url;
  String details;
  String type;

  Sight(this.sightName, this.coordinates, this.url, this.details, this.type);
}
