import 'package:assessment/utils/custom_color.dart';
import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;
  final Color? color;
  final double size;

  const StarRating({
    Key? key,
    this.rating = 0.0,
    this.color,
    this.size = 14.0,
  }) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < widget.rating.floor()
              ? Icons.star
              : index < widget.rating.ceil() ? Icons.star_half : Icons.star_border,
          color: CustomColor.starColor,
          size: widget.size,
        );
      }),
    );
  }
}