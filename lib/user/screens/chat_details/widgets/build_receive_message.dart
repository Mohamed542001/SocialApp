part of 'chat_details_widgets_imports.dart';

class BuildReceiveMessage extends StatelessWidget {
  const BuildReceiveMessage({Key? key, required this.message}) : super(key: key);
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(10),
            bottomStart: Radius.circular(10),
          ),
          color: AppColors.greyWhite,
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
