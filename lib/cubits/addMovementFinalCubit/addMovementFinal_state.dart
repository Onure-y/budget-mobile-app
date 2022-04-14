import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AddMovementFinalState extends Equatable {}

class AddMovementFinalInitialState extends AddMovementFinalState {
  @override
  List<Object?> get props => [];
}

class AddMovementFinalLoadingState extends AddMovementFinalState {
  @override
  List<Object?> get props => [];
}

class AddMovementFinalLoadedState extends AddMovementFinalState {
  AddMovementFinalLoadedState({required this.moneyValueController});
  final TextEditingController moneyValueController;
  @override
  List<Object?> get props => [moneyValueController];
}
