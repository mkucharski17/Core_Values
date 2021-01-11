import 'package:core_values/bloc/core_values/core_values_cubit.dart';
import 'package:core_values/ui/core_value_list/core_value_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoreValueListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreValuesCubit, CoreValuesState>(
        builder: (context, state) {
      if (state is CoreValuesInitial)
        return CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
        );
      final CoreValuesUpdated coreValuesUpdatedState = state;

      return CoreValueListWidget(
        coreValues: coreValuesUpdatedState.coreValues,
      );
    });
  }
}
