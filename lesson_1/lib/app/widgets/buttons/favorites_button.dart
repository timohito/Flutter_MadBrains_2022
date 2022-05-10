import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

class FavoritesButton extends StatefulWidget {
  const FavoritesButton({Key? key}) : super(key: key);

  @override
  State<FavoritesButton> createState() => _FavoritesButtonState();
}

class _FavoritesButtonState extends State<FavoritesButton> {
  @override
  Widget build(BuildContext context) {
    const double size = 40;

    return FavoriteButton(
      isFavorite: false,
      valueChanged: (_isFavorite) {
        _isFavorite = !_isFavorite;
      },
    );
  }
}
