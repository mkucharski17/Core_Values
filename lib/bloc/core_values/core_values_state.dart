part of 'core_values_cubit.dart';

abstract class CoreValuesState extends Equatable {
  const CoreValuesState();
}

class CoreValuesInitial extends CoreValuesState {
  @override
  List<Object> get props => [];
}

class CoreValuesUpdated extends CoreValuesState {
  final List<String> coreValues;

  CoreValuesUpdated(this.coreValues);
  @override
  List<Object> get props => [coreValues];
}
