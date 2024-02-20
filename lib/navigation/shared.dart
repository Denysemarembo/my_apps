import 'package:flutter/material.dart';
import 'theme_preferences.dart';

class SharedPage extends StatefulWidget {
  @override
  _SharedPageState createState() => _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {
  late ThemeData _currentTheme;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    String? theme = await ThemePreferences.getTheme();
    if (theme == 'dark') {
      _applyTheme(ThemeData.dark());
    } else {
      _applyTheme(ThemeData.light());
    }
  }

  void _applyTheme(ThemeData theme) {
    setState(() {
      _currentTheme = theme;
    });
    print('Theme applied: $theme'); // Debugging line
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Preferences'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                ThemePreferences.setTheme('light');
                _applyTheme(ThemeData.light());
                print('Set Light Theme'); // Debugging line
              },
              child: Text('Set Light Theme'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ThemePreferences.setTheme('dark');
                _applyTheme(ThemeData.dark());
                print('Set Dark Theme'); // Debugging line
              },
              child: Text('Set Dark Theme'),
            ),
            SizedBox(height: 20),
            Text(
              'Current Theme: ${_currentTheme.brightness == Brightness.light ? 'Light' : 'Dark'}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
