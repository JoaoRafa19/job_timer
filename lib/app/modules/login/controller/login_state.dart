part of 'login_controller.dart';

enum LoginStatus {
  inital,
  loading,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final String? message;

  const LoginState._(this.status, this.message);

  const LoginState.initial() : this._(LoginStatus.inital, null);

  @override
  List<Object?> get props => [status, message];

  LoginState copyWith({
    LoginStatus? status,
    String? message,
  }) {
    return LoginState._(status ?? this.status, message ?? this.message);
  }
}
