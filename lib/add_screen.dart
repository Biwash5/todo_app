import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key, required this.addFunc});
  final Function addFunc;

  @override
  Widget build(BuildContext context) {
    TextEditingController txt = TextEditingController();
    GlobalKey<FormState> key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Center(
            child: const Text(
              "Add Task",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          )),
      body: Form(
        key: key,
        child: Container(
          margin: const EdgeInsets.only(
            top: 4,
            right: 8,
            left: 8,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: txt,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (data) {
                  if (data == null || data.isEmpty) {
                    return ('Please enter data');
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    addFunc({
                      "title": txt.value.text,
                      "id": DateTime.now().toString(),
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
