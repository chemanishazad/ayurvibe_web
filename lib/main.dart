import 'package:ayurvibe/core/route/routes.dart';
import 'package:ayurvibe/core/theme/font_sizer.dart';
import 'package:ayurvibe/core/theme/theme.dart';
import 'package:ayurvibe/core/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(OverlaySupport.global(child: const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final fontSize = ref.watch(fontSizeProvider);

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sri Vinayaga Ayurvibe',
          themeMode: themeMode,
          theme: lightTheme(fontSize),
          darkTheme: darkTheme(fontSize),
          initialRoute: '/',
          routes: AppRoutes.routes,
          builder:
              (context, child) => ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(
                    start: 1921,
                    end: double.infinity,
                    name: '4K',
                  ),
                ],
              ),
        );
      },
    );
  }
}
