// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBookingRequest _$CreateBookingRequestFromJson(
  Map<String, dynamic> json,
) => CreateBookingRequest(
  userId: json['user_id'] as String,
  seatId: json['seat_id'] as String,
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
  amount: (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$CreateBookingRequestToJson(
  CreateBookingRequest instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'seat_id': instance.seatId,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime.toIso8601String(),
  'amount': instance.amount,
};
