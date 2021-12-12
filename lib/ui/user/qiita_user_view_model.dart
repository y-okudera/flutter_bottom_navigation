import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_bottom_navigation/data/model/bottom_tab.dart';
import 'package:flutter_bottom_navigation/data/repository/tab_repository.dart';
import 'package:flutter_bottom_navigation/data/repository/tab_repository_impl.dart';

final qiitaUserViewModelProvider = ChangeNotifierProvider(
    (ref) => QiitaUserViewModel(ref.read(tabRepositoryProvider)));

class QiitaUserViewModel extends ChangeNotifier {
  QiitaUserViewModel(this._tabRepository);

  final TabRepository _tabRepository;

  Stream<BottomTab> get tappedActiveTab => _tabRepository.tappedActiveTab.stream
      .where((bottomTab) => bottomTab == BottomTab.user);

  Stream<BottomTab> get tappedInactiveTab =>
      _tabRepository.tappedInactiveTab.stream
          .where((bottomTab) => bottomTab == BottomTab.user);
}
