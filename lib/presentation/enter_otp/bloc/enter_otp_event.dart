import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class EnterOTPEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EnterOTPInitialEvent extends EnterOTPEvent {}
