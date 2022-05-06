import 'package:flutter/material.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: const _FilmList(),
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        films.length,
        (int index) => Padding(
          padding: EdgeInsets.only(top: 20),
          child: FilmTile(
            title: films[index],
          ),
        ),
      ),
    );
  }
}

class FilmTile extends StatelessWidget {
  const FilmTile({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const FlutterLogo(),
        Column(
          children: <Widget>[
            Text(title),
            Row(
              children: const <Widget>[Icon(Icons.star), Text('4,5')],
            )
          ],
        )
      ],
    );
  }
}
