part of 'profile_widgets_imports.dart';

class EditCover extends StatelessWidget {
  const EditCover({Key? key, required this.model, required this.profileImage,required this.cubit,}) : super(key: key);
  final RegisterModel? model;
  final File? profileImage;
  final HomeCubit? cubit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    image: cubit?.coverImage==null?DecorationImage(
                      image: NetworkImage("${model?.cover ?? "https://img.freepik.com/free-photo/white-painted-wall-texture-background_53876-138197.jpg?w=996&t=st=1698072052~exp=1698072652~hmac=bc3c21a95987ddde39907cf9d732135f0442afa36c8ad9dcfa9890321afa593c"}"),
                      fit: BoxFit.cover,
                    ):DecorationImage(
                      image: FileImage(cubit!.coverImage!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cubit?.getCoverImage();
                  },
                  icon: CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 20,
                    child: Icon(Icons.camera_alt_outlined,color: AppColors.white,),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 59,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: profileImage !=null ?CircleAvatar(
                  radius: 55,
                  backgroundImage: FileImage(profileImage!),
                ):CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage("${model?.image??"https://img.freepik.com/free-photo/man-listening-music-by-wireless-earphones_53876-98050.jpg?w=996&t=st=1698067585~exp=1698068185~hmac=e5811e1525fd2cd5908a42077858f7c30cb42e24d2171608f343b9f271e2517f"}"),
                ),
              ),
              IconButton(
                onPressed: (){
                  cubit?.getProfileImage();
                },
                icon: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 20,
                  child: Icon(Icons.camera_alt_outlined,color: AppColors.white,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
