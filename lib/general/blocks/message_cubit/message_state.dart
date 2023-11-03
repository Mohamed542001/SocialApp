abstract class MessageState {}

class MessageInitialState extends MessageState {}

class SendMessageSuccessState extends MessageState{}
class SendMessageErrorState extends MessageState {
  final String error;

  SendMessageErrorState(this.error);
}

class GetMessageSuccessState extends MessageState{}
class GetMessageErrorState extends MessageState {
  final String error;

  GetMessageErrorState(this.error);
}