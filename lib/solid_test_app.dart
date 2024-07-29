import 'package:flutter/material.dart';
import 'package:solid_software/l10n/generated/app_localizations.dart';
import 'package:solid_software/presentation/router/app_auto_router.dart';
import 'package:solid_software/service_locator/service_locator.dart';

/// Application [SolidTestApp]
class SolidTestApp extends StatelessWidget {
  /// Application [SolidTestApp]
  const SolidTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppAutoRouter>();

    return MaterialApp.router(
      scrollBehavior: const ScrollBehavior(),
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routeInformationParser: appRouter.defaultRouteParser(),
      routeInformationProvider: appRouter.routeInfoProvider(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
