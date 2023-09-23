import 'package:get/get.dart';
import 'package:goapp/screens/add_task.dart';
import 'package:goapp/screens/all_tasks.dart';
import 'package:goapp/screens/edit_task.dart';
import 'package:goapp/screens/home_screen.dart';
import 'package:goapp/screens/view_task.dart';

class RoutesClass {
  static const String home = "/";

  static const String allTasks = '/allTasks';

  static const String addTask = '/addTask';

  static const String editTask = '/editTask';

  static const String viewTask = '/viewTask';

  static String getHomeRoute() => home;

  static String getAllTaskRoute() => allTasks;

  static String getAddTaskRoute() => addTask;

  static String getEditTaskRoute(int id) => '$editTask?id=$id';

  static String getViewTaskRoute(int id) => '$viewTask?id=$id';
  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(
        name: allTasks,
        page: () => const AllTasks(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: addTask,
        page: () => AddTask(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: editTask,
        page: () {
          var id = Get.parameters['id'];
          return EditTask(id: int.parse(id!));
        },
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: viewTask,
        page: () {
          var id = Get.parameters['id'];
          return ViewTask(id: int.parse(id!));
        },
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 500)) ,
  ];
}
