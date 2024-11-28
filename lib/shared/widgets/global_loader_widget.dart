import 'package:feature_first_structure/core/constants/app_colors.dart';
import 'package:feature_first_structure/environment/logic/environment_cubit.dart';
import 'package:feature_first_structure/environment/model/environment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_indicator/loading_indicator.dart';

class GlobalLoaderOverlyWidget extends StatelessWidget {
  const GlobalLoaderOverlyWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayWidgetBuilder: (context) {
        return const Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: LoadingIndicator(
              indicatorType: Indicator.ballSpinFadeLoader,
              colors: [AppColors.primaryColor],
            ),
          ),
        );
      },
      overlayColor: AppColors.black.withOpacity(0.3),
      child:
          BlocSelector<EnvironmentCubit, EnvironmentState, EnvironmentLoaded?>(
        selector: (state) {
          if (state is EnvironmentLoaded) {
            return state;
          }
          return null;
        },
        builder: (context, state) {
          if (state == null) {
            return child;
          }
          if (state.environment.environment == Environment.prod) {
            return child;
          }

          final color = state.environment.color;
          return Banner(
            message: state.environment.name,
            location: BannerLocation.topEnd,
            color: color ?? Colors.white,
            child: child,
          );
        },
      ),
    );
  }
}
