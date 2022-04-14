import 'package:bloc/bloc.dart';
import 'package:budget_app_mobile/cubits/addMovementCubit/addMovement_state.dart';

class AddMovementCubit extends Cubit<AddMovementState> {
  AddMovementCubit() : super(AddMovementInitialState()) {
    emit(AddMovementLoadingState());
  }
}
