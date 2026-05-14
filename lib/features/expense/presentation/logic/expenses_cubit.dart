import 'package:hr_management/core/presentation/base_viewmodel/base_cubit.dart';
import '../../domain/entity/expense.dart';
import '../../domain/entity/expense_category.dart';
import '../../domain/usecase/delete_expense_usecase.dart';
import '../../domain/usecase/get_expenses_usecase.dart';
import 'expenses_state.dart';

class ExpensesCubit extends BaseCubit<ExpensesState> {
  final GetExpensesUseCase _getExpensesUseCase;
  final DeleteExpenseUseCase _deleteExpenseUseCase;

  ExpensesCubit({
    required GetExpensesUseCase getExpensesUseCase,
    required DeleteExpenseUseCase deleteExpenseUseCase,
  })  : _getExpensesUseCase = getExpensesUseCase,
        _deleteExpenseUseCase = deleteExpenseUseCase,
        super(const ExpensesState());

  Future<void> loadExpenses() async {
    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(
          isLoading: true,
          clearError: true,
        ),
      ),
      call: () => _getExpensesUseCase(
        status: state.selectedStatus,
      ),
      onSuccess: (expenses) {
        updateState(
              (s) => s.copyWith(
            isLoading: false,
            expenses: expenses,
          ),
        );
      },
      onError: (error) {
        updateState(
              (s) => s.copyWith(
            isLoading: false,
            error: error.message,
          ),
        );
      },
    );
  }

  Future<void> onTabChanged(ExpenseStatus status) async {
    if (state.selectedStatus == status) return;

    updateState(
          (s) => s.copyWith(
        selectedStatus: status,
        expenses: [],
        clearError: true,
      ),
    );

    await loadExpenses();
  }

  Future<void> deleteExpense(Expense expense) async {
    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(
          isDeleting: true,
          clearDeleteError: true,
        ),
      ),
      call: () => _deleteExpenseUseCase(expense),
      onSuccess: (_) {
        final updated = state.expenses
            .where((e) => e.id != expense.id)
            .toList();

        updateState(
              (s) => s.copyWith(
            isDeleting: false,
            expenses: updated,
          ),
        );
      },
      onError: (error) {
        updateState(
              (s) => s.copyWith(
            isDeleting: false,
            deleteError: error.message,
          ),
        );
      },
    );
  }

  void clearError() {
    updateState((s) => s.copyWith(clearError: true));
  }

  void clearDeleteError() {
    updateState((s) => s.copyWith(clearDeleteError: true));
  }
}