import 'package:core_values/bloc/core_values/core_values_cubit.dart';
import 'package:core_values/ui/core_value/animated_core_value_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoreValueScreen extends StatefulWidget {
  @override
  _CoreValueScreenState createState() => _CoreValueScreenState();
}

class _CoreValueScreenState extends State<CoreValueScreen>
    with SingleTickerProviderStateMixin {
  List<String> coreValues;
  int currentValueIndex = 1;
  int nextValueIndex = 0;
  AnimationController _controller;
  Animation<Offset> _lowerAnimation;
  Animation<Offset> _higherAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addStatusListener(changeValues);
    _lowerAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 1),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInQuart));
    _higherAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInQuart));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CoreValuesCubit, CoreValuesState>(
          builder: (context, state) {
        if (state is CoreValuesUpdated) {
          coreValues = state.coreValues;
          return Stack(
            children: [
          AnimatedCoreValueBox(
            valueText: coreValues[nextValueIndex],
            offset: _higherAnimation,
          ),
          AnimatedCoreValueBox(
            valueText: coreValues[currentValueIndex],
            offset: _lowerAnimation,
          )
            ],
          );
        } else
          return CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          );
      }),
    );
  }

  void changeValues(AnimationStatus status) {
    Future.delayed(const Duration(seconds: 5), () {
      if (this.mounted)
        setState(() {
          if (status == AnimationStatus.completed) {
            {
              _controller.reset();
              currentValueIndex = nextValueIndex;
              nextValueIndex = (nextValueIndex - 1) % coreValues.length;
              _controller.forward();
            }
          }
        });
    });
  }
}
