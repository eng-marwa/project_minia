import 'package:project_minia/features/home/data/model/products_model.dart';
import 'package:project_minia/features/home/domain/entity/products_entity.dart';

class ProductsMapper {
  ProductsMapper._();

  static ProductsEntity toEntity(Products product) {
    return ProductsEntity(
      id: product.id ?? 0,
      name: product.title ?? '',
      description: product.description ?? '',
      price: product.price ?? 0,
      image: product.images?.first ?? '',
    );
  }

  static Products toProducts(ProductsEntity e) {
    return Products(
      id: e.id,
      title: e.name,
      description: e.description,
      price: e.price,
      images: [e.image],
    );
  }
}
