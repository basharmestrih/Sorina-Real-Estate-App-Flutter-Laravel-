class HomeModel {
  final int id;
  final String name;
  final String location;
  final String imgUrl;
  final String? description;
  final int Cost;

  final int? roomsNumber;
  final int? bathsNumber;
  final int? floorsNumber;
  final int? groundDistance;
  final int? buildingAge;

  final List<String>? mainFeatures;
  final bool? isFurnitured;
  final bool? isRent;
  final bool? isSell;

  HomeModel({
    required this.id,
    required this.name,
    required this.location,
    required this.imgUrl,
    required this.description,
    required this.Cost,

    this.roomsNumber,
    this.bathsNumber,
    this.floorsNumber,
    this.groundDistance,
    this.buildingAge,
    this.mainFeatures,
    this.isFurnitured,
    this.isRent,
    this.isSell,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      imgUrl: json['img_url'],
      description: json['description'],
      Cost: json["cost"],
      roomsNumber: json['rooms_number'],
      bathsNumber: json['baths_number'],
      floorsNumber: json['floors_number'],
      groundDistance: json['ground_distance'],
      buildingAge: json['building_age'],
      mainFeatures: json['main_features'] != null
          ? List<String>.from(json['main_features'])
          : null,
      isFurnitured: json['is_furnitured'],
      isRent: json['is_rent'] ?? false,
      isSell: json['is_sell'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'img_url': imgUrl,
      'description': description,
      'rooms_number': roomsNumber,
      'baths_number': bathsNumber,
      'floors_number': floorsNumber,
      'ground_distance': groundDistance,
      'building_age': buildingAge,
      'main_features': mainFeatures,
      'is_furnitured': isFurnitured,
      'is_rent': isRent,
      'is_sell': isSell,
    };
  }
}
