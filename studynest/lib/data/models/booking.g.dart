// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  seatId: json['seat_id'] as String,
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
  status: json['status'] as String,
  amount: (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'seat_id': instance.seatId,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime.toIso8601String(),
  'status': instance.status,
  'amount': instance.amount,
};
