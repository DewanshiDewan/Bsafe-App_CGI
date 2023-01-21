class User {
  String? _userId;
  String? _userName;
  String? _roleId;
  String? _roleName;
  String? _assemblyConstituency;
  String? _assemblyConstituencyName;
  String? _profileimage;

  User(
      {String? userId,
      String? userName,
      String? roleId,
      String? roleName,
      String? assemblyConstituency,
      String? assemblyConstituencyName,
      String? profileimage}) {
    if (userId != null) {
      this._userId = userId;
    }
    if (userName != null) {
      this._userName = userName;
    }
    if (roleId != null) {
      this._roleId = roleId;
    }
    if (roleName != null) {
      this._roleName = roleName;
    }
    if (assemblyConstituency != null) {
      this._assemblyConstituency = assemblyConstituency;
    }
    if (assemblyConstituencyName != null) {
      this._assemblyConstituencyName = assemblyConstituencyName;
    }
    if (profileimage != null) {
      this._profileimage = profileimage;
    }
  }

  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get userName => _userName;
  set userName(String? userName) => _userName = userName;
  String? get roleId => _roleId;
  set roleId(String? roleId) => _roleId = roleId;
  String? get roleName => _roleName;
  set roleName(String? roleName) => _roleName = roleName;
  String? get assemblyConstituency => _assemblyConstituency;
  set assemblyConstituency(String? assemblyConstituency) =>
      _assemblyConstituency = assemblyConstituency;
  String? get assemblyConstituencyName => _assemblyConstituencyName;
  set assemblyConstituencyName(String? assemblyConstituencyName) =>
      _assemblyConstituencyName = assemblyConstituencyName;
  String? get profileimage => _profileimage;
  set profileimage(String? profileimage) => _profileimage = profileimage;

  User.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _userName = json['userName'];
    _roleId = json['roleId'];
    _roleName = json['roleName'];
    _assemblyConstituency = json['assembly_constituency'];
    _assemblyConstituencyName = json['assembly_constituency_name'];
    _profileimage = json['profileimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['userName'] = this._userName;
    data['roleId'] = this._roleId;
    data['roleName'] = this._roleName;
    data['assembly_constituency'] = this._assemblyConstituency;
    data['assembly_constituency_name'] = this._assemblyConstituencyName;
    data['profileimage'] = this._profileimage;
    return data;
  }
}
