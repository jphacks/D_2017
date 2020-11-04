import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './XD_RoomAdminMenu.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XD_RoomAdminAddRoomDone extends StatelessWidget {
  XD_RoomAdminAddRoomDone({
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
              '部屋追加完了',
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
            offset: Offset(128.0, 204.0),
            child:
                // Adobe XD layer: 'Free check mark ico…' (group)
                SizedBox(
              width: 119.0,
              height: 85.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 119.0, 84.9),
                    size: Size(119.0, 84.9),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_4hosmk,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(105.0, 160.0),
            child: Container(
              width: 165.0,
              height: 165.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 3.0, color: const Color(0xff3ac645)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(78.0, 577.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_RoomAdminMenu(),
                ),
              ],
              child: Container(
                width: 220.0,
                height: 44.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xff459cf4),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(132.0, 591.0),
            child: Text(
              'メニューに戻る',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 16,
                color: const Color(0xffffffff),
                height: 1.3125,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(92.0, 374.0),
            child: Text(
              '部屋登録完了',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 32,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                height: 0.65625,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_4hosmk =
    '<svg viewBox="0.0 73.4 119.0 84.9" ><path  d="M 102.374626159668 73.41300201416016 L 50.75094223022461 125.0366821289062 L 16.62536811828613 90.91343688964844 L 0 107.5362548828125 L 34.12557601928711 141.6618194580078 L 50.75094223022461 158.2874298095703 L 67.37398529052734 141.6618194580078 L 119 90.03860473632812 L 102.374626159668 73.41300201416016 Z" fill="#3ac645" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
