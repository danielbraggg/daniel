import 'package:daniel_project/model/login_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => <Object>[];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => <Object>[];
}

class LoginFailedState extends LoginState {
  @override
  List<Object> get props => <Object>[];
}

class LoginSuccessState extends LoginState {
  LoginSuccessState(this.loginModel);

  final LoginModel loginModel;

  @override
  List<Object> get props => <Object>[];
}
