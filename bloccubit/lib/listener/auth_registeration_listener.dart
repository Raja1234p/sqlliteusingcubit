abstract class AuthRegistrationListener {
  void success();
  void failed();
  void userExists();
  void weakPassword();
  void userNotExist();
  void passwordNotMatch();
  void login();
  void signOut();


}