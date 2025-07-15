import 'dart:math';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/presentation/pages/home/my_profile_section.dart';
import 'package:jong_connect/presentation/pages/home/recently_match_results_section.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../../domain/provider/recently_match_results.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('ホーム'),
      ),
      body: CustomMaterialIndicator(
        onRefresh: () => onRefresh(ref),
        backgroundColor: Colors.white,
        indicatorBuilder: (context, controller) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: CircularProgressIndicator(
              color: Colors.redAccent,
              value: controller.state.isLoading
                  ? null
                  : min(controller.value, 1.0),
            ),
          );
        },
        child: const SingleChildScrollView(
          padding: paddingV20H16,
          child: Column(
            children: [
              MyProfileSection(),
              gapH8,
              RecentlyGroupMatchesSection(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onRefresh(WidgetRef ref) async {
    ref.invalidate(recentlyMatchResultsProvider);
  }
}
