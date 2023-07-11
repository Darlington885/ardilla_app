import 'package:validators/validators.dart';
import 'package:mobx/mobx.dart';
import 'package:local_auth/local_auth.dart';

part 'account_store.g.dart';


class AccountStore = _AccountStore with _$AccountStore;

abstract class _AccountStore with Store {
  final AccountErrorStore error = AccountErrorStore();
  var localAuth = LocalAuthentication();


  @observable
  bool loading = false;

  @observable
  String email;



  @action
  void load(bool load) {
    this.loading = load;
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
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  bool get hasErrors {

    validateEmail(email);
    return error.hasErrors;
  }

  // bool get hasErrorsPhone {
  //   validatePhone(phoneNumber);
  //
  //   return error.hasErrorsPhone;
  // }




}

class AccountErrorStore = _AccountErrorStore with _$AccountErrorStore;

abstract class _AccountErrorStore with Store {

  @observable
  String email;



  @computed
  bool get hasErrors => email != null;


}