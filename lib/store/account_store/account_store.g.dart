// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountStore on _AccountStore, Store {
   final _$loadingAtom =
      Atom(name: '_AccountStore.loading',);

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

   final _$emailAtom = Atom(name: '_AccountStore.email', );

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

   final _$_AccountStoreActionController =
      ActionController(name: '_AccountStore', );

  @override
  void load(bool load) {
    final _$actionInfo =
        _$_AccountStoreActionController.startAction(name: '_AccountStore.load');
    try {
      return super.load(load);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
        name: '_AccountStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
email: ${email}
    ''';
  }
}

mixin _$AccountErrorStore on _AccountErrorStore, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_AccountErrorStore.hasErrors'))
          .value;

   final _$emailAtom =
      Atom(name: '_AccountErrorStore.email',);

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
email: ${email},
hasErrors: ${hasErrors}
    ''';
  }
}
