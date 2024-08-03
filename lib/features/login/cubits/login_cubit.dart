import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_allah/features/login/local_data/local_data.dart';

import '../../../core/services/firestore_services.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginInitialState());

  String _email = '';
  String _password = '';

  void login() async {
    emit(LoginLoadingState());

    // Get the list of users
    final result = await FirestoreServices.getUserAuthList();

    result.fold(
      (failure) {
        emit(LoginErrorState(failure.message));
      },
      (users) {
        // Check if the username and password are correct
        for (var user in users) {
          if (user.username == _email && user.password == _password) {
            LocalData.setIsLogin(true);
            emit(LoginSuccessState());
            return;
          }
        }

        // If the username and password are incorrect, emit an error state
        emit(LoginErrorState('Invalid username or password'));
      },
    );
  }

  void updateEmail(String email) => _email = email;

  void updatePassword(String password) => _password = password;
}
