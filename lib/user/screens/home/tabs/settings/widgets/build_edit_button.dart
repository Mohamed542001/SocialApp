part of 'settings_widgets_imports.dart';

class BuildEditButton extends StatelessWidget {
  const BuildEditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultButton(
            onTap: () {},
            margin: const EdgeInsets.all(0),
            title: 'Add Photo',
            color: AppColors.white,
            textColor: AppColors.primary,
            borderColor: AppColors.grey,
            textSize: 16,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        DefaultButton(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const Profile(),
            ),
          ),
          margin: const EdgeInsets.all(0),
          child: Icon(
            Icons.edit,
            color: AppColors.primary,
            size: 16,
          ),
          color: AppColors.white,
          borderColor: AppColors.grey,
          textSize: 16,
        ),
      ],
    );
  }
}
