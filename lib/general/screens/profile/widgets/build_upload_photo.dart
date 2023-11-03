part of 'profile_widgets_imports.dart';

class BuildUploadPhoto extends StatelessWidget {
  const BuildUploadPhoto({Key? key, required this.cubit, required this.data, required this.state}) : super(key: key);
  final HomeCubit? cubit;
  final HomeState? state;
  final ProfileData data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (cubit?.profileImage != null)
          Expanded(
            child: Column(
              children: [
                DefaultButton(
                  onTap: () {
                    cubit?.uploadProfileImage(
                      name: data.userNameController.text,
                      phone: data.phoneController.text,
                      bio: data.bioController.text, context: context,
                    );
                  },
                  margin: const EdgeInsets.all(0),
                  title: 'Upload Profile',
                  textColor: AppColors.white,
                  width: double.infinity,
                ),

              ],
            ),
          ),
        SizedBox(
          width: 10,
        ),
        if (cubit?.coverImage != null)
          Expanded(
            child: Column(
              children: [
                DefaultButton(
                  onTap: () {
                    cubit?.uploadCoverImage(
                      name: data.userNameController.text,
                      phone: data.phoneController.text,
                      bio: data.bioController.text, context: context,
                    );
                  },
                  margin: const EdgeInsets.all(0),
                  title: 'Upload Cover',
                  textColor: AppColors.white,
                  width: double.infinity,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
