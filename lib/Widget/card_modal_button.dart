import 'package:flutter/material.dart';

class ModalButton extends StatelessWidget {
  ModalButton({
    Key? key,
    required this.addFriend,
  }) : super(key: key);

  final Function addFriend;

  // String TextValue = '';
  TextEditingController controller = TextEditingController();

  void _handleOnClick(BuildContext context) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    addFriend(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 200,
        color: Colors.amber,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'your task'),
          ),
          SizedBox(height: 20),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () => _handleOnClick(context),
                  child: Text('add task')))
        ]),
      ),
    );
  }
}
