import 'package:daniel_project/bloc/login_state.dart';
import 'package:daniel_project/model/login_model.dart';
import 'package:daniel_project/services/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.apiService);
  ApiService apiService;

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginCarketaAPIEvent) {
      yield LoginLoadingState();

      try {
        LoginModel loginModel =
            await apiService.loginUser(event.email, event.password);
        print(loginModel.toJson().toString());
        if (loginModel.success) {
          yield LoginSuccessState(loginModel);
        } else {
          yield LoginFailedState();
        }
      } catch (e) {}
    }
  }
}
