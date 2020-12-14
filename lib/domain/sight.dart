class Coordinates {
  double latitude;
  double longitude;

  Coordinates(this.latitude, this.longitude);
}

class Sight {
  String name;
  Coordinates coordinates;
  String imageUrl;
  String details;
  String type;

  Sight(this.name, this.coordinates, this.imageUrl, this.details, this.type);
}
