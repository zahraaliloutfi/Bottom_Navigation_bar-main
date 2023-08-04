import 'package:flutter/material.dart';
import 'package:social_app/models/success_stories.dart.dart';
import 'package:social_app/screens/api_providar.dart';
import 'package:social_app/screens/task_screen.dart';
import 'arcieved_screen.dart';
import 'done_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SuccessStories? successStories;

  bool loading = true;
  int currentIndex = 0;
  List<Widget> screens = [
    const TaskScreen(),
    const DoneScreen(),
    const ArcievedScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    successStories = await ApiProvider().getStories();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.blue,
              )
            : Image.network(successStories!.model[0]!.image!),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task,
            ),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
            ),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive,
            ),
            label: 'Arcieved',
          ),
        ],
      ),
    );
  }
}
