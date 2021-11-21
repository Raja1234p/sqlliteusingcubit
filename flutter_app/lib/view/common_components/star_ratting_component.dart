import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';


class StarRating extends StatelessWidget {
  final void Function(int index) onChanged;
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;
  final double size;
  final double paddingValue;

  const StarRating({
    Key key,
    this.onChanged,
    this.value = 0,
    this.filledStar,
    this.unfilledStar, this.size=20, this.paddingValue=4.0,
  })  : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = ColorConstants.reviewStarColor;


    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(

          onTap: onChanged != null
              ? () {
            onChanged(value == index + 1 ? index : index + 1);
          }
              : null,


          child: Padding(
            padding:  EdgeInsets.only(right: paddingValue),
            child: SvgPicture.asset(
              index < value //
                  ? filledStar ?? AssetConstants.starEnableSVG
                  : unfilledStar ?? AssetConstants.starDisableSVG,
              height: size,
              color: index < value ? color : null,
            ),
          ),


        );
      }),
    );
  }
}

class StatefulWrtieReviewStarRating extends StatefulWidget {
  final double iconSize;
  final MainAxisAlignment mainAxisAlignment;
  final Function(int) onRating;
  final int rating;
  final double rightPadding;
  const StatefulWrtieReviewStarRating({
    Key key,
    this.iconSize = 20,
    this.onRating,
    this.rating,
    this.mainAxisAlignment = MainAxisAlignment.start, this.rightPadding=4,
  }) : super(key: key);

  @override
  _StatefulWrtieReviewStarRatingState createState() =>
      _StatefulWrtieReviewStarRatingState();
}

class _StatefulWrtieReviewStarRatingState
    extends State<StatefulWrtieReviewStarRating> {
  @override
  Widget build(BuildContext context) {
    return StarRating(
      paddingValue: widget.rightPadding,
      size: widget.iconSize,
      onChanged: (index) {
        widget.onRating(index);
      },
      value: widget.rating == null ? 0 : widget.rating,
    );
  }
}
