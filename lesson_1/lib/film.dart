import 'package:lesson_1/language.dart';
import 'package:lesson_1/abstract_film.dart';

class Film extends AbstractFilm with Convertor {
  Film(String id, String title, String picture, double voteAverage,
      String releaseDate, String description, String language)
      : super(id, title, picture, voteAverage, releaseDate, description,
            language) {
    Language lang = convert(language);
  }
}

mixin Convertor {
  Language convert(String lang) {
    switch (lang) {
      case 'ru':
        return Language.ru;
      case 'en':
        return Language.en;
      case 'fr':
        return Language.fr;
      case 'de':
        return Language.de;
      default:
        throw Exception('This language is not supported');
    }
  }
}

extension MyLanguage on Language {
  String toPrettyString(Language language) {
    switch (language) {
      case Language.ru:
        return "Русский";
      case Language.en:
        return "Английский";
      case Language.fr:
        return "Французский";
      case Language.de:
        return "Немецкий";
      default:
        return "НЕТ ТАКОГО ЯЗЫКА";
    }
  }
}
