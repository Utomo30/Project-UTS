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
        title: Text(
          controller.komik.title,
          style: TextStyle(
            fontSize: 24, // Ukuran font yang lebih besar
            fontWeight: FontWeight.bold, // Berat font bold
            fontFamily: 'YourCustomFont', // Ganti dengan nama font kustom Anda
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Tambahkan fungsionalitas untuk pengaturan
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
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: panelList.length,
                    itemBuilder: (context, index) => Image.asset(
                      panelList[index],
                      width: Get.width,
                    ),
                  ),

                  // Navigasi untuk chapter sebelumnya dan selanjutnya
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () {
                            if (controller.chapter > 0) controller.chapter -= 1;
                          },
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Previous'),
                        ),
                        Obx(() => Text("${controller.chapter}")),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (controller.chapter <
                                controller.komik.totalChapters) {
                              controller.chapter += 1;
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Next'),
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
