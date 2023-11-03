part of 'post_widgets_imports.dart';

class BuildPostHeader extends StatelessWidget {
  const BuildPostHeader({Key? key,required this.userModel}) : super(key: key);
  final RegisterModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              "${userModel?.image}"),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: CustomText(
            title: userModel?.name,
            size: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
