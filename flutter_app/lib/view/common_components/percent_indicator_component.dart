import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class PercentIndicatorComponent extends StatefulWidget {
  const PercentIndicatorComponent({Key key, this.percent=0}) : super(key: key);

  @override
  _PercentIndicatorComponentState createState() => _PercentIndicatorComponentState();
  final double percent;
}

class _PercentIndicatorComponentState extends State<PercentIndicatorComponent> {

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator( //leaner progress bar
      animation: true,
      animationDuration: 1000,
      lineHeight: 9.0,
      percent:widget.percent/90,
      center: Text(
        ''
      ),
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: Colors.blue[400],
      backgroundColor: Colors.grey[300],

    );
  }
}
