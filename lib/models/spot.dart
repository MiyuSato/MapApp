class Spot {
  int id;
  double lat;
  double long;
  double rating;
  int? type;
  String name;

  Spot(
      {required this.id,
      required this.lat,
      required this.long,
      required this.rating,
      this.type,
      required this.name});

  // factory Spot.fromJson(Map<String, dynamic> json) {
  //   return Spot(
  //     id: json["id"] as int,
  //     name: json["name"] as String,
  //     email: json["email"] as String,
  //   );
}
