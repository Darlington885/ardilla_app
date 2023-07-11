// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStore, Store {
   final _$loadingAtom =
      Atom(name: '_RegisterStore.loading', );

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

   final _$usernameAtom =
      Atom(name: '_RegisterStore.username',);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

   final _$firstNameAtom =
      Atom(name: '_RegisterStore.firstName',);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

   final _$lastNameAtom =
      Atom(name: '_RegisterStore.lastName',);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  final _$phoneNumberAtom =
      Atom(name: '_RegisterStore.phoneNumber',);

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

   final _$invite_codeAtom =
      Atom(name: '_RegisterStore.invite_code',);

  @override
  String get invite_code {
    _$invite_codeAtom.reportRead();
    return super.invite_code;
  }

  @override
  set invite_code(String value) {
    _$invite_codeAtom.reportWrite(value, super.invite_code, () {
      super.invite_code = value;
    });
  }

   final _$passwordAtom =
      Atom(name: '_RegisterStore.password',);

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

  final _$emailAtom = Atom(name: '_RegisterStore.email',);

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

  final _$_RegisterStoreActionController =
      ActionController(name: '_RegisterStore',);

  @override
  void load(bool load) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.load');
    try {
      return super.load(load);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUsername(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.validateUsername');
    try {
      return super.validateUsername(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFirstName(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.validateFirstName');
    try {
      return super.validateFirstName(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLastName(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.validateLastName');
    try {
      return super.validateLastName(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhone(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.validatePhone');
    try {
      return super.validatePhone(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateInvite(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.validateInvite');
    try {
      return super.validateInvite(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
username: ${username},
firstName: ${firstName},
lastName: ${lastName},
phoneNumber: ${phoneNumber},
invite_code: ${invite_code},
password: ${password},
email: ${email}
    ''';
  }
}

mixin _$RegisterErrorStore on _RegisterErrorStore, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_RegisterErrorStore.hasErrors'))
          .value;
  Computed<bool> _$hasErrorsEmailComputed;

  @override
  bool get hasErrorsEmail =>
      (_$hasErrorsEmailComputed ??= Computed<bool>(() => super.hasErrorsEmail,
              name: '_RegisterErrorStore.hasErrorsEmail'))
          .value;

  final _$usernameAtom =
      Atom(name: '_RegisterErrorStore.username',);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

   final _$firstNameAtom =
      Atom(name: '_RegisterErrorStore.firstName',);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

   final _$lastNameAtom =
      Atom(name: '_RegisterErrorStore.lastName',);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

   final _$phoneNumberAtom =
      Atom(name: '_RegisterErrorStore.phoneNumber',);

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$invite_codeAtom =
      Atom(name: '_RegisterErrorStore.invite_code', );

  @override
  String get invite_code {
    _$invite_codeAtom.reportRead();
    return super.invite_code;
  }

  @override
  set invite_code(String value) {
    _$invite_codeAtom.reportWrite(value, super.invite_code, () {
      super.invite_code = value;
    });
  }

   final _$passwordAtom =
      Atom(name: '_RegisterErrorStore.password',);

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

  final _$emailAtom =
      Atom(name: '_RegisterErrorStore.email',);

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

  @override
  String toString() {
    return '''
username: ${username},
firstName: ${firstName},
lastName: ${lastName},
phoneNumber: ${phoneNumber},
invite_code: ${invite_code},
password: ${password},
email: ${email},
hasErrors: ${hasErrors},
hasErrorsEmail: ${hasErrorsEmail}
    ''';
  }
}
