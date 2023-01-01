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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('widget.title'),
        ),
        body: Center(
          child: Column(children: [
            Row(
              children: const [
                Spacer(),
                SizedBox(height: 100, child: ImageBox()),
                Spacer(),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('set'),
            )
          ]),
        ));
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(),
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
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.grey[800],
                )

                // images == null
                //     ? Icon(
                //         Icons.camera_alt,
                //         color: Colors.grey[800],
                //       )
                //     : Icon(
                //         Icons.camera_alt,
                //         color: Colors.grey[800],
                //       ) //Image.file(images[index].path),
                ),
          ),
        );
      }),
      itemCount: 5,
      scrollDirection: Axis.horizontal,
    );
  }
}
