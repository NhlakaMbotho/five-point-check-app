// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../auth-guard.dart' as _i6;
import '../pages/home_screen.dart' as _i1;
import '../pages/login_screen.dart' as _i3;
import '../pages/settings_screen.dart' as _i2;

class MainRouter extends _i4.RootStackRouter {
  MainRouter(
      {_i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i6.AuthGuard authGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MainPage());
    },
    SettingsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SettingsPage());
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.LoginPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '', fullMatch: true),
        _i4.RouteConfig(MainRoute.name, path: '', guards: [authGuard]),
        _i4.RouteConfig(SettingsRoute.name,
            path: '/settings', guards: [authGuard]),
        _i4.RouteConfig(LoginRoute.name, path: '/login')
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.SettingsPage]
class SettingsRoute extends _i4.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}
