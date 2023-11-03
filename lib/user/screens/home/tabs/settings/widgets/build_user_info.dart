part of 'settings_widgets_imports.dart';

class BuildUserInfo extends StatelessWidget {
  const BuildUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap:(){},
              child: Column(
                children: [
                  CustomText(
                    title: "100",
                    size: 14,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    title: "Posts",
                    size: 16,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap:(){},
              child: Column(
                children: [
                  CustomText(
                    title: "100",
                    size: 14,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    title: "Photos",
                    size: 16,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap:(){},
              child: Column(
                children: [
                  CustomText(
                    title: "100",
                    size: 14,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    title: "Followers",
                    size: 16,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap:(){},
              child: Column(
                children: [
                  CustomText(
                    title: "100",
                    size: 14,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    title: "Followings",
                    size: 16,
                    color: AppColors.grey,

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
