import 'package:expenseapp/models/expence_model.dart';
import 'package:hive/hive.dart';

class CatogoryAdapter extends TypeAdapter<ExpenceCatogory> {
  @override
  final int typeId = 2;

  @override
  ExpenceCatogory read(BinaryReader reader) {
    return ExpenceCatogory.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, ExpenceCatogory obj) {
    writer.writeByte(obj.index);
  }
}
