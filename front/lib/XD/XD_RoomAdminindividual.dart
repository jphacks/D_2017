import 'package:flutter/material.dart';
import './XD_RoomAdminindividualEditName.dart';
import 'package:adobe_xd/page_link.dart';
import './XD_RoomAdminindividualEditTemp.dart';
import './XD_RoomAdminindividualEnterLog.dart';
import './XD_RoomAdminindividualAllowMember.dart';
import './XD_RoomAdminindividualDenyMember.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XD_RoomAdminindividual extends StatelessWidget {
  XD_RoomAdminindividual({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 130.0),
            child: Container(
              width: 375.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 190.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_RoomAdminindividualEditName(),
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
          Container(),
          Container(),
          Transform.translate(
            offset: Offset(175.0, 738.0),
            child: Container(
              width: 180.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xff459cf4),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(193.0, 744.0),
            child: Text(
              '招待リンクを取得',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                height: 1.1666666666666667,
              ),
              textAlign: TextAlign.left,
            ),
          ),
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
            offset: Offset(30.0, 99.0),
            child: Text(
              'ROOM SETTING',
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
            offset: Offset(30.0, 151.0),
            child: Text(
              '部屋名',
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
            offset: Offset(50.0, 210.0),
            child: Text(
              'Room 1',
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
            offset: Offset(0.0, 250.0),
            child: Container(
              width: 375.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 310.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_RoomAdminindividualEditTemp(),
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
            offset: Offset(30.0, 271.0),
            child: Text(
              '体温上限',
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
            offset: Offset(50.0, 330.0),
            child: Text(
              '36.5℃',
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
            offset: Offset(0.0, 370.0),
            child: Container(
              width: 375.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 430.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_RoomAdminindividualEnterLog(),
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
            offset: Offset(30.0, 391.0),
            child: Text(
              '入退室状況',
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
            offset: Offset(50.0, 450.0),
            child: Text(
              '現在5人入室状態',
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
            offset: Offset(0.0, 490.0),
            child: Container(
              width: 375.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 550.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_RoomAdminindividualAllowMember(),
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
            offset: Offset(30.0, 511.0),
            child: Text(
              '承認済みメンバー',
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
            offset: Offset(50.0, 570.0),
            child: Text(
              '16人承認済み',
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
            offset: Offset(0.0, 610.0),
            child: Container(
              width: 375.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 670.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_RoomAdminindividualDenyMember(),
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
            offset: Offset(30.0, 631.0),
            child: Text(
              '保留メンバー',
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
            offset: Offset(50.0, 690.0),
            child: Text(
              '8人の保留メンバー',
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
            offset: Offset(345.0, 217.0),
            child: SvgPicture.string(
              _svg_shgrek,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_shgrek =
    '<svg viewBox="345.0 217.0 8.3 494.0" ><path transform="matrix(0.0, -1.0, 1.0, 0.0, 288.33, 550.0)" d="M 92.60610961914062 58.94936370849609 C 93.13130187988281 58.43307113647461 93.13130187988281 57.58741760253906 92.60610961914062 57.06222152709961 C 92.08090209960938 56.54593276977539 91.23526763916016 56.54593276977539 90.71896362304688 57.06222152709961 L 86.00110626220703 61.78007888793945 L 81.27435302734375 57.06222152709961 C 80.75807189941406 56.54593276977539 79.91241455078125 56.54593276977539 79.38721466064453 57.06222152709961 C 78.87092590332031 57.58741760253906 78.87092590332031 58.43307113647461 79.38721466064453 58.94936370849609 L 85.05754089355469 64.61968994140625 C 85.57382965087891 65.13597869873047 86.41949462890625 65.13597869873047 86.94468688964844 64.61968994140625 L 92.60610961914062 58.94936370849609 Z" fill="#393939" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.0, -1.0, 1.0, 0.0, 288.33, 670.0)" d="M 92.60610961914062 58.94936370849609 C 93.13130187988281 58.43307113647461 93.13130187988281 57.58741760253906 92.60610961914062 57.06222152709961 C 92.08090209960938 56.54593276977539 91.23526763916016 56.54593276977539 90.71896362304688 57.06222152709961 L 86.00110626220703 61.78007888793945 L 81.27435302734375 57.06222152709961 C 80.75807189941406 56.54593276977539 79.91241455078125 56.54593276977539 79.38721466064453 57.06222152709961 C 78.87092590332031 57.58741760253906 78.87092590332031 58.43307113647461 79.38721466064453 58.94936370849609 L 85.05754089355469 64.61968994140625 C 85.57382965087891 65.13597869873047 86.41949462890625 65.13597869873047 86.94468688964844 64.61968994140625 L 92.60610961914062 58.94936370849609 Z" fill="#393939" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.0, -1.0, 1.0, 0.0, 288.33, 790.0)" d="M 92.60610961914062 58.94936370849609 C 93.13130187988281 58.43307113647461 93.13130187988281 57.58741760253906 92.60610961914062 57.06222152709961 C 92.08090209960938 56.54593276977539 91.23526763916016 56.54593276977539 90.71896362304688 57.06222152709961 L 86.00110626220703 61.78007888793945 L 81.27435302734375 57.06222152709961 C 80.75807189941406 56.54593276977539 79.91241455078125 56.54593276977539 79.38721466064453 57.06222152709961 C 78.87092590332031 57.58741760253906 78.87092590332031 58.43307113647461 79.38721466064453 58.94936370849609 L 85.05754089355469 64.61968994140625 C 85.57382965087891 65.13597869873047 86.41949462890625 65.13597869873047 86.94468688964844 64.61968994140625 L 92.60610961914062 58.94936370849609 Z" fill="#393939" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.0, -1.0, 1.0, 0.0, 288.33, 430.0)" d="M 92.60610961914062 58.94936370849609 C 93.13130187988281 58.43307113647461 93.13130187988281 57.58741760253906 92.60610961914062 57.06222152709961 C 92.08090209960938 56.54593276977539 91.23526763916016 56.54593276977539 90.71896362304688 57.06222152709961 L 86.00110626220703 61.78007888793945 L 81.27435302734375 57.06222152709961 C 80.75807189941406 56.54593276977539 79.91241455078125 56.54593276977539 79.38721466064453 57.06222152709961 C 78.87092590332031 57.58741760253906 78.87092590332031 58.43307113647461 79.38721466064453 58.94936370849609 L 85.05754089355469 64.61968994140625 C 85.57382965087891 65.13597869873047 86.41949462890625 65.13597869873047 86.94468688964844 64.61968994140625 L 92.60610961914062 58.94936370849609 Z" fill="#393939" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.0, -1.0, 1.0, 0.0, 288.33, 310.0)" d="M 92.60610961914062 58.94936370849609 C 93.13130187988281 58.43307113647461 93.13130187988281 57.58741760253906 92.60610961914062 57.06222152709961 C 92.08090209960938 56.54593276977539 91.23526763916016 56.54593276977539 90.71896362304688 57.06222152709961 L 86.00110626220703 61.78007888793945 L 81.27435302734375 57.06222152709961 C 80.75807189941406 56.54593276977539 79.91241455078125 56.54593276977539 79.38721466064453 57.06222152709961 C 78.87092590332031 57.58741760253906 78.87092590332031 58.43307113647461 79.38721466064453 58.94936370849609 L 85.05754089355469 64.61968994140625 C 85.57382965087891 65.13597869873047 86.41949462890625 65.13597869873047 86.94468688964844 64.61968994140625 L 92.60610961914062 58.94936370849609 Z" fill="#393939" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
