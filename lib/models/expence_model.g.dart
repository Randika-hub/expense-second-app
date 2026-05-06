// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expence_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenceModelAdapter extends TypeAdapter<ExpenceModel> {
  @override
  final int typeId = 1;

  @override
  ExpenceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenceModel(
      expenceTitle: fields[0] as String,
      expenceDescription: fields[1] as String,
      expenceAmount: fields[2] as double,
      expenceDate: fields[3] as DateTime,
      expenceTime: fields[4] as DateTime,
      expenceCatogory: fields[5] as ExpenceCatogory,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenceModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.expenceTitle)
      ..writeByte(1)
      ..write(obj.expenceDescription)
      ..writeByte(2)
      ..write(obj.expenceAmount)
      ..writeByte(3)
      ..write(obj.expenceDate)
      ..writeByte(4)
      ..write(obj.expenceTime)
      ..writeByte(5)
      ..write(obj.expenceCatogory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
