part of 'chat_details_widgets_imports.dart';

class BuildSendMessage extends StatelessWidget {
  const BuildSendMessage({Key? key, required this.message}) : super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(10),
            bottomEnd: Radius.circular(10),
          ),
          color: AppColors.grey,
        ),
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: CustomText(
          title: message.text,
          color: AppColors.black,
        ),
      ),
    );
  }
}
