part of 'posts_imports.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  PostsData data = PostsData();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var now = DateTime.now();
            var model = HomeCubit.get(context).userModel;
            var cubit = HomeCubit.get(context);
            return Scaffold(
              appBar: DefaultAppBar(
                title: 'Add Post',
                action: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: TextButton(
                      onPressed: () {
                        if (cubit.postImage == null) {
                          cubit.createPost(
                              text: data.textController.text,
                              dateTime: now.toString(),
                              context: context);
                        } else {
                          cubit.uploadPostImage(
                              text: data.textController.text,
                              dateTime: now.toString(),
                              context: context);
                        }
                      },
                      child: CustomText(
                        title: "POST",
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (state is CreatePostLoadingState)
                      LinearProgressIndicator(
                        backgroundColor: AppColors.greyWhite,
                        color: AppColors.primary,
                      ),
                    BuildPostHeader(
                      userModel: model,
                    ),
                    Expanded(
                      child: BuildPostInput(
                        data: data,
                      ),
                    ),
                    if (cubit.postImage != null)
                      BuildPostImage(
                        cubit: cubit,
                      ),
                    BuildPostButtons(
                      cubit: cubit,
                      data: data,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
