import 'package:flutter/material.dart';
import './XD_RegTempDeviceDone.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XD_RegTempDevice extends StatelessWidget {
  XD_RegTempDevice({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(),
          Container(),
          Transform.translate(
            offset: Offset(0.0, 90.0),
            child: Container(
              width: 375.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: const Color(0xffe0e0e0),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(30.0, 101.0),
            child: Text(
              '検温デバイス登録',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff393939),
                fontWeight: FontWeight.w700,
                height: 1.1666666666666667,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(29.0, 160.0),
            child: Text(
              '下に表示されるリストの中から、登録するデ\nバイスを選択してください。\n\n表示されない場合は以下の２点をご確認くだ\nさい。\n　・機器の電源が入っているか\n　・スマートフォンと機器を近づける',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 16,
                color: const Color(0xff000000),
                height: 1.25,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 320.0),
            child: Container(
              width: 375.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 380.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_RegTempDeviceDone(),
                ),
              ],
              child: Container(
                width: 375.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: const Color(0xfff8f8f8),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(30.0, 341.0),
            child: Text(
              '検出したデバイス一覧',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                height: 1.1666666666666667,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(50.0, 400.0),
            child: Text(
              'MAKURA Device',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff000000),
                height: 1.1666666666666667,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(-1.0, 439.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_RegTempDeviceDone(),
                ),
              ],
              child: Container(
                width: 375.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: const Color(0xfff8f8f8),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(49.0, 459.0),
            child: Text(
              'Toilet Device',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff000000),
                height: 1.1666666666666667,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(12.5, 440.0),
            child: SvgPicture.string(
              _svg_gmlsso,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_gmlsso =
    '<svg viewBox="12.5 440.0 350.0 1.0" ><path transform="translate(12.5, 440.0)" d="M 0 0 L 350 0" fill="none" stroke="#e0e0e0" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
