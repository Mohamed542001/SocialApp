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
              'https://img.freepik.com/free-photo/man-listening-music-by-wireless-earphones_53876-98050.jpg?w=996&t=st=1698067585~exp=1698068185~hmac=e5811e1525fd2cd5908a42077858f7c30cb42e24d2171608f343b9f271e2517f',
          isEmailVerification: false);

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
