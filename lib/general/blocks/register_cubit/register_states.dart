
abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{}
class CreateUserSuccessState extends RegisterStates{}
class CreateUserErrorState extends RegisterStates{
  final String error;
  CreateUserErrorState(this.error);
}

class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);
}