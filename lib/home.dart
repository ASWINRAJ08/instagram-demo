import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Hom extends StatefulWidget {
  const Hom({Key? key}) : super(key: key);

  @override
  State<Hom> createState() => _HomState();
}

class _HomState extends State<Hom> {
  List images = [];
  XFile? pickedFile;
  File? image;
  Future<dynamic> saveData() async {
    ImagePicker picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedFile!.path);
    });
    images.add(image);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () async {
                await saveData();
              },
                child: Icon(Icons.add_box_outlined,color: Colors.black,)),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(Icons.message_outlined,color: Colors.black,),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
          title: Text('Instagram',style: TextStyle(
            fontSize: 25,
              color: Colors.black),
          )),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled,
                    color: Colors.black),
                label: 'Games',backgroundColor: Colors.white
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.search,color: Colors.black),
                label: 'Apps'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.ondemand_video_outlined,color: Colors.black),
              label: 'Offers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined,
                  color: Colors.black),
              label: 'Books',
            ),
            BottomNavigationBarItem(icon: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('Assets/images/12_Girl-DP-Yohohindi.com_-300x300.jpeg')),
                  borderRadius: BorderRadius.circular(50)),
            ),
            label: 'profile')
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 110,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                          padding: const EdgeInsets.all(10,),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: AssetImage('Assets/images/12_Girl-DP-Yohohindi.com_-300x300.jpeg')),
                                ),
                          ),
                ),
                        ],
                      ),
                      Row(children: [
                        Text('__aswinrj__')
                      ],),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 580,
              child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20,left: 10),
                            child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('Assets/images/12_Girl-DP-Yohohindi.com_-300x300.jpeg')),
                                borderRadius: BorderRadius.circular(50)),
                ),
                          ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 20),
                        child: Text('__aswinrj__'),
                      ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: Container(
                      child: image==null?Center(child: Text('no image')):Image.file(images[index],fit: BoxFit.fill),
                      height: 400,
                    width: double.infinity,
                    ),
                  ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.favorite_border_outlined),
                        ),
                        Icon(Icons.comment_outlined),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.send),
                        ),
                        SizedBox(width: 250,),
                        Icon(Icons.save)
                      ],
                    )
                ],);
              },),
            )
          ],
        ),
      ),
    );
  }
}
