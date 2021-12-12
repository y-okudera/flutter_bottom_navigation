// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter_bottom_navigation/ui/item/qiita_item_screen.dart'
    as _i2;
import 'package:flutter_bottom_navigation/ui/tab/tab_screen.dart' as _i1;
import 'package:flutter_bottom_navigation/ui/user/qiita_user_screen.dart'
    as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.TabScreen());
    },
    QiitaItemRouter.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.QiitaItemScreen());
    },
    QiitaUserRouter.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.QiitaUserScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(TabRoute.name, path: '/', children: [
          _i4.RouteConfig(QiitaItemRouter.name,
              path: 'item', parent: TabRoute.name),
          _i4.RouteConfig(QiitaUserRouter.name,
              path: 'user', parent: TabRoute.name)
        ])
      ];
}

/// generated route for [_i1.TabScreen]
class TabRoute extends _i4.PageRouteInfo<void> {
  const TabRoute({List<_i4.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'TabRoute';
}

/// generated route for [_i2.QiitaItemScreen]
class QiitaItemRouter extends _i4.PageRouteInfo<void> {
  const QiitaItemRouter() : super(name, path: 'item');

  static const String name = 'QiitaItemRouter';
}

/// generated route for [_i3.QiitaUserScreen]
class QiitaUserRouter extends _i4.PageRouteInfo<void> {
  const QiitaUserRouter() : super(name, path: 'user');

  static const String name = 'QiitaUserRouter';
}
