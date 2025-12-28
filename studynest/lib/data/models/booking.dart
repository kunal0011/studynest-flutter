import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'seat_id')
  final String seatId;
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @JsonKey(name: 'end_time')
  final DateTime endTime;
  final String status; // 'pending', 'confirmed', 'cancelled'
  final double amount;

  Booking({
    required this.id,
    required this.userId,
    required this.seatId,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.amount,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
