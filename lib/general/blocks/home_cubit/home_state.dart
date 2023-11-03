part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState{}
class HomeSuccessState extends HomeState{}
class HomeErrorState extends HomeState{
  final String error;

  HomeErrorState(this.error);

}


class GetPostsLoadingState extends HomeState{}
class GetPostsSuccessState extends HomeState{}
class GetLikesSuccessState extends HomeState{}
class GetPostsErrorState extends HomeState{
  final String error;

  GetPostsErrorState(this.error);

}

class LikePostSuccessState extends HomeState{}
class LikePostErrorState extends HomeState{
  final String error;

  LikePostErrorState(this.error);

}

class PostCommentSuccessState extends HomeState{}
class PostCommentErrorState extends HomeState{
  final String error;

  PostCommentErrorState(this.error);

}


class GetUserSuccessState extends HomeState{}
class GetUserErrorState extends HomeState{
  final String error;

  GetUserErrorState(this.error);

}

class GetAllUsersLoadingState extends HomeState{}
class GetAllUsersSuccessState extends HomeState{}
class GetAllUsersErrorState extends HomeState{
  final String error;

  GetAllUsersErrorState(this.error);

}

class ProfileImageSuccessState extends HomeState{}
class ProfileImageErrorState extends HomeState{}

class PostImageSuccessState extends HomeState{}
class PostImageErrorState extends HomeState{}

class RemovePostImageSuccessState extends HomeState{}

class CoverImageSuccessState extends HomeState{}
class CoverImageErrorState extends HomeState{}

class UploadProfileImageSuccessState extends HomeState{}
class UploadProfileImageErrorState extends HomeState{}

class UploadCoverImageSuccessState extends HomeState{}
class UploadCoverImageErrorState extends HomeState{}

class UserUploadLoadingState extends HomeState{}
class UserUploadErrorState extends HomeState{}

class CreatePostLoadingState extends HomeState{}
class CreatePostSuccessState extends HomeState{}
class CreatePostErrorState extends HomeState{}

class HomeChangeBottomNavState extends HomeState{}
class HomeAddPostState extends HomeState{}

