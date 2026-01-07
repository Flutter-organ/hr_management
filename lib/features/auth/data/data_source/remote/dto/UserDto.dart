class UserDto {
  UserDto({
      int? id,
      String? email, 
      bool? isActive, 
      String? role,}){
    _id = id;
    _email = email;
    _isActive = isActive;
    _role = role;
}

  UserDto.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _isActive = json['is_active'];
    _role = json['role'];
  }
  int? _id;
  String? _email;
  bool? _isActive;
  String? _role;

  int? get id => _id;
  String? get email => _email;
  bool? get isActive => _isActive;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['is_active'] = _isActive;
    map['role'] = _role;
    return map;
  }

}