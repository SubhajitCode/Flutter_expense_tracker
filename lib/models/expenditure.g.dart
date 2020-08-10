// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenditure.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenditureAdapter extends TypeAdapter<Expenditure> {
  @override
  final int typeId = 0;

  @override
  Expenditure read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expenditure(
      title: fields[1] as String,
      amount: fields[2] as double,
      note: fields[3] as String,
      date: fields[4] as DateTime,
    )..id = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, Expenditure obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenditureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
