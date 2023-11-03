part of 'post_comment_widgets_imports.dart';

class PostCommentInput extends StatelessWidget {
  const PostCommentInput(
      {Key? key, required this.data, required this.cubit, required this.i})
      : super(key: key);
  final PostCommentData data;
  final HomeCubit? cubit;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomInputFormField(
            controller: data.commentController,
            hint: "write a comment",
            validator: (v) {
              if (v!.isEmpty) {
                return 'Enter Your Name';
              }
            },
          ),
        ),
        IconButton(
            onPressed: () {
              cubit?.postComment(
                cubit!.postsId[i],
                data.commentController.text,
              );
            },
            icon: Icon(
              Icons.send,
              color: AppColors.primary,
            ))
      ],
    );
  }
}
