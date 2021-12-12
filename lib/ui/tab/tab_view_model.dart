import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_bottom_navigation/data/model/bottom_tab.dart';
import 'package:flutter_bottom_navigation/data/repository/tab_repository.dart';
import 'package:flutter_bottom_navigation/data/repository/tab_repository_impl.dart';

final tabViewModelProvider = ChangeNotifierProvider.autoDispose(
    (ref) => TabViewModel(ref.read(tabRepositoryProvider)));

class TabViewModel extends ChangeNotifier {
  TabViewModel(this._tabRepository);

  final TabRepository _tabRepository;

  void onTapTab({
    required int currentIndex,
    required int tappedIndex,
  }) {
    final bottomTab = BottomTab.values[tappedIndex];

    if (currentIndex == tappedIndex) {
      debugPrint("on tap ActiveTab");
      _tabRepository.writeActiveTabToStream(bottomTab: bottomTab);
    } else {
      debugPrint("on tap InactiveTab");
      _tabRepository.writeInactiveTabToStream(bottomTab: bottomTab);
    }
  }
}
