import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.purple : Colors.purpleAccent,
          ),
        );
      },
    ));
  }
}
