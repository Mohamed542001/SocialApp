part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeData data = HomeData();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
        if (state is HomeAddPostState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const Posts(),
            ),
          );
        }
      }, builder: (context, state) {
        data.isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
        print("isEmailVerified ${data.isEmailVerified}");
        var cubit = HomeCubit.get(context);
        if (data.isEmailVerified) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
            ),
            body: BuildNotVerificationView(data: data),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: CustomText(
                title: '${data.titles[cubit.currentIndex]}',
                size: 20,
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              backgroundColor: Colors.white,
              selectedIconTheme:
                  IconThemeData(color: AppColors.primary, size: 24),
              unselectedIconTheme:
                  IconThemeData(color: AppColors.formBgColor, size: 24),
              selectedItemColor: AppColors.primary,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                cubit.changeBottom(index);
              },
              items: data.items,
            ),
            body: data.screens[cubit.currentIndex],
          );
        }
      }),
    );
  }
}
