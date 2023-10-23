part of 'home_widgets_imports.dart';

class BuildNotVerificationView extends StatelessWidget {
  const BuildNotVerificationView({Key? key,required this.data}) : super(key: key);
  final HomeData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary.withOpacity(0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.info_outline),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: CustomText(
              color: AppColors.textColor,
              title: 'Please verification your email',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          DefaultButton(
            onTap: () {
              data.sendVerificationEmail();
            },
            margin: const EdgeInsets.all(0),
            color: AppColors.secondary,
            borderColor: AppColors.secondary,
            title: 'Send',
            textSize: 14,
            textColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
