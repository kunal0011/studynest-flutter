import 'package:dio/dio.dart';
import 'package:drift/drift.dart'; // For Value and Companion
import '../../data/datasources/remote/studynest_api.dart';
import '../../data/datasources/local/app_database.dart' as db;
import '../../domain/repositories/studynest_repository.dart';
import '../../data/models/user.dart';
import '../../data/models/seat.dart';
import '../../data/models/booking.dart';
import '../../data/models/dashboard_stats.dart';
import '../../data/models/login_request.dart';
import '../../data/models/create_booking_request.dart';

class StudyNestRepositoryImpl implements StudyNestRepository {
  final StudyNestApi _api;
  final db.AppDatabase _db;

  StudyNestRepositoryImpl(this._api, this._db);

  @override
  Future<User> login(LoginRequest request) async {
    final response = await _api.login(request);
    // Save user to DB
    await _db
        .into(_db.users)
        .insertOnConflictUpdate(
          db.UsersCompanion.insert(
            id: response.user.id,
            name: response.user.name,
            email: response.user.email,
            mobile: Value(response.user.mobile),
            profilePicture: Value(response.user.profilePicture),
          ),
        );
    return response.user;
  }

  @override
  Future<DashboardStats> getDashboardStats() async {
    try {
      return await _api.getDashboardStats();
    } catch (e) {
      return DashboardStats(
        totalHours: 45.5,
        activeBookings: 2,
        upcomingBookingId: '2',
      );
    }
  }

  @override
  Future<List<Seat>> getSeats() async {
    try {
      return await _api.getSeats();
    } catch (e) {
      return List.generate(
        20,
        (index) => Seat(
          id: '$index',
          label: 'S${index + 1}',
          isAvailable: index % 3 != 0,
          type: 'Standard',
          price: 15.0,
          row: index ~/ 4,
          col: index % 4,
        ),
      );
    }
  }

  @override
  Future<Booking> createBooking(CreateBookingRequest request) async {
    final booking = await _api.createBooking(request);
    // Save to DB
    await _db
        .into(_db.bookings)
        .insertOnConflictUpdate(
          db.BookingsCompanion.insert(
            id: booking.id,
            userId: booking.userId,
            seatId: booking.seatId,
            startTime: booking.startTime,
            endTime: booking.endTime,
            status: booking.status,
            amount: booking.amount,
          ),
        );
    return booking;
  }

  @override
  Future<List<Booking>> getBookings() async {
    try {
      final bookings = await _api.getBookings();
      // Cache bookings? For now just return.
      return bookings;
    } catch (e) {
      // Fallback to mock data if API fails (e.g. invalid URL)
      return [
        Booking(
          id: '1',
          userId: 'user1',
          seatId: 'A1',
          startTime: DateTime.now().subtract(const Duration(days: 1)),
          endTime: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
          status: 'confirmed',
          amount: 20.0,
        ),
        Booking(
          id: '2',
          userId: 'user1',
          seatId: 'B3',
          startTime: DateTime.now().add(const Duration(days: 1)),
          endTime: DateTime.now().add(const Duration(days: 1, hours: 4)),
          status: 'pending',
          amount: 40.0,
        ),
      ];
    }
  }
}
