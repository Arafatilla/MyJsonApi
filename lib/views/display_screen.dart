/*import 'package:flutter/material.dart';
import 'package:myjson_api/models/post.dart';

import '../service/remote_service.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}






class _DisplayScreenState extends State<DisplayScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteSevice().getPost();
    if(posts != null){

      setState(() {
        isLoaded= true ;
      });
    }
  }


  // create a list of posts
  List<Post>? posts ;
  var isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Text(posts! [index].title),
        ],
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:myjson_api/models/post.dart';
import '../service/remote_service.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  List<Post>? posts;
  bool isLoaded = false;


  // redefine the initstate so whenever we launch the app the data is fetched
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteSevice().getPost();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts form MyJsonApi")),
      body: isLoaded
          ? ListView.builder(
        itemCount: posts!.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(posts![index].id.toString()),
              ),
              title: Text(posts![index].title, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          );
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
