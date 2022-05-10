import 'package:flutter/material.dart';
import 'package:lesson_1/features/home/widgets/film_list.dart';
import 'package:lesson_1/features/settings/pages/settings_page.dart';
import 'package:lesson_1/film_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.title, Key? key}) : super(key: key);

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
      body: Column(children: <Widget>[
        Row(
          children: [
            Expanded(child: TextField()),
            IconButton(
              onPressed: () {
                return;
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        Expanded(
          child: FilmList(),
        )
      ]),
    );
  }
}
