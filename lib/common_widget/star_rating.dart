import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int maxRating;
  final Function(int) onRatingChanged;
  final int initialRating;

  const StarRating({
    super.key,
    required this.maxRating,
    required this.onRatingChanged,
    this.initialRating = 0,
  });

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.maxRating, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _currentRating = index + 1;
                widget.onRatingChanged(_currentRating);
              });
            },
            child: index < _currentRating
                ? Image.asset(
              "assets/img/star.png",
              color: Colors.yellow

            )
                : Image.asset(
              "assets/img/star.png",
            ),
            // child: Icon(
            //   index < _currentRating ? Icons.star : Icons.star_border,
            //   color: index < _currentRating ? Colors.yellow : Colors.grey,
            // ),
          ),
        );
      }),
    );
  }
}

