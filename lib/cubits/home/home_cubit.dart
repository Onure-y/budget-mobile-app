import 'package:bloc/bloc.dart';
import 'package:budget_app_mobile/cubits/home/home_state.dart';
import 'package:budget_app_mobile/models/movementModel/movement_model.dart';
import 'package:budget_app_mobile/models/userModel/user_model.dart';
import 'package:budget_app_mobile/repositories/user_repositories.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.userRepository}) : super(HomeInitalState()) {
    emit(HomeLoadingState());
    initState();
  }

  final UserRepository userRepository;
  double incomeValue = 0;
  double expenseValue = 0;
  double budgetValue = 0;
  double recentValue = 0;
  double incomeDeg = 0;
  List<MovementModel> recentMovements = [];

  Future initState() async {
    await resetValues();
    await getCurrentMonthIncomeMovements();
    await getCurrentMonthExpenseMovements();
    await calculateIncomeValueForCurrentMonth();
    await calculateExpenseValueForCurrentMonth();
    await calculateBalance();
    await getLastRecentMovements();
    await calculateRecentValue();
    await calculateDegrees();
    await emitPage();
  }

  Future emitPage() async {
    emit(
      HomeLoadedState(
        incomeValue: incomeValue,
        expenseValue: expenseValue,
        budgetValue: budgetValue,
        recentMovements: recentMovements,
        recentValue: recentValue,
        incomeDeg: incomeDeg,
      ),
    );
  }

  Future resetValues() async {
    incomeValue = 0;
    expenseValue = 0;
    budgetValue = 0;
    recentValue = 0;
    incomeDeg = 0;
    recentMovements = [];
  }

  Future<List<MovementModel>> getCurrentMonthIncomeMovements() async {
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    UserModel userData = await userRepository.getUserData();
    List<MovementModel> movements = userData.allMovements;
    List<MovementModel> incomeMovements = [];

    for (var i = 0; i < movements.length; i++) {
      DateTime modelDateTime =
          DateTime.fromMillisecondsSinceEpoch(movements[i].time);
      if (year == modelDateTime.year && month == modelDateTime.month) {
        if (movements[i].moneyValue > 0) {
          incomeMovements.add(movements[i]);
        } else {}
      }
    }
    return incomeMovements;
  }

  Future<List<MovementModel>> getCurrentMonthExpenseMovements() async {
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    UserModel userData = await userRepository.getUserData();
    List<MovementModel> movements = userData.allMovements;
    List<MovementModel> expenseMovements = [];

    for (var i = 0; i < movements.length; i++) {
      DateTime modelDateTime =
          DateTime.fromMillisecondsSinceEpoch(movements[i].time);
      if (year == modelDateTime.year && month == modelDateTime.month) {
        if (movements[i].moneyValue < 0) {
          expenseMovements.add(movements[i]);
        } else {}
      }
    }
    return expenseMovements;
  }

  Future getLastRecentMovements() async {
    UserModel userData = await userRepository.getUserData();
    List<MovementModel> allMovements = userData.allMovements.reversed.toList();
    for (var i = 0; i < 3; i++) {
      recentMovements.add(allMovements[i]);
    }
  }

  Future calculateRecentValue() async {
    for (MovementModel recentMovement in recentMovements) {
      recentValue = recentValue + recentMovement.moneyValue;
    }
  }

  Future calculateIncomeValueForCurrentMonth() async {
    List<MovementModel> incomeMovements =
        await getCurrentMonthIncomeMovements();

    for (MovementModel incomeMovement in incomeMovements) {
      incomeValue = incomeValue + incomeMovement.moneyValue;
    }
  }

  Future calculateExpenseValueForCurrentMonth() async {
    List<MovementModel> expenseMovements =
        await getCurrentMonthExpenseMovements();

    for (MovementModel expenseMovement in expenseMovements) {
      expenseValue = expenseValue + expenseMovement.moneyValue;
    }
  }

  Future calculateBalance() async {
    budgetValue = incomeValue + expenseValue;
  }

  Future calculateDegrees() async {
    double allValue = incomeValue + expenseValue.abs();
    incomeDeg = (incomeValue / allValue) * 360;
  }
}
