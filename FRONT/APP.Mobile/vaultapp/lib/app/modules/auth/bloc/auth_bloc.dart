import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultapp/app/modules/auth/data/repositories/auth_repository.dart';
import 'package:vaultapp/app/modules/auth/data/repositories/secure_storage_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository = AuthRepository();
  final SecureStorageRepository _secureStorageRepository =
      SecureStorageRepository();

  AuthBloc() : super(UnAuthenticated()) {
    on<ReconnectionRequested>(((event, emit) async {
      emit(AuthLoading());
      try {
        final userId = await _secureStorageRepository.getUserId();
        if (userId != null) {
          emit(Authenticated(userId));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    }));
    on<SignInRequested>(((event, emit) async {
      emit(AuthLoading());
      try {
        final userId =
            await authRepository.login(event.username, event.password);

        await _secureStorageRepository.saveUserId(userId);

        emit(Authenticated(userId));
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    }));
    on<SignUpRequested>(((event, emit) async {
      emit(AuthLoading());
      try {
        final userId =
            await authRepository.register(event.username, event.password);

        await _secureStorageRepository.saveUserId(userId);

        emit(Authenticated(userId));
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    }));
    on<SignOutRequested>(((event, emit) async {
      emit(AuthLoading());
      try {
        await _secureStorageRepository.removeUserId();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    }));
  }
}
