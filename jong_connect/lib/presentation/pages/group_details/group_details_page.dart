import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/group_details.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/presentation/pages/group_details/floating_group_menu_button.dart';
import 'package:jong_connect/presentation/pages/group_details/group_match_histories_section.dart';

class GroupDetailsPage extends ConsumerWidget {
  const GroupDetailsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: AsyncValueWidget(
          asyncValue: ref.watch(groupDetailsProvider(groupId: id)),
          data: (detail) => Text(detail.name),
          loadingWidget: const SizedBox(),
        ),
      ),
      body: GroupMatchHistoriesSection(id: id),
      floatingActionButton: FloatingGroupMenuButton(groupId: id),
    );
  }
}
