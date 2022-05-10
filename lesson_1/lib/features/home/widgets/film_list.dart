import 'package:flutter/material.dart';

import '../../../app/models/film_card_model.dart';
import '../../../app/widgets/film_card.dart';
import '../../../app/widgets/film_tile.dart';

class FilmList extends StatelessWidget {
  const FilmList({Key? key}) : super(key: key);

  static const List<FilmCardModel> _films = <FilmCardModel>[
    FilmCardModel(
      id: 0,
      title: 'Брат',
      voteAverage: 8.3,
      picture:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/1704946/e9008e2f-433f-43b0-b9b8-2ea8e3fb6c9b/600x900',
      releaseDate: '1997',
      description:
          'Дембель Данила Багров защищает слабых в Петербурге 1990-х. Фильм, сделавший Сергея Бодрова народным героем.',
    ),
    FilmCardModel(
      id: 1,
      title: 'Служебный роман',
      voteAverage: 8.3,
      picture:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/1777765/fd4e75bb-a6fe-46ef-86cd-0f470334fcbd/600x900',
      releaseDate: '1977',
      description:
          'Робкий холостяк решает приударить за строгой начальницей. Комедия Эльдара Рязанова, классика советского кино.',
    ),
    FilmCardModel(
      id: 2,
      title: 'Волк с Уолл-стрит',
      voteAverage: 7.9,
      picture:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/c5876e81-9dec-43e2-923f-fee2fca85e21/576x',
      releaseDate: '2013',
      description:
          'Восхождение циника-гедониста на бизнес-олимп 1980-х. Блистательный тандем Леонардо ДиКаприо и Мартина Скорсезе',
    ),
    FilmCardModel(
      id: 3,
      title: 'Бриллиантовая рука',
      voteAverage: 8.5,
      picture:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/a419d20d-4ae6-4c7c-91b3-c38ef9ca1ffe/600x900',
      releaseDate: '1968',
      description:
          'Контрабандисты гоняются за примерным семьянином. Народная комедия с элементами абсурда от Леонида Гайдая',
    ),
    FilmCardModel(
      id: 4,
      title: 'Интерстеллар',
      voteAverage: 8.6,
      picture:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/430042eb-ee69-4818-aed0-a312400a26bf/600x900',
      releaseDate: '2014',
      description:
          'Фантастический эпос про задыхающуюся Землю, космические полеты и парадоксы времени. «Оскар» за спецэффекты',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return FilmTile.fromModel(model: _films[index % _films.length]);
      },
    );
  }
}
