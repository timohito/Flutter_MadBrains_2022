abstract class AbstractFilm {
  final String id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String language;

  AbstractFilm(this.id, this.title, this.picture, this.voteAverage,
      this.releaseDate, this.description, this.language);
}
