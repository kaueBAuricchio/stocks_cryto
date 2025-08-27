import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stocks_cryto/core/platform/platform_methods.dart';

class PlatformMethods implements IPlatformMethods {
  @override
  String getApiKey() => dotenv.get('API_KEY', fallback: '');

  @override
  String getBaseUrl() => dotenv.get('BASE_URL', fallback: '');
}
