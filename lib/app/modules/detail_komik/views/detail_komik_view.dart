import 'package:comic_app/app/helpers/const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_komik_controller.dart';

class DetailKomikView extends GetView<DetailKomikController> {
  const DetailKomikView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.komik.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add functionality for settings (e.g., dark mode, orientation, etc.)
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => Text(
                        'Chapter ${controller.chapter}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: panelList.length,
                    itemBuilder: (context, index) => Image.asset(
                      panelList[index],
                      width: Get.width,
                    ),
                  ),

                  // Navigation Buttons for Previous and Next chapters
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () {
                            if (controller.chapter > 0) controller.chapter -= 1;
                          },
                          icon: Icon(Icons.arrow_back),
                          label: Text('Previous'),
                        ),
                        Obx(() => Text("${controller.chapter}")),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (controller.chapter <
                                controller.komik.totalChapters)
                              controller.chapter += 1;
                          },
                          icon: Icon(Icons.arrow_forward),
                          label: Text('Next'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
