class DataModel {
  late String name;
  late String description;
  late String location;
  late String imgSource;
  late int price;
  late int people;
  late int stars;

  DataModel({
    required this.name,
    required this.description,
    required this.location,
    required this.imgSource,
    required this.price,
    required this.people,
    required this.stars,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json["name"],
      description: json["description"],
      location: json["location"],
      imgSource: json["img"],
      price: json["price"],
      people: json["people"],
      stars: json["stars"],
    );
  }
}
