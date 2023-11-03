part of 'chat_widgets_imports.dart';

class BuildChatItem extends StatelessWidget {
  const BuildChatItem({Key? key, required this.cubit}) : super(key: key);
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: cubit.users.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, i) => Divider(thickness: 1),
        itemCount: cubit.users.length,
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ChatDetails(
                  model: cubit.users[i],
                ),
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage("${cubit.users[i].image}"),
              ),
              SizedBox(
                width: 15,
              ),
              CustomText(
                title: "${cubit.users[i].name}",
                size: 14,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
      fallback: (context) => CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }
}
