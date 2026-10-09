// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'category_model.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final String slug;
  final double price;
  final String description;
  final CategoryModel category;
  final List<String> images;
  final String creationAt;
  final String updatedAt;

  const ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: CategoryModel.fromJson(json['category']),
      images: List<String>.from(json['images']),
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'price': price,
      'description': description,
      'category': category.toJson(),
      'images': images,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      slug,
      price,
      description,
      category,
      images,
      creationAt,
      updatedAt,
    ];
  }
}
