import 'package:flutter_app/screens/profile_screen.dart';
import 'package:flutter_app/screens/planing_screen.dart';
import 'package:flutter_app/screens/search_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/planing',
      builder: (context, state) => PlaningScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => SearchScreen(),
    ),
  ],
);
