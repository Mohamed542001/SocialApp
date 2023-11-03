part of 'main_imports.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getPosts()..getUserData()..getAllPostComments(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          var user = cubit.userModel;
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                BuildMainHeader(),
                ConditionalBuilder(
                  condition: cubit.posts.length > 0,
                  builder: (context) => ListView.separated(
                    separatorBuilder: (context, i) => SizedBox(
                      height: 8,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cubit.posts.length,
                    itemBuilder: (context, i) => BuildPostView(
                      posts: cubit.posts, i: i, userModel: user, cubit: cubit, state: state,
                    ),
                  ),
                  fallback: (context) => CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
