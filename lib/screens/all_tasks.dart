import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:goapp/controllers/data_controller.dart';
import 'package:goapp/routes/routes.dart';
import 'package:goapp/screens/view_task.dart';
import 'package:goapp/widgets/button_widget.dart';
import 'package:goapp/widgets/task_widget.dart';

import '../utils/app_colors.dart';
import 'edit_task.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  _loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
    final rightEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.red,
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
    _loadData();
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<DataController>(
        builder: (controller) {
          return controller.isLoading == false
              ? Column(
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
                      child: Row(
                        children: [
                          Icon(
                            Icons.home,
                            color: AppColors.secondaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                color: Colors.black),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Icon(
                            Icons.calendar_month_sharp,
                            color: AppColors.secondaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            controller.myData.length.toString(),
                            style: TextStyle(
                                fontSize: 20, color: AppColors.secondaryColor),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: controller.myData.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: ObjectKey(index),
                            background: leftEditIcon,
                            secondaryBackground: rightEditIcon,
                            onDismissed: (DismissDirection direction) {},
                            confirmDismiss: (DismissDirection direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (_) {
                                      return Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF2e3253)
                                                .withOpacity(0.4),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                int taskId = int.parse(
                                                    controller.myData[index]
                                                            ["id"]
                                                        .toString());
                                                Get.offNamed(RoutesClass
                                                    .getViewTaskRoute(taskId));
                                              },
                                              child: ButtonWidget(
                                                  backgroundColor:
                                                      AppColors.mainColor,
                                                  text: 'View',
                                                  textColor: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                int taskId = int.parse(
                                                    controller.myData[index]
                                                            ["id"]
                                                        .toString());
                                                Get.offNamed(RoutesClass
                                                    .getEditTaskRoute(taskId));
                                              },
                                              child: ButtonWidget(
                                                  backgroundColor:
                                                      AppColors.mainColor,
                                                  text: 'Edit',
                                                  textColor: Colors.white),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                return false;
                              } else {
                                String id = controller.myData[index]["id"];
                                await controller.deleteData(id);
                                return Future.delayed(
                                    const Duration(seconds: 1), () async {
                                  await controller.getData();
                                  return direction ==
                                      DismissDirection.endToStart;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              child: TaskWidget(
                                text: controller.myData[index]['task_name'],
                                color: Colors.blueGrey,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              : SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Center(
                    child: SpinKitThreeInOut(
                      itemBuilder: (BuildContext context, index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: index.isEven ? Colors.red : Colors.green,
                          ),
                        );
                      },
                    ),
                  ),
                );
        },
      ),
    );
  }
}
