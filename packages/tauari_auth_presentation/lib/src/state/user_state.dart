import 'package:equatable/equatable.dart';
import 'package:tauari_auth/tauari_auth.dart';

enum UserWorkingState { initial, loading, success, failure }

class UserState extends Equatable {
  const UserState({
    required this.workingState,
    required this.data,
    this.message,
  });
  final UserWorkingState workingState;
  final UserEntity? data;
  final String? message;

  const UserState.initial({
    this.workingState = UserWorkingState.initial,
    this.data,
    this.message,
  });

  UserState copyWith({
    UserWorkingState? workingState,
    UserEntity? data,
    String? message,
    bool forceSetData = false,
  }) =>
      UserState(
        workingState: workingState ?? this.workingState,
        data: forceSetData ? data : data ?? this.data,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [workingState, data, message];
}
