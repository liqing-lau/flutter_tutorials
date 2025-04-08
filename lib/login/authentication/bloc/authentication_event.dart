/*
An input to AuthBloc and emits new AuthStates

Reacts to 2 events: 
1) AuthenticationSubscriptionRequested: initial event to notify bloc to sub 
to AuthenticationStatus stream
2) AuthenicationLogoutPressed: notify bloc that user logout 
 */

part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class AuthenticationSubscriptionRequested extends AuthenticationEvent {}

final class AuthenticationLogoutPressed extends AuthenticationEvent {}