import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:message_app/features/view/post_view_detail.dart';
import 'package:message_app/features/viewmodel/post_view_model.dart';
import 'package:kartal/kartal.dart';

class PostView extends StatelessWidget {
  final _viewmodel = PostViewModel();
  @override
  Widget build(BuildContext context) {
    _viewmodel.fetchData();
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Color(0xff44C551),
        items: <Widget>[
          Icon(
            Icons.message,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.phone, size: 30, color: Colors.white),
          Icon(Icons.photo, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
        ],
        onTap: (index) {},
      ),
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ACTIVITY',
              style: context.textTheme.headline5,
            ),
          ),
          userActivate(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'MESSAGES',
              style: context.textTheme.headline5,
            ),
          ),
          gettingmessages()
        ],
      ),
    );
  }

  Expanded gettingmessages() {
    return Expanded(
      flex: 1,
      child: Container(
        child: Observer(builder: (_) {
          return ListView.builder(
            itemCount: _viewmodel.posts.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.green,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundImage: NetworkImage(
                                _viewmodel.posts[index].downloadUrl.toString()),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostViewDetail(
                                        downloadurl: _viewmodel
                                            .posts[index].downloadUrl
                                            .toString(),
                                        author: _viewmodel.posts[index].author
                                            .toString(),
                                      )),
                            );
                          },
                          child: Container(
                            height: 70,
                            width: context.dynamicWidth(0.6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _viewmodel.posts[index].author.toString(),
                                  style: context.textTheme.bodyText1,
                                ),
                                Text(
                                  _viewmodel.posts[index].url.toString(),
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.4)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '27 min',
                              style: TextStyle(
                                  color: Color(0xff44C551), fontSize: 14),
                            ),
                            CircleAvatar(
                              backgroundColor: Color(0xff44C551),
                              radius: 10,
                              child: Text(
                                '1',
                                style: context.primaryTextTheme.bodyText1,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }

  Container userActivate(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.2),
      width: context.dynamicWidth(1),
      child: Observer(builder: (_) {
        return ListView.builder(
          itemCount: _viewmodel.posts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                          radius: 37,
                          //
                          backgroundImage: NetworkImage(
                              _viewmodel.posts[index].downloadUrl.toString()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_viewmodel.posts[index].author.toString()),
                    )
                  ],
                )
              ],
            );
          },
        );
      }),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 200,
      leading: Center(child: Text('CHATS', style: context.textTheme.headline4)),
      actions: [
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 40,
                  color: Colors.grey,
                ),
                onPressed: () {}),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: IconButton(
                  icon: Icon(
                    Icons.dehaze,
                    color: Colors.grey,
                    size: 40,
                  ),
                  onPressed: () {}),
            ),
          ],
        )
      ],
    );
  }
}
