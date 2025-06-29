import 'package:flutter/material.dart';
import 'package:jong_connect/presentation/pages/invite_friend/input_friend_id_section.dart';

import 'package:jong_connect/util/app_sizes.dart';

import 'my_friend_id_section.dart';

class InviteFriendPage extends StatelessWidget {
  const InviteFriendPage({super.key, this.fullPath});

  final String? fullPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: const SingleChildScrollView(
        padding: paddingV20H16,
        child: Column(
          children: [
            MyFriendIdSection(),
            gapH16,
            InputFriendIdSection(),
          ],
        ),
      ),
    );
  }
}
