import 'package:flutter/material.dart';
import 'package:flutter_hoc_lai/Model/friends.dart';
import 'Widget/body_todoList';
import 'package:flutter_hoc_lai/Widget/card_modal_button.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final List<DataItem> items = [
  final List<friend> myFriends = [];

  void _handleAddFriend(String name) {
    final newItem = friend(name: name, age: DateTime.now().toString());
    setState(() {
      myFriends.add(newItem);
    });
  }

  void _handleDeleteFrend(String id) {
    setState(() {
      myFriends.removeWhere((item) => item.age == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 100.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Good app'),
                centerTitle: true,
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              leading: InkWell(
                onTap: () {
                  print('this is the icon on the left of the appBar');
                },
                child: const Icon(Icons.menu),
              ),
              actions: [
                PopupMenuButton<String>(
                  onSelected: (String result) {
                    print(
                        'you have selected a beautiful girl in Nham class: $result');
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: 'Le Mai Anh',
                      child: Text('Mai Anh'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Nguyen Thuy Tien',
                      child: Text('Nguyen Thuy Tien'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Vu Minh Khanh',
                      child: Text('Vu Minh Khanh'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Cao Thi Thuy Duong',
                      child: Text('Cao Thi Thuy Duong'),
                    ),
                  ],
                ),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: myFriends
                .map((item) =>
                    CardBody(item: item, handleDelete: _handleDeleteFrend))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (BuildContext context) {
              print(context);
              return ModalButton(addFriend: _handleAddFriend);
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
