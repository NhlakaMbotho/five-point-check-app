// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../auth-guard.dart' as _i10;
import '../pages/clients_screen.dart' as _i7;
import '../pages/dashboard_screen.dart' as _i3;
import '../pages/instructors_screen.dart' as _i6;
import '../pages/login_screen.dart' as _i2;
import '../pages/main_screen.dart' as _i1;
import '../pages/profile_screen.dart' as _i5;
import '../pages/settings_screen.dart' as _i4;

class MainRouter extends _i8.RootStackRouter {
  MainRouter(
      {_i9.GlobalKey<_i9.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i10.AuthGuard authGuard;

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MainPage());
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage());
    },
    DashboardRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.DashboardPage());
    },
    SettingsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsPage());
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfilePage());
    },
    InstructorsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.InstructorsPage());
    },
    ClientsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.ClientsPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: '/main', fullMatch: true),
        _i8.RouteConfig(MainRoute.name, path: '/main', guards: [
          authGuard
        ], children: [
          _i8.RouteConfig(DashboardRoute.name,
              path: '', parent: MainRoute.name),
          _i8.RouteConfig(SettingsRoute.name,
              path: 'settings', parent: MainRoute.name),
          _i8.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainRoute.name),
          _i8.RouteConfig(InstructorsRoute.name,
              path: 'instructors', parent: MainRoute.name),
          _i8.RouteConfig(ClientsRoute.name,
              path: 'clients', parent: MainRoute.name),
          _i8.RouteConfig('login#redirect',
              path: 'login',
              parent: MainRoute.name,
              redirectTo: '/login',
              fullMatch: true)
        ]),
        _i8.RouteConfig(LoginRoute.name, path: '/login')
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.InstructorsPage]
class InstructorsRoute extends _i8.PageRouteInfo<void> {
  const InstructorsRoute() : super(InstructorsRoute.name, path: 'instructors');

  static const String name = 'InstructorsRoute';
}

/// generated route for
/// [_i7.ClientsPage]
class ClientsRoute extends _i8.PageRouteInfo<void> {
  const ClientsRoute() : super(ClientsRoute.name, path: 'clients');

  static const String name = 'ClientsRoute';
}
