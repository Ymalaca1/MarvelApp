class Heroes {
  String _name;
  String get name => _name;
  String _image;
  String get image => _image;
  String _description;
  String get description => _description;
  int _id;
  int get id => _id;

  Heroes({
    required String name,
    required String image,
    required String description,
    required int id,
  })  : _name = name,
        _image = image,
        _description = description,
        _id = id;

  factory Heroes.fromMap(Map<String, dynamic> map) {
    return Heroes(
      name: map["name"] ?? '',
      image:
          map["thumbnail"]["path"] + '.' + map["thumbnail"]["extension"] ?? '',
      description: map["description"] ?? '',
      id: map["id"] ?? '',
    );
  }
}
