import 'package:flutter/material.dart';
import 'package:goapp/routes/routes.dart';
import 'package:goapp/screens/add_task.dart';
import 'package:goapp/screens/all_tasks.dart';
import 'package:goapp/widgets/button_widget.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20 , right: 20),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/welcome.jpg',
          ),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Hello',
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
                children: [
                  TextSpan(
                    text: '\n Start your beautiful day',
                    style: TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 14),
                  ),
                ],
              ),
            ) ,
             SizedBox(
              height: MediaQuery.of(context).size.height /1.8 ,
            ) ,
            InkWell(
              onTap: (){
               Get.toNamed(RoutesClass.getAddTaskRoute()) ;
              },
              child: ButtonWidget(
                  backgroundColor: AppColors.mainColor,
                  text: 'Add Task',
                  textColor: Colors.white
              ),
            ) ,
            const SizedBox(
              height: 20,
            ) ,
            InkWell(
              onTap: (){
                Get.toNamed(RoutesClass.getAllTaskRoute());
              },
              child: ButtonWidget(
                  backgroundColor: Colors.white ,
                  text: 'View All',
                  textColor: AppColors.smallTextColor ,
              ),
            ) ,
          ],
        ),
      ),
    );
  }
}
