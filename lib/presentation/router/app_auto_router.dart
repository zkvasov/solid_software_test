import 'package:auto_route/auto_route.dart';

import 'app_auto_router.gr.dart';

const _durationInMilliseconds = 300;

class _AppRoute extends CustomRoute {
  _AppRoute({
    required super.page,
    required super.path,
  }) : super(
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: _durationInMilliseconds,
          reverseDurationInMilliseconds: _durationInMilliseconds,
        );
}

@AutoRouterConfig(
  replaceInRouteName: 'Page|Tab,Route',
)
class AppAutoRouter extends $AppAutoRouter {
  @override
  final List<AutoRoute> routes = [
    _AppRoute(
      page: MainRoute.page,
      path: '/',
    ),
  ];
}