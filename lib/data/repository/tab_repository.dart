import 'dart:async';

import 'package:flutter_bottom_navigation/data/model/bottom_tab.dart';

abstract class TabRepository {
  StreamController<BottomTab> get tappedActiveTab;
  StreamController<BottomTab> get tappedInactiveTab;

  void writeActiveTabToStream({
    required BottomTab bottomTab,
  });

  void writeInactiveTabToStream({
    required BottomTab bottomTab,
  });
}
