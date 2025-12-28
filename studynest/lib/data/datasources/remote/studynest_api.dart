import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:studynest/data/models/login_response.dart';
import 'package:studynest/data/models/login_request.dart';
import 'package:studynest/data/models/create_booking_request.dart';
import 'package:studynest/data/models/dashboard_stats.dart';
import 'package:studynest/data/models/seat.dart';
import 'package:studynest/data/models/booking.dart';

part 'studynest_api.g.dart';

@RestApi(baseUrl: "https://api.studynest.com/v1")
abstract class StudyNestApi {
  factory StudyNestApi(Dio dio, {String baseUrl}) = _StudyNestApi;

  @POST("/auth/login")
  Future<LoginResponse> login(@Body() LoginRequest body);

  @GET("/user/dashboard-stats")
  Future<DashboardStats> getDashboardStats();

  @GET("/seats")
  Future<List<Seat>> getSeats();

  @POST("/bookings/create")
  Future<Booking> createBooking(@Body() CreateBookingRequest body);

  @GET("/bookings")
  Future<List<Booking>> getBookings();
}
