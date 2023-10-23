import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/general/blocks/home_cubit/home_cubit.dart';
import 'package:socialapp/general/models/register_model/registerModel.dart';
import 'package:socialapp/general/utilities/utils_functions/ApiNames.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottom(index) {
    if(index == 2){
      emit(HomeAddPostState());
    } else{
      currentIndex = index;
      emit(HomeChangeBottomNavState());
    }

  }
  RegisterModel? model;

  void getUserData() {
    FirebaseFirestore.instance.collection("users")
        .doc(ApiNames.uId)
        .get()
        .then((value) {
          model = RegisterModel.fromJson(value.data());
          print("model = ${model?.email}");
          emit(HomeSuccessState());
          model = RegisterModel.fromJson(value.data());

    })
        .catchError((error) {
      emit(HomeErrorState(error.toString()));

    });
  }
}
