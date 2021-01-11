part of 'favourites_cubit.dart';

@immutable
abstract class FavouritesState extends Equatable {}

class FavouritesInitial extends FavouritesState {
  @override
  List<Object> get props => [];
}

class FavouritesUpdated extends FavouritesState {
  final List<String> coreValues;

  FavouritesUpdated(this.coreValues);
  @override
  List<Object> get props => [coreValues];
}
