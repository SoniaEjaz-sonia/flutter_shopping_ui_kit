import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({super.key, this.rating, this.size});

  final double? rating;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) => _buildStar(index, rating!)),
    );
  }

  _buildStar(int index, double rating) {
    IconData icon;
    Color color;
    if (index >= rating) {
      icon = Icons.star;
      color = Colors.grey;
    } else if (index > rating - 1 && index < rating) {
      icon = Icons.star_half;
      color = Colors.yellow;
    } else {
      icon = Icons.star;
      color = Colors.yellow;
    }
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
