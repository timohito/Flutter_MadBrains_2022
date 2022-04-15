import 'film.dart';

class FilmLogic {
  Future<List<Film>> getList(int count) async {
    List<Film> list = [];

    for (int i = 0; i < count; i++) {
      list.add(
        Film(
          i.toString(),
          "title" + i.toString(),
          "picture" + i.toString(),
          i % 5,
          "releaseDate" + i.toString(),
          "description" + i.toString(),
          "language" + i.toString(),
        ),
      );
    }
    return list;
  }

  List<Film> getFilteredList(double vote, List<Film> list) {
    List<Film> filteredList = [];

    for (var film in list) {
      if (film.voteAverage >= vote) {
        filteredList.add(film);
      }
    }
    return filteredList;
  }
}
