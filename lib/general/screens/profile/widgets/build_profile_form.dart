part of 'profile_widgets_imports.dart';

class BuildProfileForm extends StatelessWidget {
  const BuildProfileForm({Key? key, required this.data,required this.model}) : super(key: key);
  final ProfileData data;
  final RegisterModel? model;
  @override
  Widget build(BuildContext context) {
    data.userNameController.text="${model?.name}";
    data.phoneController.text="${model?.phone}";
    data.bioController.text="${model?.bio}";
    return Form(
      key: data.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            CustomInputFormField(
              controller: data.userNameController,
              hint: "Username",
              validator: (v){
                if(v!.isEmpty){
                  return 'Enter Your Name';
                }
              },
              icon: Icons.drive_file_rename_outline,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInputFormField(
              controller: data.bioController,
              hint: "write a bio....",
              validator: (v){
                if(v!.isEmpty){
                  return 'write a bio....';
                }
              },
              icon: Icons.edit,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInputFormField(
              controller: data.phoneController,
              hint: "phone number",
              validator: (v){
                if(v!.isEmpty){
                  return 'Enter Your Phone Number';
                }
              },
              icon: Icons.phone,
            ),
            const SizedBox(
              height: 10,
            ),


          ],
        ),
      ),
    );
  }
}
