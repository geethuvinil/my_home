import 'package:flutter/material.dart';

class AddMoreFamilyScreen extends StatefulWidget {
  const AddMoreFamilyScreen({super.key});

  @override
  State<AddMoreFamilyScreen> createState() => _AddMoreFamilyScreenState();
}

class _AddMoreFamilyScreenState extends State<AddMoreFamilyScreen> {
  TextEditingController familyNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Enter the details of the family members to add another family.",
                    style: TextStyle(fontSize: 16),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        addFamilyDetails();
                      },
                      child: Text("Add Family")),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }

  addFamilyDetails() async {
    familyNameController.clear();
     nameController.clear();
     ageController.clear();
     dobController.clear();
     sexController.clear();
     phoneNumberController.clear();
     relationController.clear();
     occupationController.clear();
     imageController.clear();
    await showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, setState) => SafeArea(
                child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                        child: Text(
                      "Add family details",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )),
                    Divider(),
                    detailTextField(
                        hintTextField: "Family name",
                        typeofText: TextInputType.multiline,
                        controllerName: familyNameController),
                    detailTextField(
                        hintTextField: "Name of the member",
                        typeofText: TextInputType.name,
                        controllerName: nameController),
                    detailTextField(
                        hintTextField: "Age of the member",
                        typeofText: TextInputType.number,
                        controllerName: ageController),
                    detailTextField(
                        hintTextField: "Mobile number of the member",
                        typeofText: TextInputType.number,
                        controllerName:phoneNumberController ),
                    detailTextField(
                        hintTextField: "Date Of Birth of the member",
                        typeofText: TextInputType.datetime,
                        controllerName: dobController),
                    detailTextField(
                        hintTextField: "Sex of the member",
                        typeofText: TextInputType.text,
                        controllerName: sexController),
                    detailTextField(
                        hintTextField: "Relation with the member",
                        typeofText: TextInputType.name,
                        controllerName: relationController),
                    detailTextField(
                        hintTextField: "Occupation of the member",
                        typeofText: TextInputType.multiline,
                        controllerName: occupationController),
                    //// needc to add image of member

                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 90, right: 90),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Submit")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 90, right: 90, bottom: 30),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Cancel")),
                    )
                  ],
                ),
              ),
            )),
          ),
        );
      },
    );
  }

  detailTextField(
      {String? hintTextField,
      TextInputType? typeofText,
      TextEditingController? controllerName}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controllerName,
        decoration: InputDecoration(hintText: hintTextField ?? ""),
        keyboardType: typeofText,
      ),
    );
  }
}
