import 'package:flutter/material.dart';
import 'package:lesson_1/app/models/film_card_model.dart';

class FilmDetailedArguments {
  const FilmDetailedArguments(this.model);

  final FilmCardModel model;
}

class FilmDetailedPage extends StatelessWidget {
  const FilmDetailedPage({Key? key, required this.arguments}) : super(key: key);

  final FilmDetailedArguments arguments;
  static const String path = '/film_detailed';

  // const FilmDetailedPage({
  //   required this.id,
  //   required this.title,
  //   required this.picture,
  //   required this.voteAverage,
  //   required this.releaseDate,
  //   required this.description,
  //   Key? key,
  // }) : super(key: key);
  //
  // factory FilmDetailedPage.fromModel({
  //   required FilmCardModel model,
  //   Key? key,
  // }) {
  //   return FilmDetailedPage(
  //     id: model.id,
  //     title: model.title,
  //     picture: model.picture,
  //     voteAverage: model.voteAverage,
  //     releaseDate: model.releaseDate,
  //     description: model.description,
  //     key: key,
  //   );
  // }

  // final int id;
  // final String title;
  // final String picture;
  // final double voteAverage;
  // final String releaseDate;
  // final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Row(
        children: <Widget>[
          Expanded(
            child: Image.network(
              arguments.model.picture,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 275),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      arguments.model.title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              arguments.model.voteAverage.toStringAsFixed(1),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                color: arguments.model.voteAverage < 4
                                    ? Colors.red
                                    : arguments.model.voteAverage >= 8
                                        ? Colors.green
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Дата выхода: ' +
                            arguments.model.releaseDate.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Text(
                      arguments.model.description,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
