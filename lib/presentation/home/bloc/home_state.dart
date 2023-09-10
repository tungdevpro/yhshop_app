import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeFeedActive extends HomeState {
  final int index;

  HomeFeedActive({this.index = 0});

  @override
  List<Object?> get props => [index];
}
