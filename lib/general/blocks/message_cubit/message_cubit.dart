import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/general/blocks/message_cubit/message_state.dart';
import 'package:socialapp/general/blocks/register_cubit/register_states.dart';
import 'package:socialapp/general/models/message_model/message_model.dart';
import 'package:socialapp/general/models/register_model/registerModel.dart';
import 'package:socialapp/general/utilities/utils_functions/ApiNames.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitialState());

  static MessageCubit get(context) => BlocProvider.of(context);

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
      senderId: ApiNames.uId,
      receiverId: receiverId,
      dateTime: dateTime,
      text: text,
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(ApiNames.uId)
        .collection("chats")
        .doc(receiverId)
        .collection("messages")
        .add(model.toJson())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState(error));
    });

    FirebaseFirestore.instance
        .collection("users")
        .doc(receiverId)
        .collection("chats")
        .doc(ApiNames.uId)
        .collection("messages")
        .add(model.toJson())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState(error));
    });
  }

  List<MessageModel> messages = [];

  void getMessages({required String receiverId}) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(ApiNames.uId)
        .collection("chats")
        .doc(receiverId)
        .collection("messages")
        .orderBy("dateTime")
        .snapshots()
        .listen((event) {
          messages=[];
          event.docs.forEach((element) {
            messages.add(MessageModel.fromJson(element.data()));
          });
          emit(GetMessageSuccessState());

    });
  }
}
