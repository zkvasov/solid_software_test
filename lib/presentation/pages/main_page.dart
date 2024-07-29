import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software/core/utils/extensions/build_context_ext.dart';
import 'package:solid_software/presentation/bloc/main_page/main_page_cubit.dart';
import 'package:solid_software/service_locator/service_locator.dart';

/// [MainPage]
@RoutePage()
class MainPage extends StatefulWidget implements AutoRouteWrapper {
  /// [MainPage]
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => sl.get<MainPageCubit>(),
      child: this,
    );
  }
}

class _MainPageState extends State<MainPage> {
  MainPageCubit get _cubit => context.read();

  void _onWholeScreenTap() {
    _cubit.getRandomBackgroundColor();
  }

  void _blocListener(
    BuildContext context,
    MainPageState state,
  ) {
    switch (state.status) {
      case MainPageStatus.error:
        // TODO: extract in utils
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMessage)),
        );
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainPageCubit, MainPageState>(
      listener: _blocListener,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.backgroundColor,
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _onWholeScreenTap,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.strings.mainPageLabel,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
