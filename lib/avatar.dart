import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/user_provider.dart';


class AvatarPage extends StatefulWidget {
  const AvatarPage({super.key});

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  List<String> imageList = [
    "assets/images/img_image_28.png",
    "assets/images/img_image_27.png",
    "assets/images/img_image_28_120x120.png",
    "assets/images/img_image_27_120x120.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.17),
                    spreadRadius: 0.14,
                    blurRadius: 9,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/backbutton.png',
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text('Choose Avatar'.toUpperCase()),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25.0,
              mainAxisSpacing: 25.0,
            ),
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 100,
                child: InkWell(
                  onTap: () {
                    String selectedImagePath = imageList[index];
                    Provider.of<UserProfile>(context, listen: false)
                        .updateAvatar(selectedImagePath);
                    Navigator.of(context).pop();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imageList[index],
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
