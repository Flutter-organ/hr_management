import 'package:equatable/equatable.dart';

import '../../domain/entity/expense.dart';
import '../../domain/entity/expense_category.dart';

class ExpensesState extends Equatable {
  final List<Expense> expenses;
  final ExpenseStatus? selectedStatus;
  final bool isLoading;
  final bool isDeleting;
  final String? error;
  final String? deleteError;

  const ExpensesState({
    this.expenses = const [],
    this.selectedStatus = ExpenseStatus.pending,
    this.isLoading = false,
    this.isDeleting = false,
    this.error,
    this.deleteError,
  });

  int get pendingCount =>
      expenses.where((e) => e.status.isPending).length;

  int get approvedCount =>
      expenses.where((e) => e.status.isApproved).length;

  int get rejectedCount =>
      expenses.where((e) => e.status.isRejected).length;

  bool get isEmpty => expenses.isEmpty;

  ExpensesState copyWith({
    List<Expense>? expenses,
    ExpenseStatus? selectedStatus,
    bool? isLoading,
    bool? isDeleting,
    String? error,
    String? deleteError,
    bool clearError = false,
    bool clearDeleteError = false,
  }) {
    return ExpensesState(
      expenses: expenses ?? this.expenses,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      isLoading: isLoading ?? this.isLoading,
      isDeleting: isDeleting ?? this.isDeleting,
      error: clearError ? null : (error ?? this.error),
      deleteError:
      clearDeleteError ? null : (deleteError ?? this.deleteError),
    );
  }

  @override
  List<Object?> get props => [
    expenses,
    selectedStatus,
    isLoading,
    isDeleting,
    error,
    deleteError,
  ];
}