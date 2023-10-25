class Car {
  Car({
    required this.name,
    required this.imagePath,
    required this.price,
    this.initialPrice,
    this.terminalPrice,
    this.launchDate,
     this.about,
    required this.reference,
    this.versions,
    this.totalVersion,
  });
  String name;
  String imagePath;
  String price;
  double? initialPrice;
  double? terminalPrice;
  String? launchDate;
  String? about;
  String reference;
  int? totalVersion;
  List<Version>? versions;
}

class Version {
  Version({
    required this.version,
    required this.fuelType,
    required this.transmissionType,
    required this.mileage,
    required this.price,
    required this.reference,
  });
  String version;
  String fuelType;
  String transmissionType;
  double mileage;
  double price;
  String reference;
}
