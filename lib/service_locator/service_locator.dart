import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$configDI',
  preferRelativeImports: true,
  asExtension: false,
)

Future<void> configDI() async {

  await $configDI(sl);
}
