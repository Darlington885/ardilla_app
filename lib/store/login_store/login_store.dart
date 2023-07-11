import 'dart:async';

import 'package:ardilla/screen/dashboard/dashboard_screen.dart';
import 'package:ardilla/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'login_store.g.dart';

class LoginStore extends _LoginStore with _$LoginStore {}

abstract class _LoginStore with Store {
  final LoginErrorStore error = LoginErrorStore();
  var localAuth = LocalAuthentication();

  @observable
  bool loading = false;

  @observable
  bool passwordVisible = true;

  @observable
  String email;

  @observable
  bool proceedButtonActive = false;

  @observable
  String password = '';

  @action
  void load(bool load) {
    this.loading = load;
  }

  @action
  void validatePassword(String value) {
    error.password =
        isNull(value) || value.isEmpty ? 'Password is required' : null;
  }

  @action
  void validateEmail(String value) {
    if (isNull(value) || value.isEmpty)
      error.email = 'Email is required';
    else if (!isEmail(value))
      error.email = 'Enter a valid email';
    else
      error.email = null;
  }

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  bool get hasErrors {
    validateEmail(email);
    validatePassword(password);

    return error.hasErrors;
  }

  Future<void> submit(BuildContext context, Function(String) s, Function(String) e) async {
    if (hasErrors) return;

    try {
      load(true);


      await navigateReplace(context, DashBoardScreen());

    } catch (e) {
      e('An error occurred');
    } finally {
      load(false);
    }
  }
}

class LoginErrorStore = _LoginErrorStore with _$LoginErrorStore;

abstract class _LoginErrorStore with Store {
  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors => email != null || password != null;
}
