import 'package:flutter/material.dart';
import '../models/model.dart';
import '../models/success_stories.dart.dart';
import 'api_providar.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  SuccessStories? successStories;
  bool loading = true;
  getData() async {
    successStories = await ApiProvider().getStories();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stories',
        ),
      ),
      body: loading
          ? CircularProgressIndicator()
          : ListView.separated(
              itemBuilder: (context, index) => buildUserItem(
                  successStory: successStories!.model[index], index: index),
              separatorBuilder: (context, index) => Divider(),
              itemCount: successStories!.model!.length,
            ),
    );
  }

  Widget buildUserItem({required Model successStory, required int index}) =>
      Row(
        children: [
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            child: Text('${successStory.id}'),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                width: 200,
                child: Text(
                  '${successStory.title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      );
}
