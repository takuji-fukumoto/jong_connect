import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badges;
import 'package:jong_connect/domain/provider/new_friend_request_subscription.dart';

import 'async_value_widget.dart';

class NewFriendRequestBadgeWidget extends ConsumerWidget {
  const NewFriendRequestBadgeWidget(
      {super.key, required this.child, this.position});

  final badges.BadgePosition? position;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(newFriendRequestSubscriptionProvider),
      data: (newRequests) {
        return badges.Badge(
          position: position,
          showBadge: newRequests.isNotEmpty,
          badgeContent: const SizedBox(),
          child: child,
        );
      },
      loadingWidget: child,
    );
  }
}
