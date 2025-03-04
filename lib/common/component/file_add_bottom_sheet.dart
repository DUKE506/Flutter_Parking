import 'package:flutter/material.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/layout/bottom_sheet_layout.dart';
import 'package:image_picker/image_picker.dart';

class FileAddBottomSheet extends StatelessWidget {
  final VoidCallback getCamera;
  final VoidCallback getImages;
  const FileAddBottomSheet({
    super.key,
    required this.getCamera,
    required this.getImages,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      height: MediaQuery.of(context).size.height / 6,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          // spacing: 32.0,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _renderItem(
              label: '갤러리',
              icon: Icons.photo_outlined,
              onTap: getImages,
            ),
            _renderItem(
              label: '카메라',
              icon: Icons.camera_alt_outlined,
              onTap: getCamera,
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderItem({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: Duration(),
      child: InkWell(
        onTap: onTap,
        child: Column(
          spacing: 8.0,
          children: [
            Container(
              decoration: BoxDecoration(
                color: BACKGROUND_GREY_DEEP_COLOR,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                icon,
                size: 40.0,
                // color: BACKGROUND_GREY_DEEP_COLOR,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
