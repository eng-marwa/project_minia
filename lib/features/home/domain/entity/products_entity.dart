import 'package:hive_flutter/adapters.dart';

part 'products_entity.g.dart';

@HiveType(
  typeId: 0,
)
class ProductsEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final String image;
  bool? isFavorite;

  ProductsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.isFavorite = false,
  });
}
