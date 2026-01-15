import 'UserDto.dart';

class CurrentUser {
  CurrentUser({
    UserDto? user,
    String? accessToken,
    String? tokenType,
    bool? profileCompleted,
  }) {
    _user = user;
    _accessToken = accessToken;
    _tokenType = tokenType;
    _profileCompleted = profileCompleted;
  }

  CurrentUser.fromJson(dynamic json) {
    _user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _profileCompleted = json['profile_completed'];
  }
  UserDto? _user;
  String? _accessToken;
  String? _tokenType;
  bool? _profileCompleted;

  UserDto? get user => _user;
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  bool? get profileCompleted => _profileCompleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['profile_completed'] = _profileCompleted;
    return map;
  }
}
