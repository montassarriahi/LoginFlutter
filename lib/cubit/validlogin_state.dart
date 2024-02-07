part of 'validlogin_cubit.dart';

@immutable
sealed class ValidloginState {}

final class ValidloginInitial extends ValidloginState {}

class Validlogins extends ValidloginState {
  final String Email;
  final String Password;

  Validlogins({required this.Email, required this.Password});

}

class loginFailure extends ValidloginState{
    final String Email;
  final String Password;

  loginFailure({required this.Email, required this.Password});
}

