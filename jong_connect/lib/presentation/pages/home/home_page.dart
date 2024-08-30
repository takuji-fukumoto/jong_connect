import 'package:flutter/material.dart';
import 'package:jong_connect/presentation/pages/home/friends_list_section.dart';
import 'package:jong_connect/util/app_sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('ホーム'),
        ),
        body: ListView(
          padding: paddingV20H16,
          children: [
            FriendsListSection(),
          ],
        ));
  }
}
