import 'package:flutter/material.dart';
import 'package:lesson_1/film.dart';
import 'package:lesson_1/language.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Film> films = [];

  bool filterVote = false;

  @override
  void initState() {
    // TODO: implement initState
    _getFilms().then((value) {
      setState(() {
        films = value;
      });
    });
    super.initState();
  }

  Future<List<Film>> _getFilms() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Film(
          '0',
          'Дилер',
          'https://www.film.ru/sites/default/files/movies/posters/2589974-2086974.jpeg',
          4.0,
          '1996',
          'desc0',
          'en'),
      Film(
          '1',
          'Дилер 2',
          'https://www.film.ru/sites/default/files/movies/posters/2589974-2086974.jpeg',
          4.0,
          '1996',
          'desc1',
          'en'),
      Film(
          '2',
          'Брат',
          'https://www.film.ru/sites/default/files/movies/posters/2589974-2086974.jpeg',
          5.0,
          '1996',
          'desc2',
          'ru'),
      Film(
          '3',
          'Брат 2',
          'https://www.film.ru/sites/default/files/movies/posters/2589974-2086974.jpeg',
          5.0,
          '1996',
          'desc3',
          'ru'),
      Film(
          '4',
          'Игра на понижение',
          'https://www.film.ru/sites/default/files/movies/posters/2589974-2086974.jpeg',
          5.0,
          '1996',
          'desc4',
          'de'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список фильмов'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Checkbox(
                value: filterVote,
                onChanged: (bool? changeValue) {
                  setState(() {
                    filterVote = changeValue ?? false;
                  });
                },
              ),
              const Text('оценка только больше 4')
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: filterFilms,
                child: const Text('Поиск'),
              )
            ],
          ),
          ...List.generate(films.length, (index) {
            return FilmCard(
                title: films[index].title,
                picture: films[index].picture,
                language: films[index]
                    .convert(films[index].language)
                    .toPrettyString());
          }),
        ]),
      ),
    );
  }

  Future<void> filterFilms() async {
    await _getFilms().then((valueFilms) {
      setState(() {
        if (filterVote) {
          films =
              valueFilms.where((element) => element.voteAverage > 4.0).toList();
        } else {
          films = valueFilms;
        }
      });
    });
  }
}

class FilmCard extends StatelessWidget {
  const FilmCard({
    Key? key,
    required this.title,
    required this.picture,
    required this.language,
  }) : super(key: key);

  final String title;
  final String picture;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.teal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              'https://www.film.ru/sites/default/files/movies/posters/2589974-2086974.jpeg',
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Название: ' + title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Язык: ' + language, //language.toPrettyString(language),
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
