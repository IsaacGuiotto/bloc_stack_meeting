part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String email;
  final String pass;
  final bool isLoading;
  final String error;
  final bool success;

  const LoginState({
    required this.email,
    required this.pass,
    this.isLoading = false,
    this.error = "",
    this.success = false,
  });

  const LoginState.initial()
      : email = "",
        pass = "",
        isLoading = false,
        error = "",
        success = false;

  copyWith({
    String? email,
    String? pass,
    bool? isLoading,
    String? error,
    bool? success,
  }) {
    return LoginState(
        email: email ?? this.email,
        pass: pass ?? this.pass,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        success: success ?? this.success);
  }

  @override
  List<Object?> get props => [email, pass, isLoading, error, success];
}
