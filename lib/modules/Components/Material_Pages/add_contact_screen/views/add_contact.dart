import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/Global/global.dart';
import '../model/contact_model/contact_model.dart';

class add_contact extends StatelessWidget {
  add_contact({super.key});

  XFile? image;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int initialIndex = 0;

  String firstname = "";
  String numberr = "";
  String chat = "";

  TextEditingController firstnamec = TextEditingController();
  TextEditingController numberrc = TextEditingController();
  TextEditingController chatsc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add contacts"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                Timer(
                  const Duration(seconds: 3),
                  () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Row(
                          children: [
                            Icon(Icons.person_pin),
                            Text(
                              "$firstname Added",
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    );
                  },
                );

                Contact c1 = Contact(
                  chat: chat,
                  firstname: firstname,
                  numberr: numberr,
                );

                Provider.of(context).add_contact(add_contact: c1);

                // Provider.of<ContactProvider>(context, listen: false)
                //     .AddContact(add_contact: c1);

                firstnamec.clear();
                chatsc.clear();

                numberrc.clear();

                Navigator.pushNamed(context, 'home');
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    elevation: 5,
                    title: const Text(
                      "Add info to save as a contact.",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    content: Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("ok"),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Form(
        onChanged: () {},
        key: formKey,
        child: Stepper(
          currentStep: Global.currentindex,
          onStepContinue: () {
            if (Global.currentindex != 3) {
              Global.currentindex++;
            }
          },
          onStepCancel: () {
            if (Global.currentindex != 0) {
              Global.currentindex--;
            }
          },
          steps: [
            Step(
              state: (Global.currentindex == 0)
                  ? StepState.editing
                  : StepState.indexed,
              isActive: (Global.currentindex == 0) ? true : false,
              title: Text("enter name here..."),
              content: Column(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            foregroundImage: FileImage(
                              File(
                                "${image?.path}",
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  image = await Global.picker.pickImage(
                                    source: ImageSource.camera,
                                  );
                                  Global.imagePath = image!.path;
                                },
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 35,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  image = await Global.picker.pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  Global.imagePath = image!.path;
                                },
                                icon: const Icon(
                                  Icons.panorama,
                                  size: 35,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Step(
              state: (Global.currentindex == 1)
                  ? StepState.editing
                  : StepState.indexed,
              isActive: (Global.currentindex == 1) ? true : false,
              title: Text("enter details here..."),
              content: Column(
                children: [
                  TextFormField(
                    controller: Global.firstEditingController,
                    keyboardType: TextInputType.name,
                  ),
                ],
              ),
            ),
            Step(
              state: (Global.currentindex == 2)
                  ? StepState.editing
                  : StepState.indexed,
              isActive: (Global.currentindex == 2) ? true : false,
              title: Text("enter number here..."),
              content: Column(
                children: [
                  TextFormField(
                    controller: Global.numberEditingController,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
            // Step(
            //   state: (Global.currentindex == 3)
            //       ? StepState.editing
            //       : StepState.indexed,
            //   isActive: (Global.currentindex == 3) ? true : false,
            //   title: Text("enter email here..."),
            //   content: Column(
            //     children: [
            //       TextFormField(
            //         controller: Global.emailEditingController,
            //         keyboardType: TextInputType.emailAddress,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
