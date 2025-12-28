// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seat _$SeatFromJson(Map<String, dynamic> json) => Seat(
  id: json['id'] as String,
  label: json['label'] as String,
  isAvailable: json['is_available'] as bool,
  type: json['type'] as String,
  price: (json['price'] as num).toDouble(),
  row: (json['row'] as num?)?.toInt(),
  col: (json['col'] as num?)?.toInt(),
);

Map<String, dynamic> _$SeatToJson(Seat instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'is_available': instance.isAvailable,
  'type': instance.type,
  'price': instance.price,
  'row': instance.row,
  'col': instance.col,
};
