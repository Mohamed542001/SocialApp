import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/general/blocks/register_cubit/register_states.dart';
import 'package:socialapp/general/models/register_model/registerModel.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    print('Hello');
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) async {
      print(value.user?.email);
      print(value.user?.uid);

      RegisterModel model = RegisterModel(
        name: name,
        email: email,
        phone: phone,
        uId: value.user?.uid,
        bio: 'write your bio....',
        image:
            'https://i.stack.imgur.com/l60Hf.png',
        cover: "https://tokystorage.s3.amazonaws.com/images/default-cover.png",
        isEmailVerification: false,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(value.user?.uid)
          .set(model.toJson())
          .then((value) {
        emit(RegisterSuccessState());
      }).catchError((error) {
        emit(CreateUserErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }
}
