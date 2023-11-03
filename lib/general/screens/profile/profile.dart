part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileData data = ProfileData();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = HomeCubit.get(context).userModel;
          var profileImage = HomeCubit.get(context).profileImage;
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: DefaultAppBar(
              title: "Edit Profile",
              action: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: TextButton(
                    onPressed: () {
                      print("Edit $profileImage");
                      cubit.updateUser(
                        name: data.userNameController.text,
                        phone: data.phoneController.text,
                        bio: data.bioController.text, context: context,
                      );
                    },
                    child: CustomText(
                      title: "Update",
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (state is UserUploadLoadingState)
                      Column(
                        children: [
                          LinearProgressIndicator(color: AppColors.primary,backgroundColor:AppColors.greyWhite,),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    EditCover(
                      model: model,
                      profileImage: profileImage,
                      cubit: cubit,
                    ),
                    if (cubit.profileImage != null || cubit.coverImage != null)
                      BuildUploadPhoto(
                        cubit: cubit,
                        data: data, state: state,
                      ),
                    BuildProfileForm(
                      data: data,
                      model: model,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
