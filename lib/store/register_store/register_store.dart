
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  final RegisterErrorStore error = RegisterErrorStore();
  var localAuth = LocalAuthentication();

  @observable
  bool loading = false;

  @observable
  String username;

  @observable
  String firstName;

  @observable
  String lastName;

  @observable
  String phoneNumber;

  @observable
  String invite_code;

  @observable
  String password;

  @observable
  String email;


  @action
  void load(bool load) {
    this.loading = load;
  }

  @action
  void validateUsername(String value) {
    if (isNull(value) || value.isEmpty)
      error.username = 'Username is required';
    else
      error.username = null;
  }


  @action
  void validateFirstName(String value) {
    if (isNull(value) || value.isEmpty)
      error.firstName = 'First Name is required';
    else
      error.firstName = null;
  }

  @action
  void validateLastName(String value) {
    if (isNull(value) || value.isEmpty)
      error.lastName = 'Last Name is required';
    else
      error.lastName = null;
  }


  @action
  void validatePhone(String value) {
    if (isNull(value) || value.isEmpty)
      error.phoneNumber = 'Phone Number is required';
    else
      error.phoneNumber = null;
  }
  @action
  void validateInvite(String value) {
    if (isNull(value) || value.isEmpty)
      error.invite_code = 'Invite Code is required';
    else
      error.invite_code = null;
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
      reaction((_) => firstName, validateFirstName),
      reaction((_) => lastName, validateLastName),
      reaction((_) => phoneNumber, validatePhone),
      reaction((_) => password, validatePassword),
      reaction((_) => username, validateUsername),
      reaction((_) => invite_code, validateInvite),
      reaction((_) => email, validateEmail)
    ];
  }


  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  bool get hasErrors {
    validateUsername(username);
    validateFirstName(firstName);
    validateLastName(lastName);
    validateUsername(username);
    validatePhone(phoneNumber);
    validateInvite(invite_code);
    validatePassword(password);
    return error.hasErrors;
  }

  bool get hasErrorsEmail {
    validateEmail(email);

    return error.hasErrorsEmail;
  }


}

class RegisterErrorStore = _RegisterErrorStore with _$RegisterErrorStore;

abstract class _RegisterErrorStore with Store {

  @observable
  String username;

  @observable
  String firstName;

  @observable
  String lastName;

  @observable
  String phoneNumber;

  @observable
  String invite_code;

  @observable
  String password;

  @observable
  String email;



  @computed
  bool get hasErrors => username != null || firstName != null || lastName != null || phoneNumber != null || invite_code != null || password != null;

  @computed
  bool get hasErrorsEmail => email != null;
}
