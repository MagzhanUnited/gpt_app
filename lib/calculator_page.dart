import 'package:flutter/material.dart';
import 'package:flutter_gpt_app/components/droping_down.dart';
import 'package:flutter_gpt_app/controllers/component_controllers.dart';
import 'package:flutter_gpt_app/controllers/question_controller.dart';
import 'package:get/get.dart';
import 'components/buttons.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var questionController = Get.put(QuestionController());

  var componentController = Get.put(ComponentControllers());

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'x',
    '='
  ];

  var dropdownValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
              child: Center(
                  child: Container(
            margin: EdgeInsets.only(left: 35),
            alignment: Alignment.centerLeft,
            child: Obx(() => TextField(
                  controller: questionController.question.value,
                  readOnly: true,
                  showCursor: true,
                  decoration: InputDecoration(border: InputBorder.none),
                  style: TextStyle(fontSize: 25),
                  //onChanged: (value) => set_cursur(),
                )),
          ))),
          Expanded(
            flex: 2,
            child: Center(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      switch (buttons[index]) {
                        case 'C':
                          return DropingDown(
                              items: ['Option 1'], wiget: _unique_button());
                        case 'DEL':
                          return GestureDetector(
                            child: MyBotton(
                                buttonText: buttons[index],
                                color: Colors.red,
                                textColor: Colors.white),
                            onTap: () => delete_text(),
                          );
                      }
                      if (isOperator(buttons[index])) {
                        return GestureDetector(
                          child: MyBotton(
                              buttonText: buttons[index],
                              color: Colors.deepPurple,
                              textColor: Colors.white),
                          onTap: () => change_text(index),
                        );
                      }
                      return GestureDetector(
                          child: MyBotton(
                              buttonText: buttons[index],
                              color: Colors.white,
                              textColor: Colors.deepPurple),
                          onTap: () => change_text(index));
                    })),
          )
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void change_text(int index) {
    try {
      var oldSelection = questionController.question.value.selection;
      var oldText = questionController.question.value.text; //+= buttons[index];
      String newChar = buttons[index];
      String first_part = oldText.substring(0, oldSelection.baseOffset);
      String second_part =
          oldText.substring(oldSelection.baseOffset, oldText.length);
      questionController.question.value.text =
          first_part + newChar + second_part;

      //var newLength = questionController.question.value.text.length;

      var newSelection = questionController.question.value.selection.copyWith(
          baseOffset: oldSelection.baseOffset + 1,
          extentOffset: oldSelection.baseOffset + 1);

      questionController.question.value.selection = newSelection;
      // print(questionController.question.value.selection.extentOffset);
      // questionController.question.value.selection = TextSelection.collapsed(
      //     offset: questionController.question.value.text.length);
      // print(questionController.question.value.selection.baseOffset);
      // print(questionController.question.value.text.length);
    } catch (e) {
      questionController.question.value.text += buttons[index];

      var newLength = questionController.question.value.text.length;

      var newSelection = questionController.question.value.selection
          .copyWith(baseOffset: newLength, extentOffset: newLength);

      questionController.question.value.selection = newSelection;
    }
  }

  void delete_text() {
    try {
      var oldSelection = questionController.question.value.selection;
      // questionController.question.value.text = questionController
      //     .question.value.text
      //     .substring(0, questionController.question.value.text.length - 1);
      String oldText = questionController.question.value.text;
      String first_part = oldText.substring(
          0, questionController.question.value.selection.baseOffset - 1);
      String second_part = oldText.substring(
          questionController.question.value.selection.baseOffset,
          oldText.length);
      questionController.question.value.text = first_part + second_part;

      //print('Maga'.length);
      var newSelection = questionController.question.value.selection.copyWith(
          baseOffset: oldSelection.baseOffset - 1,
          extentOffset: oldSelection.baseOffset - 1);
      questionController.question.value.selection = newSelection;
    } catch (e) {
      print(e);
    }
  }

  _unique_button() {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Center(
        child: Icon(Icons.dashboard_rounded),
      ),
    );
  }
}


/*Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Select an option:'),
                    SizedBox(height: 8.0),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_up),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Option 1',
                        'Option 2',
                        'Option 3',
                        'Option 4'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.black,
              )
            ],
          ),
        ),
      ), */