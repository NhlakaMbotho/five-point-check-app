// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../auth-guard.dart' as _i12;
import '../pages/clients_screen.dart' as _i7;
import '../pages/dashboard_screen.dart' as _i3;
import '../pages/instructor_list_screen.dart' as _i9;
import '../pages/instructor_screen.dart' as _i6;
import '../pages/login_screen.dart' as _i2;
import '../pages/main_screen.dart' as _i1;
import '../pages/profile_screen.dart' as _i5;
import '../pages/settings_screen.dart' as _i4;
import '../pages/user_create_screen.dart' as _i8;

class MainRouter extends _i10.RootStackRouter {
  MainRouter(
      {_i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i12.AuthGuard authGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MainPage());
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage());
    },
    DashboardRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.DashboardPage());
    },
    SettingsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsPage());
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfilePage());
    },
    InstructorRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.InstructorPage());
    },
    ClientsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.ClientsPage());
    },
    UserCreateRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.UserCreatePage());
    },
    InstructorsListRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.InstructorsListPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig('/#redirect',
            path: '/', redirectTo: '/main', fullMatch: true),
        _i10.RouteConfig(MainRoute.name, path: '/main', guards: [
          authGuard
        ], children: [
          _i10.RouteConfig(DashboardRoute.name,
              path: '', parent: MainRoute.name),
          _i10.RouteConfig(SettingsRoute.name,
              path: 'settings', parent: MainRoute.name),
          _i10.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainRoute.name),
          _i10.RouteConfig(InstructorRoute.name,
              path: 'instructor',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(UserCreateRoute.name,
                    path: 'create', parent: InstructorRoute.name),
                _i10.RouteConfig(InstructorsListRoute.name,
                    path: 'instructor-list', parent: InstructorRoute.name)
              ]),
          _i10.RouteConfig(ClientsRoute.name,
              path: 'clients', parent: MainRoute.name),
          _i10.RouteConfig('login#redirect',
              path: 'login',
              parent: MainRoute.name,
              redirectTo: '/login',
              fullMatch: true)
        ]),
        _i10.RouteConfig(LoginRoute.name, path: '/login')
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i10.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.InstructorPage]
class InstructorRoute extends _i10.PageRouteInfo<void> {
  const InstructorRoute({List<_i10.PageRouteInfo>? children})
      : super(InstructorRoute.name,
            path: 'instructor', initialChildren: children);

  static const String name = 'InstructorRoute';
}

/// generated route for
/// [_i7.ClientsPage]
class ClientsRoute extends _i10.PageRouteInfo<void> {
  const ClientsRoute() : super(ClientsRoute.name, path: 'clients');

  static const String name = 'ClientsRoute';
}

/// generated route for
/// [_i8.UserCreatePage]
class UserCreateRoute extends _i10.PageRouteInfo<void> {
  const UserCreateRoute() : super(UserCreateRoute.name, path: 'create');

  static const String name = 'UserCreateRoute';
}

/// generated route for
/// [_i9.InstructorsListPage]
class InstructorsListRoute extends _i10.PageRouteInfo<void> {
  const InstructorsListRoute()
      : super(InstructorsListRoute.name, path: 'instructor-list');

  static const String name = 'InstructorsListRoute';
}
