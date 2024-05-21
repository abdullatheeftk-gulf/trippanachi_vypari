import 'package:flutter/material.dart';

class MyMenuBar extends StatelessWidget {
  const MyMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index == 0) {
          return IconButton(
            onPressed: () {},
            icon: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                Text(
                  "Add Member",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }
        if (index == 1) {
          return IconButton(
            onPressed: () {},
            icon: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.money,
                  color: Colors.white,
                ),
                Text(
                  "Finance",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }
        if (index == 2) {
          return IconButton(
            onPressed: () {},
            icon: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }
        else{
          return const SizedBox();
        }
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: 3,
    );

    /* Column(
      children: [
        IconButton(onPressed: (){}, icon: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.people, color: Colors.white,),
            Text("Add Member",style: TextStyle(color: Colors.white ), textAlign: TextAlign.center,)
          ],
        ),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.panorama_fisheye,color: Color.fromARGB(255, 180, 172, 172),)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.abc,color: Color.fromARGB(255, 180, 172, 172),)),
      ], 
    );*/
  }
}
