import 'package:flutter/material.dart';
import 'package:lesson_1/features/home/widgets/film_grid.dart';
import 'package:lesson_1/features/settings/pages/settings_page.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({required this.title, Key? key}) : super(key: key);

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
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/settings',
                arguments: const SettingsArguments('BOBIK'),
              );
            },
          ),
        ],
      ),
      body: const FilmGrid(),
    );
  }
}
