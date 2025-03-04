import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_parking/common/component/file_add_bottom_sheet.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:image_picker/image_picker.dart';

class CustomInputImage extends StatefulWidget {
  final String? label;
  const CustomInputImage({
    super.key,
    this.label = '첨부파일',
  });

  @override
  State<CustomInputImage> createState() => _CustomInputImageState();
}

class _CustomInputImageState extends State<CustomInputImage> {
  late List<XFile?> images = [];

  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future getCamera() async {
    XFile? _image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      images.add(_image);
    });
  }

  Future getImages() async {
    late List<XFile> _images = [];
    _images = await picker.pickMultiImage();

    setState(() {
      images = _images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 4.0,
      children: [
        Text(
          widget.label!,
          style: TextStyle(
            fontSize: 12.0,
            color: DEACTIVATE_TEXT_COLOR,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8,
            children: [
              ...images.map(
                (img) => renderImageBox(context, img!.path),
              ),
              renderImageBox(context, null),
            ],
          ),
        )
      ],
    );
  }

  //이미지 박스
  Widget renderImageBox(BuildContext context, String? imgPath) {
    double width = MediaQuery.of(context).size.width / 6;

    return AnimatedContainer(
      duration: Duration(),
      width: width,
      height: width,
      decoration: BoxDecoration(
        color: BACKGROUND_GREY_LIGHT_COLOR,
        border: Border.all(
          width: 1,
          color: BACKGROUND_GREY_DEEP_COLOR,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: imgPath != null
          ? Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.file(
                    File(imgPath),
                    width: width,
                    fit: BoxFit.cover,
                  ),
                ),
                Icon(
                  Icons.cancel,
                  size: 15.0,
                  color: Colors.red,
                ),
              ],
            )
          : InkWell(
              onTap: () async {
                await showModalBottomSheet<void>(
                  context: context,
                  builder: (_) {
                    return FileAddBottomSheet(
                      getCamera: getCamera,
                      getImages: getImages,
                    );
                  },
                );
              },
              child: Center(
                child: Icon(Icons.add),
              ),
            ),
    );
  }
}
