part of 'main_widgets_imports.dart';

class BuildPostView extends StatelessWidget {
  const BuildPostView(
      {Key? key,
      required this.posts,
      required this.i,
      required this.userModel,
      required this.cubit,
      required this.state})
      : super(key: key);
  final List<PostModel> posts;
  final int i;
  final RegisterModel? userModel;
  final HomeCubit cubit;
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("${posts[i].image}"),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            title: posts[i].name,
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 17,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        title: posts[i].dateTime,
                        size: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                ),
              ],
            ),
            Divider(thickness: 1),
            CustomText(
              title: posts[i].text,
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   width: double.infinity,
            //   child: Wrap(
            //     children: [
            //       InkWell(
            //         onTap: () {},
            //         child: CustomText(
            //           title: "#Software_Development",
            //           color: Colors.blue,
            //           size: 15,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            if (posts[i].postImage != "")
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: NetworkImage("${posts[i].postImage}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 16,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomText(
                            title: "${cubit.likes[i]}",
                            size: 14,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.chat,
                            size: 16,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomText(
                            title: "${cubit.allComments.length} comments",
                            size: 14,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage("${userModel?.image}"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PostComment(index: i, postId: cubit.postsId[i],),
                            ),
                          );
                        },
                        child: CustomText(
                          title: "write a comment ...",
                          size: 14,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    cubit.likePost("${cubit.postsId[i]}");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 16,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        title: "Like",
                        size: 14,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.ios_share_outlined,
                        size: 16,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        title: "share",
                        size: 14,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
