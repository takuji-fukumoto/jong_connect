import 'package:flutter/material.dart';

import '../../../domain/model/group.dart';

class GroupDetailsPage extends StatelessWidget {
  const GroupDetailsPage({super.key, required this.group});

  final Group group;

  @override
  Widget build(BuildContext context) {
    print(group.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ルーム詳細'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: Text('ここに戦績が表示されます'),
      ),
    );
  }
}
