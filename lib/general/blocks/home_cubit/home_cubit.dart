import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/general/blocks/home_cubit/home_cubit.dart';
import 'package:socialapp/general/models/comment_model.dart';
import 'package:socialapp/general/models/post_model/post_model.dart';
import 'package:socialapp/general/models/register_model/registerModel.dart';
import 'package:socialapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:socialapp/user/screens/home/home_imports.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottom(index) {
    if (index == 2) {
      emit(HomeAddPostState());
    } else {
      currentIndex = index;
      emit(HomeChangeBottomNavState());
    }
  }

  RegisterModel? userModel;

  void getUserData() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(ApiNames.uId)
        .get()
        .then((value) {
      userModel = RegisterModel.fromJson(value.data());
      print("model = ${userModel?.email}");
      emit(HomeSuccessState());
      userModel = RegisterModel.fromJson(value.data());
    }).catchError((error) {
      emit(HomeErrorState(error.toString()));
    });
  }

  File? profileImage;
  ImagePicker picker = ImagePicker();

  Future<void> getProfileImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(profileImage?.path);
      emit(ProfileImageSuccessState());
    } else {
      print("No image selected");
      emit(ProfileImageErrorState());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(ProfileImageSuccessState());
    } else {
      print("No image selected");
      emit(ProfileImageErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
    required BuildContext context,
  }) {
    emit(UserUploadLoadingState());

    FirebaseStorage.instance
        .ref()
        .child("users/${Uri.file(profileImage!.path).pathSegments.last}")
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
          context: context,
        );
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
        print("error : $error}");
      });
    }).catchError((error) {
      print("error : $error}");
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
    required BuildContext context,
  }) {
    emit(UserUploadLoadingState());
    FirebaseStorage.instance
        .ref()
        .child("users/${Uri.file(coverImage!.path).pathSegments.last}")
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
          context: context,
        );
      }).catchError((error) {
        emit(UploadCoverImageErrorState());
        print("error : $error}");
      });
    }).catchError((error) {
      print("error : $error}");
    });
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    required BuildContext context,
    String? image,
    String? cover,
  }) {
    emit(UserUploadLoadingState());
    RegisterModel model = RegisterModel(
      name: name,
      phone: phone,
      bio: bio,
      image: image ?? userModel?.image,
      cover: cover ?? userModel?.cover,
      email: userModel?.email,
      uId: userModel?.uId,
      isEmailVerification: false,
    );

    FirebaseFirestore.instance
        .collection("users")
        .doc(ApiNames.uId)
        .update(model.toJson())
        .then((value) {
      getUserData();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const Home()),
        (route) => false,
      );
    }).catchError(
      (error) {
        emit(UserUploadErrorState());
      },
    );
  }

  File? postImage;

  Future<void> getPostImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(PostImageSuccessState());
    } else {
      print("No image selected");
      emit(PostImageErrorState());
    }
  }

  void removePostImage() {
    postImage = null;
    emit(RemovePostImageSuccessState());
  }

  void uploadPostImage({
    required String? text,
    required String? dateTime,
    required BuildContext context,
  }) {
    emit(CreatePostLoadingState());
    FirebaseStorage.instance
        .ref()
        .child("posts/${Uri.file(postImage!.path).pathSegments.last}")
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createPost(
          text: text,
          dateTime: dateTime,
          postImage: value,
          context: context,
        );
      }).catchError((error) {
        emit(CreatePostErrorState());
        print("error : $error}");
      });
    }).catchError((error) {
      print("error : $error}");
      emit(CreatePostErrorState());
    });
  }

  void createPost({
    required String? text,
    required String? dateTime,
    required BuildContext context,
    String? postImage,
  }) {
    emit(CreatePostLoadingState());
    PostModel model = PostModel(
      name: userModel?.name,
      text: text,
      image: userModel?.image,
      postImage: postImage ?? "",
      dateTime: dateTime,
      uId: userModel?.uId,
    );

    FirebaseFirestore.instance
        .collection("posts")
        .add(model.toJson())
        .then((value) {
      emit(CreatePostSuccessState());
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => Home(),
          ),
              (route) => false);
    }).catchError(
      (error) {
        emit(CreatePostErrorState());
      },
    );
  }

  List<RegisterModel> users = [];

  void getUsers() {
    FirebaseFirestore.instance.collection("users").get().then((value) {
      value.docs.forEach((element) {
        if(element.data()["uId"]!=ApiNames.uId)
          users.add(RegisterModel.fromJson(element.data()));
      });
      emit(GetAllUsersSuccessState());
    }).catchError((error) {
      emit(GetAllUsersErrorState(error.toString()));
    });
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];

  void getPosts() {
    FirebaseFirestore.instance.collection("posts").orderBy("dateTime").get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection("likes").get().then((value) {
          likes.add(value.docs.length);
          postsId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
          emit(GetLikesSuccessState());
        }).catchError((error) {});

      });
      emit(GetPostsSuccessState());
    }).catchError((error) {
      emit(GetPostsErrorState(error.toString()));
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection("posts")
        .doc(postId)
        .collection("likes")
        .doc(ApiNames.uId)
        .set({
      "like": true,
    }).then((value) {
      emit(LikePostSuccessState());
    }).catchError((error) {
      emit(LikePostErrorState(error.toString()));
    });
  }

  void postComment(String postId,String txt) {
    CommentModel model = CommentModel(
      comment: txt,
    );
    FirebaseFirestore.instance
        .collection("posts")
        .doc(postId)
        .collection("comments")
        .doc(ApiNames.uId)
        .set(model.toJson()).then((value) {
      emit(PostCommentSuccessState());
    }).catchError((error) {
      emit(PostCommentErrorState(error.toString()));
    });
  }
  List<CommentModel> comments = [];

  void getPostComments(String postId) {
    FirebaseFirestore.instance
        .collection("posts")
        .doc(postId)
        .collection("comments")
        .get().then((value) {
      value.docs.forEach((element) {
        comments.add(CommentModel.fromJson(element.data()));
        emit(PostCommentSuccessState());
      });
    }).catchError((error) {
      emit(PostCommentErrorState(error.toString()));
    });

  }
  List<CommentModel> allComments = [];

  void getAllPostComments() {
    FirebaseFirestore.instance
        .collection("posts")
        .doc()
        .collection("comments")
        .get().then((value) {
      value.docs.forEach((element) {
        allComments.add(CommentModel.fromJson(element.data()));
        emit(PostCommentSuccessState());
      });
    }).catchError((error) {
      emit(PostCommentErrorState(error.toString()));
    });

  }

}
