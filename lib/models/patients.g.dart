// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 1;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      nom: fields[0] as String,
      prenom: fields[1] as String,
      birthday: fields[2] as String,
      age: fields[3] as String,
      sexe: fields[4] as String,
      sanguin: fields[5] as String,
      family: fields[6] as String,
      job: fields[7] as String,
      email: fields[8] as String,
      tel: fields[9] as String,
      cel: fields[10] as String,
      assurance: fields[11] as String,
      adresse: fields[12] as String,
      note: fields[13] == null ? 'none' : fields[13] as String,
      ant1: fields[14] == null ? 'none' : fields[14] as String,
      ant2: fields[15] == null ? 'none' : fields[15] as String,
      ant3: fields[16] == null ? 'none' : fields[16] as String,
      ant4: fields[17] == null ? 'none' : fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.nom)
      ..writeByte(1)
      ..write(obj.prenom)
      ..writeByte(2)
      ..write(obj.birthday)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.sexe)
      ..writeByte(5)
      ..write(obj.sanguin)
      ..writeByte(6)
      ..write(obj.family)
      ..writeByte(7)
      ..write(obj.job)
      ..writeByte(8)
      ..write(obj.email)
      ..writeByte(9)
      ..write(obj.tel)
      ..writeByte(10)
      ..write(obj.cel)
      ..writeByte(11)
      ..write(obj.assurance)
      ..writeByte(12)
      ..write(obj.adresse)
      ..writeByte(13)
      ..write(obj.note)
      ..writeByte(14)
      ..write(obj.ant1)
      ..writeByte(15)
      ..write(obj.ant2)
      ..writeByte(16)
      ..write(obj.ant3)
      ..writeByte(17)
      ..write(obj.ant4);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}