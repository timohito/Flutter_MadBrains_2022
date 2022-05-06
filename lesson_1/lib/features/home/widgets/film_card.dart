import 'package:flutter/material.dart';

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
              picture,
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
