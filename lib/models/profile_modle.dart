// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? city;
  final String? country;
  final String? image;
  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.city,
    this.country,
    this.image,
  });

  ProfileModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? city,
    String? country,
    String? image,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      city: city ?? this.city,
      country: country ?? this.country,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'city': city,
      'country': country,
      'image': image,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] != null ? map['id'] as int : -1,
      firstName:
          map['first_name'] != null ? map['first_name'] as String : "Unknow",
      lastName: map['last_name'] != null ? map['last_name'] as String : "Unknow",
      email: map['email'] != null ? map['email'] as String : "Unknow",
      city: map['city'] != null ? map['city'] as String : "Unknow",
      country: map['country'] != null ? map['country'] as String : "Unknow",
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileModle(id: $id, firstName: $firstName, lastName: $lastName, email: $email, city: $city, country: $country, image: $image)';
  }

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.city == city &&
        other.country == country &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        city.hashCode ^
        country.hashCode ^
        image.hashCode;
  }
}
