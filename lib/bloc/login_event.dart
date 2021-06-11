abstract class LoginEvent {}

class LoginCarketaAPIEvent extends LoginEvent {
  LoginCarketaAPIEvent({this.email, this.password});
  String email;
  String password;
}
