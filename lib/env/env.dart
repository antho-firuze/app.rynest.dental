import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  // FOR MAIN APPS
  @EnviedField(varName: 'LIVE_API_URL', obfuscate: true)
  static String liveApiUrl = _Env.liveApiUrl;
  @EnviedField(varName: 'LOCAL_API_URL', obfuscate: true)
  static String localApiUrl = _Env.localApiUrl;
  @EnviedField(varName: 'LIVE_SSE_URL', obfuscate: true)
  static String liveSseUrl = _Env.liveSseUrl;
  @EnviedField(varName: 'LOCAL_SSE_URL', obfuscate: true)
  static String localSseUrl = _Env.localSseUrl;
}
