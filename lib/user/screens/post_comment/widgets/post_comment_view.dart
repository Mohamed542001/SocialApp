part of 'post_comment_widgets_imports.dart';

class PostCommentView extends StatelessWidget {
  const PostCommentView({Key? key, required this.cubit}) : super(key: key);
  final HomeCubit? cubit;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: cubit?.comments.length,
      itemBuilder: (context,i)=>Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage("${cubit?.userModel?.image}"),
            ),
            SizedBox(
              width: 10,
            ),
            CustomText(
              title: "${cubit?.comments[i].comment}",
            ),
          ],
        ),
      ),
    );
  }
}
