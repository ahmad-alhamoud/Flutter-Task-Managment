import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goapp/controllers/data_controller.dart';
import 'package:goapp/utils/app_colors.dart';
import 'package:goapp/widgets/textfield_widget.dart';

class ViewTask extends StatelessWidget {
  final int id;

  ViewTask({Key? key, required this.id}) : super(key: key);

  _loadSingleTask() async {
    await Get.find<DataController>().getSingleData(id.toString());
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _loadSingleTask() ;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<DataController>(
        builder: (controller) {
         nameController.text = controller.singleData['task_name'] ?? '';
         detailController.text = controller.singleData['task_detail'] ?? '';
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 60),
                alignment: Alignment.topLeft,
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height / 3.2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/header1.jpg'),
                      fit: BoxFit.cover,
                    )),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ) ,
                    TextFieldWidget(
                      readOnly: true,
                      textController: nameController,
                      hintText: 'Task name',
                    ) ,
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      readOnly: true,
                      textController: detailController,
                      hintText: 'Task detail',
                      borderRadius: 15,
                      maxLines: 3,
                    ) ,
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.8,
                    ) ,
                  ],

                ),
              )
            ],
          ) ;
        }
      ),
    );
  }
}
