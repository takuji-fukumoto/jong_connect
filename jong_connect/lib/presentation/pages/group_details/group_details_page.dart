import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../util/routing_path.dart';

class GroupDetailsPage extends StatelessWidget {
  const GroupDetailsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => context.goNamed(
              RoutingPath.editGroup,
              pathParameters: {
                'groupId': id.toString(),
              },
            ),
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
