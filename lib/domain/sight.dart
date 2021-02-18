/// Класс для хранения координат места
class Coordinates {
  double latitude;
  double longitude;

  Coordinates(this.latitude, this.longitude);
}

/// Класс для хранения основной информации о месте
class Sight {
  String name;
  Coordinates coordinates;
  String imageUrl;
  String details;
  String type;

  Sight(this.name, this.coordinates, this.imageUrl, this.details, this.type);
}
