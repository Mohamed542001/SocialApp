part of 'main_widgets_imports.dart';

class BuildPostView extends StatelessWidget {
  const BuildPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://as1.ftcdn.net/v2/jpg/03/55/90/62/1000_F_355906263_qzyQNyimlPVXcscyTRAvkC7s9ZTz6BOm.jpg"),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            title: "Mohamed Salama",
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 17,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        title: "January 21, 2023 at 10:39 PM",
                        size: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                ),
              ],
            ),
            Divider(thickness: 1),
            CustomText(
              title:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: Wrap(
                children: [
                  InkWell(
                    onTap: () {},
                    child: CustomText(
                      title: "#Software_Development",
                      color: Colors.blue,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://img.freepik.com/premium-photo/world-animal-day-world-wildlife-day-groups-wild-beasts-were-gathered-hands-people_34998-712.jpg?w=1060"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 16,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomText(
                            title: "1200",
                            size: 14,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          Icon(
                            Icons.chat,
                            size: 16,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomText(
                            title: "521 comments",
                            size: 14,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1,),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            "https://as1.ftcdn.net/v2/jpg/03/55/90/62/1000_F_355906263_qzyQNyimlPVXcscyTRAvkC7s9ZTz6BOm.jpg"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      CustomText(
                        title: "write a comment ...",
                        size: 14,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 16,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        title: "Like",
                        size: 14,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(
                        Icons.ios_share_outlined,
                        size: 16,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        title: "share",
                        size: 14,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
