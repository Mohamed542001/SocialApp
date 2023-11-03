part of 'chats_imports.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>HomeCubit()..getUsers(),
        child: BlocConsumer<HomeCubit,HomeState>(
          listener: (context,state){},
          builder: (context,state){
            var cubit = HomeCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: BuildChatItem(cubit: cubit,),
            );
          },
        ),
      );
  }
}
