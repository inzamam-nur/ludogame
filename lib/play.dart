import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ludo/gameover.dart';
import 'controller/play_controller.dart';
import 'home.dart';

class PlayGame extends GetView<PlayController> {
  const PlayGame({Key? key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(() => SafeArea(
        child: ListView(
            children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (controller.topList.length <= 3)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...controller.topList
                    .map(
                      (item) => Container(
                        padding: const EdgeInsets.all(4),
                        child: Image.asset(
                    controller.diceList[item],
                          width: 100,
                          height: 100,
                  ),
                      ),
                )
                    .toList(),
              ],
            )
          else
            Row(
              children: controller.topList
                  .sublist(controller.topList.length - 3)
                  .map(
                    (item) => Container(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                  controller.diceList[item],
                  width: 100,
                  height: 100,
                ),
                    ),
              )
                  .toList(),
            ),

        ],
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text("${controller.topList.length}"),
    Container(
    height: 50,
    margin: const EdgeInsets.only(bottom: 30),
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.indigo,
    ),
    onPressed: () {
    showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
    title: const Text("Rules"),
    content: const Text(
    "- 50 is the winning point \n- If the dice sum is 7 then game over \n-If two dices are same you will get a Luck"),
    actions: <Widget>[
    TextButton(
    onPressed: () {
    Navigator.of(ctx).pop();
    },
    child: Container(
    color: Colors.green,
    padding: const EdgeInsets.all(14),
    child: const Text("okay"),
    ),
    ),
    ],
    ),
    );
    },
    child: const Text(
    'Rules Of The Game',
    style: TextStyle(fontSize: 20, color: Colors.white),
    ),
    ),
    ),
    Container(
    height: 250,
    width: 245,
    decoration: BoxDecoration(
    color: const Color(0xFFE3F9FC),
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
    BoxShadow(
    color: Color(0xFFC7C7C7),
    spreadRadius: -1,
    blurRadius: 5)
    ]),
    child: Column(
    children: [
    Container(
    height: 100,
    margin: const EdgeInsets.all(16),
    decoration: BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.circular(10)),
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    const Text(
    "Total Score",
    style: TextStyle(
    fontSize: 20, color: Colors.white),
    ),
    Text(
    '${controller.totalPont.value}',
    style: const TextStyle(
    fontSize: 20, color: Colors.white),
    )
    ],
    ),
    ),
    Container(
    margin:
    const EdgeInsets.only(left: 16, bottom: 16, right: 16),
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Column(
    children: [
    Container(
    height: 100,
    width: 100,
    alignment: Alignment.center,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.circular(10)),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    const Text(
    "Result",
    style: TextStyle(
    fontSize: 20, color: Colors.white),
    ),
    Text(
    "${controller.point.value}",
    style: const TextStyle(
    fontSize: 20, color: Colors.white),
    ),
    ],
    ),
    ),
    ],
    ),
    Container(
    height: 100,
    width: 100,
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: 5),
    decoration: BoxDecoration(
    color: Colors.amber,
    borderRadius: BorderRadius.circular(10)),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    const Text(
    "Luck",
    style:
    TextStyle(fontSize: 20, color: Colors.white),
    ),
    Text(
    '${controller.luck.value}',
    style: const TextStyle(
    fontSize: 20, color: Colors.white),
    ),
    ],
    ),
    )
    ],
    ),
    )
    ],
    ),
    ),
    Container(
    margin: const EdgeInsets.only(top: 10),
    height: 80,
    width: 250,
    alignment: Alignment.center,
    decoration: BoxDecoration(
    color: Colors.blue, borderRadius: BorderRadius.circular(10)),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    const Text(
    "Previous Result",
    style: TextStyle(fontSize: 20, color: Colors.white),
    ),
    Text(
    '${controller.prePoint.value}',
    style: const TextStyle(fontSize: 20, color: Colors.white),
    ),
    ],
    ),
    ),
    Container(
    margin: const EdgeInsets.only(
    top: 20,
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset(
    controller.diceList[controller.index1.value],
    width: 100,
    height: 100,
    ),
    const SizedBox(
    width: 5,
    ),
    Image.asset(
    controller.diceList[controller.index2.value],
    width: 100,
    height: 100,
    ),
    ],
    ),
    Container(
    margin: const EdgeInsets.only(top: 30),
    alignment: Alignment.center,
    child: SizedBox(
    height: 50,
    width: 230,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor:
    Colors.indigo, // background (button) color
    ),
    onPressed: () {
    controller.index1.value = Random().nextInt(6);
    controller.index2.value = Random().nextInt(6);
    controller.topList.add(controller.index1.value);
    controller.topList.add(controller.index2.value);
    controller.allArrayList.add(controller.index1.value);
    controller.allArrayList.add(controller.index2.value);
    controller.prePoint.value = controller.point.value;
    controller.point.value =
    controller.index1.value + controller.index2.value + 2;
    controller.totalPont.value =
    controller.totalPont.value + controller.point.value;
    if (controller.index1.value == controller.index2.value) {
    controller.luck.value = controller.luck.value + 1;
    }
    if (controller.point.value == 7) {
    Navigator.push(
    context,
    MaterialPageRoute(

    builder: (context) => const GameOver()));
    controller.topList.clear();
    controller.index1.value = 0;
    controller.index2.value = 0;
    controller.point.value = 0;
    controller.luck.value = 0;
    controller.totalPont.value = 0;
    controller.prePoint.value=0;
    controller.topList.clear();

    }
    if (controller.totalPont.value >= 50) {
    showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
    alignment: Alignment.center,
    title: const Text(
    "Congratulations ! Win !!",
    style: TextStyle(
    fontSize: 20, color: Colors.red),
    ),
    content: const Text("You have Won The Game"),
    actions: <Widget>[
    TextButton(
    onPressed: () {
    Navigator.of(ctx).pop();
    },
    child: Container(
    color: Colors.amber,
    padding: const EdgeInsets.only(
    top: 10,
    bottom: 10,
    left: 15,
    right: 15),
    child: const Text("Play Again"),
    ),
    ),
    TextButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    const HomePage()),
    );
    },
    child: Container(
    color: Colors.amber,
    padding: const EdgeInsets.only(
    top: 10,
    bottom: 10,
    left: 15,
    right: 15),
    child: const Text("Cancel"),
    ),
    ),
    ],
    ),
    );

    controller.index1.value = 0;
    controller.index2.value = 0;
    controller.point.value = 0;
    controller.luck.value = 0;
    controller.totalPont.value = 0;
    controller.prePoint.value=0;
    controller.topList.clear();

    }
    },
    child: const Text(
    'Roll Dice',
    style: TextStyle(fontSize: 20, color: Colors.white),
    ),
    ),
    )),
    ],
    ),
    ),
    ],
    ),
    ]
    )

    ),
    ),
    );
    }
}
