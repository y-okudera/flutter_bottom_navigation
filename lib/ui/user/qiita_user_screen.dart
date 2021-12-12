import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bottom_navigation/ui/user/qiita_user_view_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QiitaUserScreen extends HookConsumerWidget {
  const QiitaUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(qiitaUserViewModelProvider);
    final scrollController = ScrollController();

    useEffect(() {
      debugPrint("${viewModel.tappedInactiveTab}");

      final subscription = viewModel.tappedActiveTab.listen((bottomTab) {
        debugPrint("tappedActiveTab: $bottomTab");

        // Scroll to top
        SchedulerBinding.instance?.addPostFrameCallback((_) {
          scrollController.animateTo(
            scrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
          );
        });
      });
      return subscription.cancel;
    }, [viewModel.tappedActiveTab]);

    useEffect(() {
      final subscription = viewModel.tappedInactiveTab.listen((bottomTab) {
        debugPrint("tappedInactiveTab: $bottomTab");
        // Refresh data.
      });
      return subscription.cancel;
    }, [viewModel.tappedInactiveTab]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            width: double.infinity,
            color: index % 2 == 0 ? Colors.white : Colors.grey,
            child: Center(
              child: Text(
                "$index",
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
