import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int? id;
  final String? name;
  final String? desc;
  final String? price;
  final String? priceAfter;
  final String? amount;
  final String? stock;
  final String? subCategoryId;
  final bool? isFavorite;
  final String? image;

  const ProductModel({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.priceAfter,
    this.amount,
    this.stock,
    this.subCategoryId,
    this.isFavorite,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        desc: json['desc'] as String?,
        price: json['price'] as String?,
        priceAfter: json['price_after'] as String?,
        amount: json['amount'] as String?,
        stock: json['stock'] as String?,
        subCategoryId: json['sub_category_id'] as String?,
        isFavorite: json['is_favorite'] as bool?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'desc': desc,
        'price': price,
        'price_after': priceAfter,
        'amount': amount,
        'stock': stock,
        'sub_category_id': subCategoryId,
        'is_favorite': isFavorite,
        'image': image,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      desc,
      price,
      priceAfter,
      amount,
      stock,
      subCategoryId,
      isFavorite,
      image,
    ];
  }
}
