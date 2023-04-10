import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_gpt_app/controllers/component_controllers.dart';
import 'package:get/get.dart';

class DropingDown extends StatelessWidget {
  final List<String> items;
  Widget wiget;
  var componentController = Get.find<ComponentControllers>();
  DropingDown({super.key, required this.items, required this.wiget});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Column(
          children: [
            componentController.isExpanded.value
                ? Column(
                    children: List.generate(
                        items.length, (index) => _container(items[index])),
                  )
                : SizedBox(),
            Expanded(
                child: GestureDetector(
              child: wiget,
              onTap: () => componentController.isExpanded.value =
                  !componentController.isExpanded.value,
            ))
          ],
        ),
      ),
    );
  }

  _container(String text) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        width: 50,
        height: 50,
        child: Text(text),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(13),
            color: Colors.blue));
  }
}
