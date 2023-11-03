part of 'post_widgets_imports.dart';

class BuildPostImage extends StatelessWidget {
  const BuildPostImage({Key? key,required this.cubit}) : super(key: key);
  final HomeCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              image:DecorationImage(
                image: FileImage(cubit!.postImage!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              cubit?.removePostImage();
            },
            icon: CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 15,
              child: Icon(Icons.close,color: AppColors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
