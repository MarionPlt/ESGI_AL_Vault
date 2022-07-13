part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ReconnectionRequested extends AuthEvent {}

class SignInRequested extends AuthEvent {
  final String username;
  final String password;

  SignInRequested(this.username, this.password);
}

class SignUpRequested extends AuthEvent {
  final String username;
  final String password;

  SignUpRequested(this.username, this.password);
}

class SignOutRequested extends AuthEvent {}
