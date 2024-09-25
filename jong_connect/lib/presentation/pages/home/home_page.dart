import 'package:flutter/material.dart';
import 'package:jong_connect/presentation/pages/home/friends_list_section.dart';
import 'package:jong_connect/presentation/pages/home/my_profile_section.dart';
import 'package:jong_connect/util/app_sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('ホーム'),
      ),
      body: const Padding(
        padding: paddingV20H16,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyProfileSection(),
              gapH8,
              FriendsListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
