import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeSectionChangedEvent extends HomeEvent {
  final int index;

  HomeSectionChangedEvent({this.index = 0});

  @override
  List<Object?> get props => [index];
}

class HomeDisplayNotificationEvent extends HomeEvent {}
