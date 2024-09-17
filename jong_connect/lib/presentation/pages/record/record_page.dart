import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordPage extends ConsumerStatefulWidget {
  const RecordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoomsPageState();
}

class _RoomsPageState extends ConsumerState<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('戦績'),
      ),
      body: const Center(child: Text('もうちっとかかるんじゃ')),
    );
  }
}
