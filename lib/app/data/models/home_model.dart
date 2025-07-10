class HomeModel {
  final int id;
  final String title;
  final String location;
  final String address;
  final String imgUrl;
  final String? description;
  final int price;

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
    required this.title,
    required this.location,
    required this.address,
    required this.imgUrl,
    required this.description,
    required this.price,

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
    id: json['id'] ?? 0,
    title: json['title']?.toString() ?? 'Unknown',
    location: json['location']?.toString() ?? 'Unknown',
    address: json['address']?.toString() ?? 'Unknown',
    imgUrl: json['img_url']?.toString() ?? '', // You can use a placeholder image here
    description: json['description']?.toString(),
    price: json["price"] ?? 0,
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
      'title': title,
      'location': location,
      'address': address,
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
