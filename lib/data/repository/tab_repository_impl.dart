import 'dart:async';

import 'package:flutter_bottom_navigation/data/model/bottom_tab.dart';
import 'package:flutter_bottom_navigation/data/repository/tab_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<TabRepository> tabRepositoryProvider =
    Provider((ref) => TabRepositoryImpl());

class TabRepositoryImpl implements TabRepository {
  TabRepositoryImpl();

  final _tappedActiveTab = StreamController<BottomTab>.broadcast();
  final _tappedInactiveTab = StreamController<BottomTab>.broadcast();

  @override
  StreamController<BottomTab> get tappedActiveTab => _tappedActiveTab;

  @override
  StreamController<BottomTab> get tappedInactiveTab => _tappedInactiveTab;

  @override
  void writeActiveTabToStream({
    required BottomTab bottomTab,
  }) {
    _tappedActiveTab.sink.add(bottomTab);
  }

  @override
  void writeInactiveTabToStream({
    required BottomTab bottomTab,
  }) {
    _tappedInactiveTab.sink.add(bottomTab);
  }
}
