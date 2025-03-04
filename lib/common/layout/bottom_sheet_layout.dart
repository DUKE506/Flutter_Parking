import 'package:flutter/cupertino.dart';
import 'package:flutter_parking/common/component/custom_elevated_button.dart';
import 'package:flutter_parking/common/const/colors.dart';

class BottomSheetLayout extends StatelessWidget {
  final double? height;
  final String? title;
  final VoidCallback? onPressed;
  final Widget? child;
  final String? buttonLabel;
  const BottomSheetLayout({
    super.key,
    this.height,
    this.title,
    this.child,
    this.buttonLabel = '등록',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          width: double.infinity,
          height: height,
          child: Column(
            children: [
              _renderDragHandle(context),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    spacing: 16.0,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (title != null)
                        Text(
                          '방문차량 등록',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (child != null) child!,
                      if (onPressed != null)
                        CustomElevatedButton(
                          onPressed: onPressed!,
                          label: buttonLabel!,
                        )
                    ],
                  ),
                ),
              ))
            ],
          )),
    );
  }

  //상단 드래그 핸들링 위치 표시 위젯
  Widget _renderDragHandle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        color: BACKGROUND_GREY_DEEP_COLOR,
        height: 4,
        width: MediaQuery.of(context).size.width / 5,
      ),
    );
  }
}
