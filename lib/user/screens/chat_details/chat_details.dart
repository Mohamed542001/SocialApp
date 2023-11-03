part of 'chat_details_imports.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({Key? key, required this.model}) : super(key: key);
  final RegisterModel model;
  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {

  ChatDetailsData data = ChatDetailsData();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MessageCubit()..getMessages(receiverId: "${widget.model.uId}"),
      child: BlocConsumer<MessageCubit,MessageState>(
        listener: (context,state){},
        builder: (context,state) {
          var cubit = MessageCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 25,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("${widget.model.image}"),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CustomText(
                    title: widget.model.name,
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:[
                  Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: cubit.messages.length,
                      separatorBuilder: (context,i)=>SizedBox(height: 15,),
                      itemBuilder: (context,i){
                        var message = cubit.messages[i];
                        if(ApiNames.uId==message.senderId){
                          return BuildSendMessage(message: message,);
                        }else{
                          return BuildReceiveMessage(message: message,);
                        }
                      },
                    ),
                  ),
                  BuildChatDetailsInput(data: data, cubit: cubit, model: widget.model,),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
