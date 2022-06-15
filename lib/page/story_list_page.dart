import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/users.dart';
import '../main.dart';
import '../providers/listview_notifier.dart';
import 'story_page.dart';

class StoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.width;

    final _storyPageState =
        Provider.of<ListViewNotifier>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Story app test'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: _width,
            height: _storyPageState.maxHeight,
            child: ListView.builder(
              controller: _storyPageState.scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StoryPage(user: users[index]),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: _storyPageState.maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(users[index].imgUrl),
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            //color: Colors.amber,
                            child: Center(
                              child: Text(
                                users[index].name,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // child: SizedBox(
                    //   height: 50,
                    //   child: ListTile(
                    //     title: Text(users[index].name),
                    //     onTap: () {
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //           builder: (context) => StoryPage(user: users[index]),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
