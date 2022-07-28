import 'package:bloc/bloc.dart';
import 'package:bloc_stack_meeting/core/data/repositories/authentication_repository_impl.dart';
import 'package:equatable/equatable.dart';

import '../../../core/domain/repositories/authentication_repository.dart';
import '../../../core/handlers/result/result.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository authRepo = AuthenticationRepositoryImpl();
  LoginCubit() : super(const LoginState.initial());

  onLogin() async {
    emit(state.copyWith(isLoading: true));
    final Result<String, void> result =
        await authRepo.login(state.email, state.pass);

    if (result.hasError) {
      emit(state.copyWith(error: result.error));
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(success: true));
      emit(state.copyWith(isLoading: false));
    }
  }

  onEmailChanged(String email) => emit(state.copyWith(email: email));

  onPassChanged(String pass) => emit(state.copyWith(pass: pass));
}
