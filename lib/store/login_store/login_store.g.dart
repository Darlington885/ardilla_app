// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  final _$loadingAtom =
      Atom(name: '_LoginStore.loading',);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

   final _$passwordVisibleAtom =
      Atom(name: '_LoginStore.passwordVisible',);

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

   final _$emailAtom = Atom(name: '_LoginStore.email',);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

   final _$proceedButtonActiveAtom =
      Atom(name: '_LoginStore.proceedButtonActive',);

  @override
  bool get proceedButtonActive {
    _$proceedButtonActiveAtom.reportRead();
    return super.proceedButtonActive;
  }

  @override
  set proceedButtonActive(bool value) {
    _$proceedButtonActiveAtom.reportWrite(value, super.proceedButtonActive, () {
      super.proceedButtonActive = value;
    });
  }

  final _$passwordAtom =
      Atom(name: '_LoginStore.password',);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

   final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore',);

  @override
  void load(bool load) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.load');
    try {
      return super.load(load);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
passwordVisible: ${passwordVisible},
email: ${email},
proceedButtonActive: ${proceedButtonActive},
password: ${password}
    ''';
  }
}

mixin _$LoginErrorStore on _LoginErrorStore, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_LoginErrorStore.hasErrors'))
          .value;

   final _$emailAtom =
      Atom(name: '_LoginErrorStore.email',);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

   final _$passwordAtom =
      Atom(name: '_LoginErrorStore.password',);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
hasErrors: ${hasErrors}
    ''';
  }
}
