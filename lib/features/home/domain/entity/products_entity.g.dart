// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsEntityAdapter extends TypeAdapter<ProductsEntity> {
  @override
  final int typeId = 0;

  @override
  ProductsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      price: fields[3] as double,
      image: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductsEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
