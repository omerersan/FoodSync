// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/planing_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/register_screen.dart';
import '../screens/search_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/voice_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const LoadingScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const ProfileScreen(),
      ),
    ),
    GoRoute(
      path: '/voice',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const VoiceScreen(),
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SettingsScreen(),
      ),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const RegisterScreen(),
      ),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: SearchScreen(),
      ),
    ),
    GoRoute(
      path: '/planing',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const PlaningScreen(),
      ),
    ),
  ],
);
