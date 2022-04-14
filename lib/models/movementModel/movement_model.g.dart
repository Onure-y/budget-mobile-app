// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovementModelAdapter extends TypeAdapter<MovementModel> {
  @override
  final int typeId = 1;

  @override
  MovementModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovementModel(
      movementName: fields[0] as String,
      time: fields[1] as int,
      moneyValue: fields[2] as double,
      category: fields[3] as CategoryModel,
    );
  }

  @override
  void write(BinaryWriter writer, MovementModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.movementName)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.moneyValue)
      ..writeByte(3)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovementModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
