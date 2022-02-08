library flutter_awesome_loading_timer;

import 'dart:async';

import 'package:flutter/material.dart';

class AwesomeLoadingTimer extends StatefulWidget {
  final int? seconds;
  final String? timeOverMsg;
  final Widget? child;

  const AwesomeLoadingTimer(
      {Key? key, this.seconds, this.child, this.timeOverMsg})
      : super(key: key);
  @override
  _AwesomeLoadingTimerState createState() => _AwesomeLoadingTimerState();
}

class _AwesomeLoadingTimerState extends State<AwesomeLoadingTimer> {
  bool countOver = false;
  late Timer timer;
  @override
  void initState() {
    timer = Timer(
      Duration(
        seconds: widget.seconds ?? 2,
      ),
      () => setState(
        () {
          countOver = true;
        },
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return countOver
        ? Center(
            child: widget.child ?? Text(widget.timeOverMsg ?? 'No data'),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
