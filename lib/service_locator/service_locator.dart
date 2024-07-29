import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:solid_software/service_locator/service_locator.config.dart';

/// dependencies injection
final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$configDI',
  preferRelativeImports: true,
  asExtension: false,
)

/// dependencies injection configuration
Future<void> configDI() async {
  $configDI(sl);
}
