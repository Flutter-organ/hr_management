import 'package:flutter_bloc/flutter_bloc.dart';

import '../exceptions/ui_errors.dart';

abstract class BaseCubit<State> extends Cubit<State> {
  BaseCubit(super.initialState);

  Future<void> execute<T>({
    required Future<T> Function() call,
    required void Function(T result) onSuccess,
    required void Function(UiError error) onError,
    void Function()? onLoading,
  }) async {
    onLoading?.call();

    try {
      final result = await call();
      onSuccess(result);
    } on UiError catch (e) {
      onError(e);
    } catch (e) {

    }
  }

  void _handleUnauthorized() {
    // Override in subclass if needed
  }
}