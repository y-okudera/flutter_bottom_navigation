import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/route/app_route.dart';
import 'package:flutter_bottom_navigation/ui/tab/tab_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabScreen extends HookConsumerWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(tabViewModelProvider);

    return AutoTabsScaffold(
      routes: const [
        QiitaUserRouter(),
        QiitaItemRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: tabsRouter.activeIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            viewModel.onTapTab(
              currentIndex: tabsRouter.activeIndex,
              tappedIndex: index,
            );
            tabsRouter.setActiveIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.face,
                color: Colors.grey,
                size: 30.0,
              ),
              activeIcon: Icon(
                Icons.face,
                color: Colors.blue,
                size: 30.0,
              ),
              label: "User",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.grey,
                size: 30.0,
              ),
              activeIcon: Icon(
                Icons.list,
                color: Colors.blue,
                size: 30.0,
              ),
              label: "Item",
            ),
          ],
        );
      },
    );
  }
}
