import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/presentation/pages/rooms/room_list_section.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../../util/routing_path.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('ルーム'),
          actions: [
            IconButton(
                onPressed: () => context.goNamed(RoutingPath.createGroup),
                icon: Icon(Icons.add_comment))
          ],
        ),
        body: const Padding(
          padding: paddingV8H8,
          child: RoomListSection(),
        ));
  }
}
