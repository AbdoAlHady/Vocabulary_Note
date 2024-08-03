import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocabulary_note/data/models/note_model.dart';

class NoteModelTypeAdapter extends TypeAdapter<NoteModel> {
  @override
  NoteModel read(BinaryReader reader) {
    return NoteModel(
      text: reader.readString(),
      indexAddDataBase: reader.readInt(),
      colorCode: reader.readInt(),
      isArabic: reader.readBool(),
      similarArabicWords: reader.readStringList(),
      similarEnglishWords: reader.readStringList(),
      arabicExample:reader.readStringList(),
      englishExample: reader.readStringList(),
    );
  }

  @override
  int get typeId => 0;
  @override
  void write(BinaryWriter writer, NoteModel obj) {
    writer.writeString(obj.text);
    writer.writeInt(obj.indexAddDataBase);
    writer.writeInt(obj.colorCode);
    writer.writeBool(obj.isArabic);
    writer.writeStringList(obj.similarArabicWords);
    writer.writeStringList(obj.similarEnglishWords);
    writer.writeStringList(obj.arabicExample);
    writer.writeStringList(obj.englishExample);
  }
  
}