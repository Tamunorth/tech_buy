import 'dart:io';

///The ImageFile was removed from the toJson modifer to preent Dio Errors on calls.
class AdminProductReq {
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String category;
  final List<File>? imageFiles;
  final List<String>? images;

//<editor-fold desc="Data Methods">

  const AdminProductReq({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    this.imageFiles,
    this.images,
  });

//<ed@override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdminProductReq &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          price == other.price &&
          quantity == other.quantity &&
          category == other.category &&
          imageFiles == other.imageFiles &&
          images == other.images);

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      category.hashCode ^
      imageFiles.hashCode ^
      images.hashCode;

  @override
  String toString() {
    return 'AdminProductReq{' +
        ' name: $name,' +
        ' description: $description,' +
        ' price: $price,' +
        ' quantity: $quantity,' +
        ' category: $category,' +
        ' imageFiles: $imageFiles,' +
        ' images: $images,' +
        '}';
  }

  AdminProductReq copyWith({
    String? name,
    String? description,
    double? price,
    double? quantity,
    String? category,
    List<File>? imageFiles,
    List<String>? images,
  }) {
    return AdminProductReq(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      imageFiles: imageFiles ?? this.imageFiles,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'description': this.description,
      'price': this.price,
      'quantity': this.quantity,
      'category': this.category,
      'images': this.images,
    };
  }

  factory AdminProductReq.fromJson(Map<String, dynamic> map) {
    return AdminProductReq(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as double,
      category: map['category'] as String,
      images: map['images'] as List<String>,
    );
  }
}
