import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bottom_navigation/ui/item/qiita_item_screen.dart';
import 'package:flutter_bottom_navigation/ui/tab/tab_screen.dart';
import 'package:flutter_bottom_navigation/ui/user/qiita_user_screen.dart';

export 'app_route.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: TabScreen,
      initial: true,
      children: <AutoRoute>[
        AutoRoute(
          path: 'item',
          name: 'QiitaItemRouter',
          page: QiitaItemScreen,
        ),
        AutoRoute(
          path: 'user',
          name: 'QiitaUserRouter',
          page: QiitaUserScreen,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
