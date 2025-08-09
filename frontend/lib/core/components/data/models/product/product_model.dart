// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:frontend/core/utils/keys.dart';
import 'package:frontend/features/home/data/model/category_model.dart';

class ProductModel extends Equatable {
  final String id;
  final CategoryModel categoryId;
  final String title;
  final double price;
  final String poster;
  final String description;
  final List<String> images;
  final double rating;
  const ProductModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.price,
    required this.poster,
    required this.description,
    required this.images,
    required this.rating,
  });

  ProductModel copyWith({
    String? id,
    CategoryModel? categoryId,
    String? title,
    double? price,
    String? poster,
    String? description,
    List<String>? images,
    double? rating,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      price: price ?? this.price,
      poster: poster ?? this.poster,
      description: description ?? this.description,
      images: images ?? this.images,
      rating: rating ?? this.rating,
    );
  }

  /// كائن فاضي (empty product)
  factory ProductModel.empty() {
    return ProductModel(
      id: '_00',
      categoryId: CategoryModel.defaultCategory(),
      title: '',
      price: 0.0,
      poster: '',
      description: '',
      images: [],
      rating: 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ModelKeys.id: id,
      ModelKeys.categoryId: categoryId.id,
      ModelKeys.title: title,
      ModelKeys.price: price,
      ModelKeys.poster: poster,
      ModelKeys.description: description,
      ModelKeys.images: images,
      ModelKeys.rating: rating,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[ModelKeys.id],
      categoryId: CategoryModel.fromJson(
        json[ModelKeys.categoryId] as Map<String, dynamic>,
      ),
      title: json[ModelKeys.title],
      price: json[ModelKeys.price].toDouble(),
      poster: json[ModelKeys.poster],
      description: json[ModelKeys.description],
      images: List<String>.from(json[ModelKeys.images]),
      rating: json[ModelKeys.rating].toDouble(),
    );
  }

  @override
  String toString() {
    return """ProductModel( 
    id: $id, 
    categoryId: $categoryId, 
    title: $title, 
    price: $price, 
    poster: $poster, 
    description: $description, 
    images: $images, 
    rating: $rating
    )
""";
  }

  @override
  List<Object?> get props => [
    id,
    categoryId,
    title,
    price,
    poster,
    description,
    images,
    rating,
  ];
}
