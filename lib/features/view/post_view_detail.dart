import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:message_app/core/constants/app_constant.dart';

class PostViewDetail extends StatelessWidget {
  PostViewDetail({@required this.downloadurl, @required this.author});
  final String? downloadurl;
  final String? author;

  @override
  Widget build(BuildContext context) {
    var imgUrl = ApplicationConstant.instance.imgUrl;
    return Scaffold(
      backgroundColor: Color(0xfff1f3f8),
      appBar: msgAppbar(context),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    if (index % 2 == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 10),
                        child: senderMsg(context),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: geterMsg(context, imgUrl),
                      );
                    }
                  },
                ),
              ),
            ),
            typeMsg(),
          ],
        ),
      ),
    );
  }

  AppBar msgAppbar(BuildContext context) {
    return AppBar(
        leadingWidth: 80,
        toolbarHeight: context.dynamicHeight(0.15),
        elevation: 0,
        backgroundColor: Color(0xff44C551),
        shape: ContinuousRectangleBorder(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0)),
        ),
        actions: [
          Icon(
            Icons.videocam,
            size: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.phone,
              size: 30,
            ),
          ),
        ],
        title: Text(author.toString(), style: context.textTheme.headline6),
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(downloadurl.toString()),
        ));
  }

  Row senderMsg(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            downloadurl.toString(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.6)),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(downloadurl.toString(),
                          style: context.textTheme.bodyText2),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        '13.15',
                        style: context.textTheme.caption,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Row geterMsg(BuildContext context, String imgUrl) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(author.toString(), style: context.textTheme.bodyText2),
                SizedBox(
                  height: 9,
                ),
                Text(
                  '13.15',
                  style: context.textTheme.caption,
                )
              ],
            )),
        SizedBox(width: 8),
        ClipOval(
          child: Image.network(
            imgUrl.toString(),
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.055,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Align typeMsg() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 80,
        color: Colors.white.withOpacity(0.5),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Color(0xff056676),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 21,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 70.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  minLines: 1,
                  decoration: InputDecoration(
                      hintText: ' Mesaj yazın...',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    color: Color(0xff056676),
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
