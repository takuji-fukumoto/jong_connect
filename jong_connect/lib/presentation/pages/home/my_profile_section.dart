import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';

class MyProfileSection extends ConsumerWidget {
  const MyProfileSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(currentUserProvider),
      data: (user) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.name ?? '-',
                  style: const TextStyle(
                    fontSize: Sizes.p24,
                  ),
                ),
                gapH8,
                Text(
                  user?.profile ?? '',
                  style: TextStyle(
                    fontSize: Sizes.p16,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            CircleAvatar(
              radius: 40,
              child: CachedNetworkImage(
                imageUrl: user?.avatarUrl ?? '',
                errorWidget: (_, __, ___) => unknownUserIcon,
              ),
            ),
          ],
        );
      },
      loadingWidget: const SizedBox(),
    );
  }
}
