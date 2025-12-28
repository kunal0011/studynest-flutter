import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/login/login_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/booking_history/booking_history_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/seat_availability/seat_availability_screen.dart';
import '../screens/select_plan/select_plan_screen.dart';
import '../screens/checkout/checkout_screen.dart';
import '../screens/payment/payment_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return DashboardScreen(child: child);
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/bookings',
          builder: (context, state) => const BookingHistoryScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/seat_selection',
      builder: (context, state) => const SeatAvailabilityScreen(),
    ),
    GoRoute(
      path: '/select_plan',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return SelectPlanScreen(extra: extra);
      },
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentScreen(),
    ),
  ],
);
