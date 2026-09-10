import 'dart:convert';

class UserSession {
  final String accessToken;
  final String? refreshToken;

  UserSession({
    required this.accessToken,
    this.refreshToken,
  });

  UserSession copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return UserSession(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': accessToken,
      if (refreshToken != null) 'refresh_token': refreshToken,
    };
  }

  factory UserSession.fromMap(Map<String, dynamic> map) {
    return UserSession(
      accessToken: (map['token'] ?? map['accessToken'] ?? '') as String,
      refreshToken: (map['refresh_token'] ?? map['refreshToken']) as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSession.fromJson(String source) =>
      UserSession.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserSession(accessToken: $accessToken, refreshToken: $refreshToken)';

  @override
  bool operator ==(covariant UserSession other) {
    if (identical(this, other)) return true;
    return other.accessToken == accessToken && other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode;
}