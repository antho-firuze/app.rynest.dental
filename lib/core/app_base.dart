import 'package:dental/core/app_config.dart';
import 'package:dental/env/env.dart';

class AppBase {
  static const imagePath = "assets/images";
  static const animationPath = "assets/animations";
  static const iconPath = "assets/icons";
  static const placeholderPath = "assets/placeholders";
  static String prodUrl = Env.liveApiUrl;
  static String testUrl = Env.localApiUrl;
  static String url = AppConfig.devMode ? AppBase.testUrl : AppBase.prodUrl;
  static String broadcastStreamUrl = Env.liveSseUrl;
}
