import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppInitialEvent extends AppEvent {

  @override
  List<Object?> get props => [];
}

class AppThemeChangeEvent extends AppEvent {
  const AppThemeChangeEvent();

  @override
  List<Object?> get props => [];
}
