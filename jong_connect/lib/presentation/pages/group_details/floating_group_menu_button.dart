import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:go_router/go_router.dart';

import '../../../usecase/exit_group_use_case.dart';
import '../../../usecase/group_match_results_use_case.dart';
import '../../../util/constants.dart';
import '../../../util/routing_path.dart';

class FloatingGroupMenuButton extends ConsumerStatefulWidget {
  const FloatingGroupMenuButton({super.key, required this.groupId});

  final int groupId;

  @override
  ConsumerState createState() => _FloatingGroupMenuState();
}

class _FloatingGroupMenuState extends ConsumerState<FloatingGroupMenuButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      items: <Bubble>[
        Bubble(
          title: "参加メンバー",
          iconColor: Theme.of(context).colorScheme.surface,
          bubbleColor: Theme.of(context).colorScheme.primary,
          icon: Icons.group,
          titleStyle: TextStyle(
              fontSize: 16, color: Theme.of(context).colorScheme.surface),
          onPress: () {
            _animationController.reverse();
            context.goNamed(
              RoutingPath.groupMembers,
              pathParameters: {
                'groupId': widget.groupId.toString(),
              },
            );
          },
        ),
        Bubble(
          title: "グループ編集",
          iconColor: Theme.of(context).colorScheme.surface,
          bubbleColor: Theme.of(context).colorScheme.primary,
          icon: Icons.settings,
          titleStyle: TextStyle(
              fontSize: 16, color: Theme.of(context).colorScheme.surface),
          onPress: () {
            _animationController.reverse();
            context.goNamed(
              RoutingPath.editGroup,
              pathParameters: {
                'groupId': widget.groupId.toString(),
              },
            );
          },
        ),
        Bubble(
          title: "シーズン作成",
          iconColor: Theme.of(context).colorScheme.surface,
          bubbleColor: Theme.of(context).colorScheme.primary,
          icon: Icons.edit_calendar_outlined,
          titleStyle: TextStyle(
              fontSize: 16, color: Theme.of(context).colorScheme.surface),
          onPress: () {
            _animationController.reverse();
            context.goNamed(
              RoutingPath.createSeason,
              pathParameters: {
                'groupId': widget.groupId.toString(),
              },
            );
          },
        ),
        Bubble(
          title: "グループ退会",
          iconColor: Theme.of(context).colorScheme.surface,
          bubbleColor: Theme.of(context).colorScheme.primary,
          icon: Icons.logout,
          titleStyle: TextStyle(
              fontSize: 16, color: Theme.of(context).colorScheme.surface),
          onPress: () async {
            _animationController.reverse();
            final result = await showOkCancelAlertDialog(
              context: context,
              title: 'グループ退会',
              message: '退会するとこのグループ内で記録がつけられなくなります',
            );
            if (result.name != 'ok') {
              return;
            }

            try {
              await ref
                  .read(exitGroupUseCaseProvider)
                  .execute(groupId: widget.groupId);

              context.go(RoutingPath.rooms);
              SnackBarService.showSnackBar(content: 'グループから退会しました');
            } catch (error) {
              SnackBarService.showErrorSnackBar(
                  content: 'グループの退会に失敗しました。時間を空けて再度お試しください');
            }
          },
        ),
        Bubble(
          title: "対局開始",
          iconColor: Theme.of(context).colorScheme.surface,
          bubbleColor: Theme.of(context).colorScheme.primary,
          icon: Icons.add_box,
          titleStyle: TextStyle(
              fontSize: 16, color: Theme.of(context).colorScheme.surface),
          onPress: () async {
            _animationController.reverse();
            final result = await showModalActionSheet<String>(
              context: context,
              message: '対局タイプを選択してください',
              actions: [
                for (var type in MatchType.values) ...[
                  SheetAction(
                    label: type.displayName,
                    key: type.name,
                  ),
                ],
              ],
            );

            if (result == null) {
              return;
            }

            // グループ対局レコード作成
            final groupMatch = await ref
                .read(groupMatchResultsUseCaseProvider)
                .createGroupMatch(
                    widget.groupId, MatchType.values.byName(result));

            context.goNamed(
              RoutingPath.groupMatch,
              pathParameters: {
                'groupId': widget.groupId.toString(),
                'groupMatchId': groupMatch.id.toString(),
              },
            );
          },
        ),
      ],
      animation: _animation,
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),
      iconColor: Theme.of(context).colorScheme.surface,
      iconData: Icons.menu_sharp,
      backGroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
