// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ServiceProviderModel {
  final int? id;
  final String? name;
  final String? specialty;
  final num? experienceYears; 
  final double? rating;
  final num? reviewCount;     
  final String? image;
  ServiceProviderModel({
    this.id,
    this.name,
    this.specialty,
    this.experienceYears,
    this.rating,
    this.reviewCount,
    this.image,
  });


  ServiceProviderModel copyWith({
    int? id,
    String? name,
    String? specialty,
    int? experienceYears,
    double? rating,
    int? reviewCount,
    String? image,
  }) {
    return ServiceProviderModel(
      id: id ?? this.id,
      name: name ?? this.name,
      specialty: specialty ?? this.specialty,
      experienceYears: experienceYears ?? this.experienceYears,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'specialty': specialty,
      'experienceYears': experienceYears,
      'rating': rating,
      'reviewCount': reviewCount,
      'image': image,
    };
  }

factory ServiceProviderModel.fromMap(Map<String, dynamic> map) {
    return ServiceProviderModel(
      id: map['id'] != null ? (map['id'] as num).toInt() : -1,
      name: map['name'] != null ? map['name'] as String : "Unknown",
      specialty: map['specialty'] != null ? map['specialty'] as String : "Not Specified",
      experienceYears: map['experience_years'] != null ? (map['experience_years'] as num).toInt() : 0,
      rating: map['rating'] != null ? (map['rating'] as num).toDouble() : 0.0,
      reviewCount: map['review_count'] != null ? (map['review_count'] as num).toInt() : 0,
      image: map['image'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProviderModel.fromJson(String source) => ServiceProviderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceProviderModel(id: $id, name: $name, specialty: $specialty, experienceYears: $experienceYears, rating: $rating, reviewCount: $reviewCount, image: $image)';
  }

  @override
  bool operator ==(covariant ServiceProviderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.specialty == specialty &&
      other.experienceYears == experienceYears &&
      other.rating == rating &&
      other.reviewCount == reviewCount &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      specialty.hashCode ^
      experienceYears.hashCode ^
      rating.hashCode ^
      reviewCount.hashCode ^
      image.hashCode;
  }
}
