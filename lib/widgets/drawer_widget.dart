import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamezone/ViewModels/DrawerMenu.dart';
import 'package:gamezone/pages/second_page.dart';
import 'package:gamezone/styles/AppColors.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key, required this.menuList}) : super(key: key);

  final List<DrawerMenu> menuList;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.main,
              // image: DecorationImage(
              //   image: NetworkImage(image.toString()),
              //   fit: BoxFit.cover,
              // ),
              borderRadius:
              BorderRadius.all(Radius.circular(8.0),),
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blueAccent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/images/user.png", width: 75,),
                    ),
                  ),
                  const SizedBox(width: 14,),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Welcome!", style: TextStyle(color: Colors.white, fontSize: 16),),
                      Text("Emran Khandaker Evan", style: TextStyle(color: Colors.white54, fontSize: 14),),
                    ],))
                ],)

          ),
          Expanded(child: ListView.builder(
              itemCount: widget.menuList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // tileColor: Colors.white30,
                  leading: Image.asset(widget.menuList[index].icon, height: 26, color: AppColors.main,),
                  title: Text(widget.menuList[index].title, style: const TextStyle(color: Colors.white, fontSize: 14),),
                  dense: true,
                  subtitle: Text(widget.menuList[index].subTitle, style: const TextStyle(color: Colors.white54, fontSize: 12),),
                  onTap: () {
                    Navigator.of(context).pop(true);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(menu: widget.menuList[index])));
                  },
                );
              }))
        ],
      )
    );
  }
}
