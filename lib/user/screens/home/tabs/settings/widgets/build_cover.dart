part of 'settings_widgets_imports.dart';

class BuildCover extends StatelessWidget {
  const BuildCover({Key? key, required this.model}) : super(key: key);
  final RegisterModel? model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          "${model?.cover??"https://tokystorage.s3.amazonaws.com/images/default-cover.png"}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 59,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage("${model?.image??"https://i.stack.imgur.com/l60Hf.png"}",),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          title: model?.name,
          size: 18,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          title: model?.bio,
          size: 14,
          color: AppColors.grey,
        ),

      ],
    );
  }
}
