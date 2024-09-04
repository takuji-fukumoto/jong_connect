import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/router.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:jong_connect/util/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Supabase.initialize(
  //   url: Env.supabaseUrl,
  //   anonKey: Env.supabaseAnonkey,
  // );

  // MEMO: 向き先を一時的にローカル環境に変更
  // MEMO: androidの場合localhostと通信できないためurlを変更する必要あり
  // TODO: 環境変数でdevかproduction環境を切り替えられるようにする
  final localUrl =
      Platform.isAndroid ? 'http://10.0.2.2:54321' : 'http://127.0.0.1:54321';
  await Supabase.initialize(
    url: localUrl,
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0',
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      scaffoldMessengerKey: SnackBarService.scaffoldKey,
    );
  }
}
