import 'package:json_annotation/json_annotation.dart';

part 'create_booking_request.g.dart';

@JsonSerializable()
class CreateBookingRequest {
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'seat_id')
  final String seatId;
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @JsonKey(name: 'end_time')
  final DateTime endTime;
  final double amount;

  CreateBookingRequest({
    required this.userId,
    required this.seatId,
    required this.startTime,
    required this.endTime,
    required this.amount,
  });

  factory CreateBookingRequest.fromJson(Map<String, dynamic> json) => _$CreateBookingRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateBookingRequestToJson(this);
}
