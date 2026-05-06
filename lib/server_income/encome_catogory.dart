import 'package:expenseapp/models/income_model.dart';
import 'package:hive/hive.dart';

class EncomeCatogoryAdepter extends TypeAdapter<EncomeCatogory> {
  @override
  final int typeId = 4;

  @override
  EncomeCatogory read(BinaryReader reader) {
    return EncomeCatogory.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, EncomeCatogory obj) {
    writer.writeByte(obj.index);
  }
}
