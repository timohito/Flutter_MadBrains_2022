import 'package:flutter/material.dart';
import 'features/home/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Основа нашего приложения
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Отображается над приложениями в Android, когда пользователь нажимает кнопку «последние приложения».
      title: 'Films',
      // Стили всего приложения
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.cyan,
        ),
      ),
      // Наша начальная страница
      home: const HomePage(),
    );
  }
}
