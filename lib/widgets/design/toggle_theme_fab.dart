import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ToggleThemeFab extends StatefulWidget {
  const ToggleThemeFab({super.key});

  @override
  State<ToggleThemeFab> createState() => _ToggleThemeFabState();
}

class _ToggleThemeFabState extends State<ToggleThemeFab> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          themeProvider.toggleTheme();
        });
      },
      child: FaIcon(
        themeProvider.themeMode.index == 2
            ? FontAwesomeIcons.solidMoon
            : FontAwesomeIcons.moon,
      ),
    );
  }
}
