// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'service_provider_model.dart';

class ServiceModel {
  final int? id;
  final String? name;
  final String? description;
  final String? category;
  final double? price;
  final String? image;
  final double? rating;
  final int? reviewCount;
  final List<String>? includes;
  final ServiceProviderModel? provider;
  ServiceModel({
    this.id,
    this.name,
    this.description,
    this.category,
    this.price,
    this.image,
    this.rating,
    this.reviewCount,
    this.includes,
    this.provider,
  });

  ServiceModel copyWith({
    int? id,
    String? name,
    String? description,
    String? category,
    double? price,
    String? image,
    double? rating,
    int? reviewCount,
    List<String>? includes,
    ServiceProviderModel? provider,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      includes: includes ?? this.includes,
      provider: provider ?? this.provider,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'image': image,
      'rating': rating,
      'reviewCount': reviewCount,
      'includes': includes,
      'provider': provider?.toMap(),
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] != null ? (map['id'] as num).toInt() : -1,
      name: map['name'] != null ? map['name'] as String : "unknown",
      description:
          map['description'] != null
              ? map['description'] as String
              : "not found description",
      category: map['category'] != null ? map['category'] as String : "public",
      price: map['price'] != null ? (map['price'] as num).toDouble() : 0.0,
      image: map['image'] as String?,
      rating: map['rating'] != null ? (map['rating'] as num).toDouble() : 0.0,
      reviewCount:
          map['review_count'] != null ? (map['review_count'] as num).toInt() : 0,
      includes:
          map['includes'] != null
              ? List<String>.from(map['includes'] as List)
              : null,
      provider:
          map['provider'] != null
              ? ServiceProviderModel.fromMap(
                map['provider'] as Map<String, dynamic>,
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) =>
      ServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeService(id: $id, name: $name, description: $description, category: $category, price: $price, image: $image, rating: $rating, reviewCount: $reviewCount, includes: $includes, provider: $provider)';
  }

  @override
  bool operator ==(covariant ServiceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.category == category &&
        other.price == price &&
        other.image == image &&
        other.rating == rating &&
        other.reviewCount == reviewCount &&
        listEquals(other.includes, includes) &&
        other.provider == provider;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        category.hashCode ^
        price.hashCode ^
        image.hashCode ^
        rating.hashCode ^
        reviewCount.hashCode ^
        includes.hashCode ^
        provider.hashCode;
  }
}
