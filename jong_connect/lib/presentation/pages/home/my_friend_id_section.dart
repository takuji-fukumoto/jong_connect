import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/app_sizes.dart';

class MyFriendIdSection extends ConsumerWidget {
  const MyFriendIdSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(currentUserProvider),
      data: (user) {
        if (user == null) {
          return const SizedBox();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('あなたのフレンドID'),
            gapH16,
            Text('ここにQRコード表示'),
            gapH16,
            Text(user.hashedFriendId),
          ],
        );
      },
    );
  }
}
