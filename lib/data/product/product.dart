import 'package:freezed_annotation/freezed_annotation.dart';

import 'rating.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    int? id,
    String? title,
    double? price,
    String? category,
    String? image,
    Rating? rating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  static List<Product?>? fromJsonList(List<dynamic> json) {
    return json.map((e) => Product.fromJson(e)).toList();
  }
}
