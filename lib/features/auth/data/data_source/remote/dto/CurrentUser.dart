import 'UserDto.dart';

class CurrentUser {
  CurrentUser({
      UserDto? user,
      String? accessToken, 
      String? tokenType,}){
    _user = user;
    _accessToken = accessToken;
    _tokenType = tokenType;
}

  CurrentUser.fromJson(dynamic json) {
    _user = json['user'] as UserDto?;
    _accessToken = json['access_token'] as String?;
    _tokenType = json['token_type'] as String?;
  }
  UserDto? _user;
  String? _accessToken;
  String? _tokenType;

  UserDto? get user => _user;
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    return map;
  }

}