part of 'chat_details_widgets_imports.dart';

class BuildChatDetailsInput extends StatelessWidget {
  const BuildChatDetailsInput(
      {Key? key, required this.data, required this.cubit, required this.model})
      : super(key: key);
  final ChatDetailsData data;
  final MessageCubit cubit;
  final RegisterModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomInputFormField(
            controller: data.chatController,
            hint: "type your message here..",
            validator: (v) {
              if (v!.isEmpty) {
                return 'Enter your message';
              }
            },
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.primary,
          ),
          child: IconButton(
              onPressed: () {
                if(data.chatController.text!=""){
                  cubit.sendMessage(
                    receiverId: "${model.uId}",
                    dateTime: DateTime.now().toString(),
                    text: data.chatController.text,
                  );
                }
                data.chatController.clear();
              },
              icon: Icon(
                Icons.send,
                color: AppColors.white,
              )),
        )
      ],
    );
  }
}
