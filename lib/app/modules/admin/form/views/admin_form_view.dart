import 'package:comic_app/app/data/KomikModel.dart';
import 'package:comic_app/app/helpers/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_form_controller.dart';

class AdminFormView extends GetView<AdminFormController> {
  const AdminFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comic Form'),
        centerTitle: true,
      ),
      floatingActionButton: Obx(
        () => (!controller.isEditMode.value &&
                controller.komikModel is KomikModel)
            ? FloatingActionButton(onPressed: () {
                controller.isEditMode.value = true;
              })
            : SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                // Title Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                    prefixIcon: Icon(
                      Icons.title,
                      color: getTheme(context).primaryColor,
                    ), // Icon added
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the title';
                    }
                    return null;
                  },
                  controller: controller.titleC,
                ),
                SizedBox(height: 12),
                // Subtitle Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Subtitle',
                    prefixIcon: Icon(
                      Icons.subtitles,
                      color: getTheme(context).primaryColor,
                    ), // Icon added
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the subtitle';
                    }
                    return null;
                  },
                  controller: controller.subtitleC,
                ),
                SizedBox(height: 12),
                // Author Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Author',
                    prefixIcon: Icon(
                      Icons.person,
                      color: getTheme(context).primaryColor,
                    ), // Icon added
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the author';
                    }
                    return null;
                  },
                  controller: controller.authorC,
                ),
                SizedBox(height: 12),
                // Total Chapters Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Total Chapters',
                    prefixIcon: Icon(
                      Icons.format_list_numbered,
                      color: getTheme(context).primaryColor,
                    ), // Icon added
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter total chapters';
                    }
                    if (int.tryParse(value) == null) {
                      return 'please enter valid number';
                    }
                    return null;
                  },
                  controller: controller.totalChapterC,
                ),
                SizedBox(height: 12),
                // Genres (Dropdown or Multi-Select)
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Genres',
                    prefixIcon: Icon(
                      Icons.category,
                      color: getTheme(context).primaryColor,
                    ), // Icon added
                  ),
                  items: controller.genreOptions.map((genre) {
                    return DropdownMenuItem<String>(
                      value: genre,
                      child: Text(genre),
                    );
                  }).toList(),
                  validator: (value) {
                    if (controller.genres.isEmpty) {
                      return 'Please select at least one genre';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value != null && !controller.genres.contains(value)) {
                      controller.genres.add(value);
                    }
                  },
                ),
                Obx(
                  () => Wrap(
                    spacing: 8.0,
                    children: controller.genres
                        .map((genre) => Chip(
                              label: Text(genre),
                              deleteIcon: Icon(
                                Icons.cancel,
                                color: getTheme(context).primaryColor,
                              ),
                              onDeleted: () {
                                controller.genres.remove(genre);
                              },
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 12),
                // Rating Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Rating',
                    prefixIcon: Icon(
                      Icons.star,
                      color: getTheme(context).primaryColor,
                    ), // Icon added
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a rating';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter valid number';
                    }
                    if ((double.tryParse(value) ?? 0) < 0 ||
                        (double.tryParse(value) ?? 0) > 5) {
                      return 'Rating must between 0-5';
                    }
                    return null;
                  },
                  controller: controller.ratingC,
                ),
                SizedBox(height: 12),
                // Asset Image URL Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Asset Image URL',
                    prefixIcon: Icon(
                      Icons.image,
                      color: getTheme(context).primaryColor,
                    ), // Icon added
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an image URL';
                    }
                    return null;
                  },
                  controller: controller.assetImageUrlC,
                ),
                SizedBox(height: 12),
                // Is Premium Checkbox
                CheckboxListTile(
                  title: Text('Premium Content'),
                  value: controller.isPremium.value,
                  onChanged: (value) {
                    controller.isPremium.value = value!;
                  },
                ),
                SizedBox(height: 12),
                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    controller.saveOrUpdateKomik();
                  },
                  child: Text('Submit'),
                ),
              ],
            )),
      ),
    );
  }
}
