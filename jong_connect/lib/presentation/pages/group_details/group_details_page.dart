import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/group_details.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/presentation/pages/group_details/group_match_histories_section.dart';
import 'package:jong_connect/usecase/exit_group_use_case.dart';

import '../../../util/constants.dart';
import '../../../util/routing_path.dart';

class GroupDetailsPage extends ConsumerWidget {
  const GroupDetailsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: AsyncValueWidget(
          asyncValue: ref.watch(groupDetailsProvider(groupId: id)),
          data: (detail) => Text(detail.name),
          loadingWidget: const SizedBox(),
        ),
      ),
      endDrawer: _DrawerMenu(id),
      body: GroupMatchHistoriesSection(id: id),
    );
  }
}

class _DrawerMenu extends ConsumerWidget {
  const _DrawerMenu(this._groupId);

  final int _groupId;

  Future<void> _exitFromGroup(BuildContext context, WidgetRef ref) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: 'グループ退会',
      message: '退会するとこのグループ内で記録がつけられなくなります',
    );
    if (result.name != 'ok') {
      return;
    }

    try {
      await ref.read(exitGroupUseCaseProvider).execute(groupId: _groupId);

      context.go(RoutingPath.rooms);
      SnackBarService.showSnackBar(content: 'グループから退会しました');
    } catch (error) {
      Flushbar(
        message: 'グループの退会に失敗しました。時間を空けて再度お試しください',
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('グループ編集'),
            onTap: () => context.goNamed(
              RoutingPath.editGroup,
              pathParameters: {
                'groupId': _groupId.toString(),
              },
            ),
          ),
          ListTile(
            title: const Text('グループ退会'),
            onTap: () => _exitFromGroup(context, ref),
          ),
        ],
      ),
    );
  }
}
