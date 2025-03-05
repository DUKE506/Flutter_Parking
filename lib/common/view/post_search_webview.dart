import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';
import 'package:flutter_parking/common/model/daum_post_model.dart';
import 'package:go_router/go_router.dart';

class PostSearchWebview extends StatefulWidget {
  const PostSearchWebview({super.key});

  @override
  State<PostSearchWebview> createState() => _PostSearchWebviewState();
}

class _PostSearchWebviewState extends State<PostSearchWebview> {
  //다음주소api 모델
  DaumPostModelBase _post = DaumPostModelLoading();

  //로컬서버 객체
  final InAppLocalhostServer _localhostServer = InAppLocalhostServer();
  late InAppWebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //첫 로드시 로컬 서버 실행
    _localhostServer.start();
  }

  @override
  void dispose() {
    //로컬 서버 종료
    _localhostServer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '주소 검색',
      body: Stack(
        children: [
          //웹뷰
          InAppWebView(
            initialUrlRequest: URLRequest(
              url:
                  WebUri('http://127.0.0.1:8080/asset/html/daum_postcode.html'),
            ),
            initialSettings: InAppWebViewSettings(
              useShouldOverrideUrlLoading: true, //url 로딩 제어
              mediaPlaybackRequiresUserGesture: false, //미디어 자동 재생
              javaScriptEnabled: true, // 자바스크립트 실행 여부
              javaScriptCanOpenWindowsAutomatically: true, // 팝업 여부
              useHybridComposition: true, // 하이브리드 사용을 위한 안드로이드 웹뷰 최적화
              supportMultipleWindows: true, // 멀티 윈도우 허용
              allowsInlineMediaPlayback: true, // 웹뷰 내 미디어 재생 허용
            ),
            onWebViewCreated: (controller) {
              _controller = controller;
              _controller.addJavaScriptHandler(
                handlerName: 'onSelectAddress',
                callback: (args) {
                  _post = DaumPostModelBase();
                  //json형태 데이터 받기 및 Model 형태로 변환
                  _post = DaumPostModel.fromJson(args.first);
                  //이전으로 돌아가기(객체 전달)
                  context.pop(_post);
                },
              );
            },
            //웹뷰의 로딩이 ㅣ끝나고 화면에 노출되는 순간에 호출되는 부분
            //로컬호스트가 구동되고 있는지에 따라 실행 할 것 결정
            onLoadStop: (controller, url) {
              setState(() {
                //로컬호스트가 구동중이 아닐 때
                if (_localhostServer.isRunning()) {
                  _post = DaumPostModelBase();
                } else {
                  _localhostServer.start().then((value) {
                    _controller.reload();
                  });
                }
              });
            },
            //에러 발생
            onReceivedError: (controller, req, error) {
              print('에러 ${error.description}');
              setState(() {
                _post = DaumPostModelError(message: error.description);
              });
            },
          ),
          //로딩
          if (_post is DaumPostModelLoading) ...[
            const SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
          //에러
          if (_post is DaumPostModelError) ...[
            const SizedBox(
              child: Center(
                child: Text(
                  '에러발생',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  //Jsonserialize로 변경 예정
  DaumPostModel _dataSetting(Map<String, dynamic> map) {
    return DaumPostModel(
      map["address"],
      map["roadAddress"],
      map["jibunAddress"],
      map["sido"],
      map["sigungu"],
      map["bname"],
      map["roadname"],
      map["buildingName"],
      map["addressEnglish"],
      map["roadAddressEnglish"],
      map["jibunAddressEnglish"],
      map["sidoEnglish"],
      map["sigunguEnglish"],
      map["bnameEnglish"],
      map["roadnameEnglish"],
      map["zonecode"],
      map["sigunguCode"],
      map["bcode"],
      map["buildingCode"],
      map["roadnameCode"],
      map["addressType"],
      map["apartment"],
      map["userLanguageType"],
      map["userSelectedType"],
    );
  }
}
