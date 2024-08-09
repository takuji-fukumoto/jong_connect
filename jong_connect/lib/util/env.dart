import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  @EnviedField(varName: 'SUPABASE_ANONKEY', obfuscate: true)
  static String key = _Env.key;
}
