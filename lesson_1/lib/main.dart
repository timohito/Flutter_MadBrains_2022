import 'package:flutter/material.dart';
import 'app/widgets/main_page.dart';
import 'features/settings/pages/settings_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Основа нашего приложения
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Films',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: MainPage.path,
      onGenerateRoute: (settings) {
        if (settings.name == MainPage.path) {
          return MaterialPageRoute(
            builder: (context) {
              return const MainPage();
            },
          );
        }

        if (settings.name == SettingsPage.path) {
          final SettingsArguments arguments =
              settings.arguments as SettingsArguments;
          return MaterialPageRoute(
            builder: (context) {
              return SettingsPage(
                arguments: arguments,
              );
            },
          );
        }
      },
    );
  }
}
