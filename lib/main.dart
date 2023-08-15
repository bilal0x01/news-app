import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';
import 'package:news_app/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => ThemeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final FlexSchemeColor appScheme = FlexSchemeColor.from(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
  );

  ThemeData appTheme(ThemeData theme) {
    return theme.copyWith(
      useMaterial3: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(FlexThemeData.light(
        colors: appScheme,
        fontFamily: 'RobotoSlab',
      )),
      darkTheme: appTheme(
        FlexThemeData.dark(
            colors: appScheme.toDark(), fontFamily: 'RobotoSlab'),
      ),
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => ArticlesProvider(),
        child: const HomeScreen(),
      ),
    );
  }
}
