import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Основа нашего приложения
    return MaterialApp(
// Отображается над приложениями в Android, когда пользователь нажимает кнопку «последние приложения».
      title: 'Films',
// Стили всего приложения
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
// Наша начальная страница
      home: const MyHomePage(title: 'Films'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _FilmList(),
    );
  }
}

class _FilmList extends StatelessWidget {
  const _FilmList({Key? key}) : super(key: key);

  static final List<String> films = <String>[
    'Брат',
    'Служебный роман',
    'Волк с Уолл-стрит',
    'Бриллиантовая рука',
    'Интерстеллар',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        films.length,
        (int index) => ColoredBox(
          color: Colors.purple,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(films[index]),
          ),
        ),
      ),
    );
  }
}
