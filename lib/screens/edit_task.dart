import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goapp/controllers/data_controller.dart';
import 'package:goapp/routes/routes.dart';
import 'package:goapp/screens/all_tasks.dart';
import 'package:goapp/widgets/error_warning_ms.dart';
import 'package:goapp/widgets/textfield_widget.dart';

import '../utils/app_colors.dart';
import '../widgets/button_widget.dart';

class EditTask extends StatelessWidget {
  final int id ;
  EditTask({Key? key , required this.id}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController detailController = TextEditingController();
 _loadSingleTask() async {
   await Get.find<DataController>().getSingleData(id.toString());
 }
  @override
  Widget build(BuildContext context) {
   _loadSingleTask() ;
    bool _dataValidation(){
      if(nameController.text.trim() == '') {
        Message.taskErrorWarning(
            'Task name',
            'Your task name is empty'
        ) ;
        return false ;
      }
      else if (detailController.text.trim() == ''){
        Message.taskErrorWarning(
            'Task detail',
            ' your task detail is empty'
        ) ;
        return false ;
      }
      else if(nameController.text.length < 10  ) {
        Message.taskErrorWarning(
            "Task name",
            'Your task name should be at lest 10 characters') ;
        return false ;
      }
      else if(detailController.text.length < 20  ) {
        Message.taskErrorWarning(
            "Task detail",
            'Your task detail should be at lest 20 Characters') ;
        return false ;
      }

      return true ;
    }
    return Scaffold(
      body: GetBuilder<DataController>(
        builder:(controller) {
          nameController.text  = controller.singleData['task_name'] ?? "task name not found";
          detailController.text = controller.singleData['task_detail'] ?? "" ;
          return Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/addtask1.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back() ;
                      },
                      padding: EdgeInsets.zero,
                      constraints: const  BoxConstraints(),
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.smallTextColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextFieldWidget(
                        textController: nameController,
                        hintText: 'Task name',
                        borderRadius: 30),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        maxLines: 3,
                        textController: detailController,
                        hintText: 'Task detail',
                        borderRadius: 10),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        if(_dataValidation()){
                          Get.find<DataController>().updateData(nameController.text.trim(), detailController.text.trim() ,
                          controller.singleData["id"]
                          ) ;
                          Get.offNamed(RoutesClass.allTasks) ;
                        }
                      },
                      child: ButtonWidget(
                        backgroundColor: AppColors.mainColor,
                        text: 'Add',
                        textColor: Colors.white,
                      ),
                    ) ,
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ) ,
              ],
            ),
          ) ;
        }
      ),
    );
  }
}
