// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EncomeModelAdapter extends TypeAdapter<EncomeModel> {
  @override
  final int typeId = 3;

  @override
  EncomeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EncomeModel(
      title: fields[0] as String,
      description: fields[1] as String,
      date: fields[3] as DateTime,
      time: fields[4] as DateTime,
      amount: fields[2] as double,
      catogory: fields[5] as EncomeCatogory,
    );
  }

  @override
  void write(BinaryWriter writer, EncomeModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.catogory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EncomeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
