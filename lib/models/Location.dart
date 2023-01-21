class Location {
  String? _id;
  String? _public_place;
  String? _name;
  String? _landmark;
  String? _latitude;
  String? _longitude;
  String? _ward_id;


  Location(
      { String? id,
        String? public_place,
        String? name,
        String? landmark,
        String? latitude,
        String? longitude,
        String? ward_id}) {
    if (id != null) {
      this._id = id;
    }
    if (public_place != null) {
      this._public_place = public_place;
    }
    if (name != null) {
      this._name = name;
    }
    if (landmark != null) {
      this._landmark = landmark;
    }
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
    if (ward_id != null) {
      this._ward_id = ward_id;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get public_place => _public_place;
  set public_place(String? public_place) => _public_place = public_place;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get landmark => _landmark;
  set landmark(String? landmark) => _landmark = landmark;
  String? get latitude => _latitude;
  set latitude(String? latitude) =>
      _latitude = latitude;
  String? get longitude => _longitude;
  set longitude(String? longitude) =>
      _longitude = longitude;
  String? get ward_id => _ward_id;
  set ward_id(String? ward_id) => _ward_id = ward_id;

  Location.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _public_place = json['public_place'];
    _name = json['name'];
    _landmark = json['landmark'];
    _latitude = json['assembly_constituency'];
    _longitude = json['assembly_constituency_name'];
    _ward_id = json['ward_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['public_place'] = this._public_place;
    data['name'] = this._name;
    data['landmark'] = this._landmark;
    data['assembly_constituency'] = this._latitude;
    data['assembly_constituency_name'] = this._longitude;
    data['ward_id'] = this._ward_id;
    return data;
  }
}
