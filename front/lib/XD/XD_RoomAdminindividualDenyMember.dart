import 'package:flutter/material.dart';
import './XD_RoomAdminindividualDenyMemberDone.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XD_RoomAdminindividualDenyMember extends StatelessWidget {
  XD_RoomAdminindividualDenyMember({
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
              '保留メンバー',
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
            offset: Offset(78.0, 738.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_RoomAdminindividualDenyMemberDone(),
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
            offset: Offset(140.0, 752.0),
            child: Text(
              '入室承認する',
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
            offset: Offset(0.0, 130.0),
            child: Container(
              width: 375.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xfff8f8f8),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 190.0),
            child: Container(
              width: 375.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xfff8f8f8),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 250.0),
            child: Container(
              width: 375.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xfff8f8f8),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(55.0, 270.0),
            child: Text(
              'User Name K',
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
            offset: Offset(55.0, 150.0),
            child: Text(
              'User Name J',
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
            offset: Offset(55.0, 210.0),
            child: Text(
              'User Name L',
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
            offset: Offset(12.5, 190.0),
            child: SvgPicture.string(
              _svg_o7w135,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(25.0, 151.0),
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xff3ac645),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(25.0, 211.0),
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(25.0, 271.0),
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(28.0, 156.0),
            child:
                // Adobe XD layer: 'Free check mark ico…' (group)
                SizedBox(
              width: 15.0,
              height: 11.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 14.7, 10.5),
                    size: Size(14.7, 10.5),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_5ffror,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_o7w135 =
    '<svg viewBox="12.5 190.0 350.0 60.0" ><path transform="translate(12.5, 190.0)" d="M 0 0 L 350 0" fill="none" stroke="#e0e0e0" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(12.5, 250.0)" d="M 0 0 L 350 0" fill="none" stroke="#e0e0e0" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_5ffror =
    '<svg viewBox="0.0 73.4 14.7 10.5" ><path transform="translate(0.0, 0.0)" d="M 12.66498184204102 73.41300964355469 L 6.278506278991699 79.79948425292969 L 2.056759357452393 75.57802581787109 L 0 77.63446807861328 L 4.221746921539307 81.85620880126953 L 6.278506278991699 83.91300964355469 L 8.334978103637695 81.85620880126953 L 14.72174167633057 75.46979522705078 L 12.66498184204102 73.41300964355469 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
