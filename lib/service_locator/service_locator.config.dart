// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../data/repositories/color_generation_repository_impl.dart' as _i754;
import '../domain/repositories/color_generation_repository.dart' as _i886;
import '../domain/use_cases/color_generation_use_cases.dart' as _i669;
import '../presentation/bloc/main_page/main_page_cubit.dart' as _i276;
import '../presentation/router/app_auto_router.dart' as _i271;
import 'modules/auto_router_module.dart' as _i448;
import 'modules/logger_module.dart' as _i205;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $configDI(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final autoRouterModule = _$AutoRouterModule();
  final loggerModule = _$LoggerModule();
  gh.singleton<_i271.AppAutoRouter>(() => autoRouterModule.appAutoRouter());
  gh.singleton<_i974.Logger>(() => loggerModule.logger());
  gh.factory<_i886.ColorGenerationRepository>(
      () => _i754.ColorGenerationRepositoryImpl());
  gh.lazySingleton<_i669.ColorGenerationUseCases>(() =>
      _i669.ColorGenerationUseCases(gh<_i886.ColorGenerationRepository>()));
  gh.factory<_i276.MainPageCubit>(
      () => _i276.MainPageCubit(gh<_i669.ColorGenerationUseCases>()));
  return getIt;
}

class _$AutoRouterModule extends _i448.AutoRouterModule {}

class _$LoggerModule extends _i205.LoggerModule {}
