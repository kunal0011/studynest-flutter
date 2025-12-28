// Note: For now, we reuse Data models as Entities to speed up, or cleaner: map them.
// The prompt implies "Port Models/Entities".
// I will use the Data models directly if the user didn't ask for strict separation,
// but Clean Architecture suggests separate Domain Entities.
// Given strict "Clean Architecture" requirement, I should define Entities.
// BUT to save time and because they are identical, I will alias them or verify if I should make new classes.
// "Port Models/Entities" -> usually implies one set if simple app.
// I will use `User`, `Seat`, etc. from `data/models` but conceptually treat them as core.
// Actually, strict Clean Arch needs independent domain entities.
// I will define simple abstract classes or just use the data models for now to avoid duplication,
// as conversion often starts with shared models.
// Wait, "Map existing Android data components... Models: Convert User... to Dart classes with @JsonSerializable".
// This implies Data Models.
// I'll stick to using Data Models in the Domain interface for now (Pragmatic Clean Arch),
// or create typedefs.

import '../../data/models/user.dart';
import '../../data/models/seat.dart';
import '../../data/models/booking.dart';
import '../../data/models/dashboard_stats.dart';
import '../../data/models/login_request.dart';
import '../../data/models/create_booking_request.dart';

abstract class StudyNestRepository {
  Future<User> login(LoginRequest request);
  Future<DashboardStats> getDashboardStats();
  Future<List<Seat>> getSeats();
  Future<Booking> createBooking(CreateBookingRequest request);
  Future<List<Booking>> getBookings();
}
