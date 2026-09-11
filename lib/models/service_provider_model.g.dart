// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceProviderModelAdapter extends TypeAdapter<ServiceProviderModel> {
  @override
  final int typeId = 1;

  @override
  ServiceProviderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceProviderModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      specialty: fields[2] as String?,
      experienceYears: fields[3] as num?,
      rating: fields[4] as double?,
      reviewCount: fields[5] as num?,
      image: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceProviderModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.specialty)
      ..writeByte(3)
      ..write(obj.experienceYears)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.reviewCount)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceProviderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
