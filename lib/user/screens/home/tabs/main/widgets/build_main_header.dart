part of 'main_widgets_imports.dart';

class BuildMainHeader extends StatelessWidget {
  const BuildMainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Image(
            // image: NetworkImage(
            //     "https://as2.ftcdn.net/v2/jpg/03/52/23/81/1000_F_352238153_PqHI93efMHBXIZOe4uFJMxN7T7BNKZAa.jpg"),
            image: AssetImage(Res.header),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          CustomText(
            title: "Communicate with friends",
            color: AppColors.black,
            size: 18,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
