import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class ImageViewScreen extends StatefulWidget {
  const ImageViewScreen({super.key});

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('widget.title'),
        ),
        body: Center(
          child: Column(children: [
            Row(
              children: [
                const Spacer(),
                SizedBox(height: 100, child: _buildImageView()),
                const Spacer()
              ],
            ),
            ElevatedButton(
              onPressed: () {
                selectImages();
              },
              child: const Text('set'),
            )
          ]),
        ));
  }

  ListView _buildImageView() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.all(9),
          child: Center(
            child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    top: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
                height: 60,
                width: 60,
                child:
                    //     Image.file(File(imageFileList![index].path),
                    //              fit: BoxFit.cover) ??
                    //     Icon(
                    //   Icons.camera_alt,
                    //   color: Colors.grey[800],
                    // ),

                    imageFileList!.length <= 5
                        ? Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          )
                        : Image.file(File(imageFileList![index].path),
                            fit: BoxFit.cover)

                //Image.file(images[index].path),
                ),
          ),
        );
      }),
      itemCount: 5,
      scrollDirection: Axis.horizontal,
    );
  }
}
