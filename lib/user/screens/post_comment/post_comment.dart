part of 'post_comment_imports.dart';

class PostComment extends StatefulWidget {
  const PostComment({Key? key, required this.index, required this.postId}) : super(key: key);
  final int index;
  final String postId;
  @override
  State<PostComment> createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {

  PostCommentData data = PostCommentData();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData()..getPosts()..getPostComments(widget.postId),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: PostCommentView(cubit: cubit,),),
                    PostCommentInput(data: data,cubit: cubit,i: widget.index),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
