// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardStats _$DashboardStatsFromJson(Map<String, dynamic> json) =>
    DashboardStats(
      totalHours: (json['total_hours'] as num).toDouble(),
      activeBookings: (json['active_bookings'] as num).toInt(),
      upcomingBookingId: json['upcoming_booking_id'] as String?,
    );

Map<String, dynamic> _$DashboardStatsToJson(DashboardStats instance) =>
    <String, dynamic>{
      'total_hours': instance.totalHours,
      'active_bookings': instance.activeBookings,
      'upcoming_booking_id': instance.upcomingBookingId,
    };
