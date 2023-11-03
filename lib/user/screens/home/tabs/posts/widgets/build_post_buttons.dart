part of 'post_widgets_imports.dart';

class BuildPostButtons extends StatelessWidget {
  const BuildPostButtons({Key? key,required this.cubit, required this.data}) : super(key: key);
  final HomeCubit? cubit;
  final PostsData data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_enhance_rounded,color: AppColors.primary,),
              TextButton(
                onPressed: () =>cubit?.getPostImage(),
                child: CustomText(
                  title: "add Photo",
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        // Expanded(
        //   child: TextButton(
        //     onPressed: () {
        //
        //     },
        //     child: CustomText(
        //       title: "# tags",
        //       color: AppColors.primary,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
