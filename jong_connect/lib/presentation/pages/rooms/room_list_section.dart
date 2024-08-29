import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/joined_groups.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';

class RoomListSection extends ConsumerWidget {
  const RoomListSection({super.key, this.fullPath});

  final String? fullPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(joinedGroupsProvider),
      data: (groups) {
        return ListView(
          children: [
            if (groups.isEmpty) ...[
              const Text('早速ルームを作ってみましょう！'),
            ] else ...[
              for (final group in groups) ...[
                Text('${group.name} ${group.description}'),
              ],
            ],
          ],
        );
      },
    );
  }
}
