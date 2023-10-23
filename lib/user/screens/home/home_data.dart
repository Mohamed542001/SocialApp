part of 'home_imports.dart';

class HomeData{

  bool isEmailVerified = false;

  Future sendVerificationEmail() async{
    try{
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
    } catch(e){
      CustomToast.showSimpleToast(msg: e.toString());
      print(e.toString());
    }

  }
  late TabController tabController;
  List<Widget> screens= const [
    Main(),
    Chats(),
    Posts(),
    Users(),
    Settings(),
  ];

  List<String> titles= const [
    "Home",
    "Chats",
    "Posts",
    "Users",
    "Settings",
  ];

  var items= [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: 'Chats',
      icon: Icon(Icons.chat),
    ),
    BottomNavigationBarItem(
      label: 'Posts',
      icon: Icon(Icons.account_balance),
    ),
    BottomNavigationBarItem(
      label: 'Users',
      icon: Icon(Icons.location_on),
    ),
    BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(Icons.settings),
    ),
  ];
}