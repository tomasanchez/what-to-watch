import 'package:hooks_riverpod/hooks_riverpod.dart';

class EnvironmentConfig {
  // Add the API KEY by running 'flutter run --dart-define=tmdbKEY=yourkey'
  final String movieAPIKey = const String.fromEnvironment("tmdbKEY");

  final Provider<EnvironmentConfig> enviromentConfigProvider =
      Provider((_) => EnvironmentConfig());
}
