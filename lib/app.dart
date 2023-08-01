import 'package:carys/core/presentation/blocs/tab_overlay/tab_overlay_bloc.dart';
import 'package:carys/core/presentation/blocs/theme_mode/theme_mode_bloc.dart';
import 'package:carys/core/presentation/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'features/onboarding/presentation/pages/onboarding_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeModeBloc>(
          create: (context) => ThemeModeBloc(),
        ),
        BlocProvider<TabOverlayBloc>(
          create: (context) => TabOverlayBloc(),
        ),
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Carys',
          // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          home: const OnboardingPage(),
        );
      }),
    );
  }
}
