import 'package:json_annotation/json_annotation.dart';

part 'dashboard_stats.g.dart';

@JsonSerializable()
class DashboardStats {
  @JsonKey(name: 'total_hours')
  final double totalHours;
  @JsonKey(name: 'active_bookings')
  final int activeBookings;
  @JsonKey(name: 'upcoming_booking_id')
  final String? upcomingBookingId;

  DashboardStats({
    required this.totalHours,
    required this.activeBookings,
    this.upcomingBookingId,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) => _$DashboardStatsFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardStatsToJson(this);
}
