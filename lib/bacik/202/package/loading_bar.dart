import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key, this.spinKitSize});
  final double? spinKitSize;
  final double nullableValueSize = 50.0;
  @override
  Widget build(BuildContext context) {
    final spinKitPianoVawe = SpinKitPianoWave(
      color: Colors.red,
      size: spinKitSize ?? nullableValueSize,
    );
    return spinKitPianoVawe;
  }
}
