import 'package:flutter/material.dart';
import './XD_RoomAdminindividual.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XD_RoomAdminMenu extends StatelessWidget {
  XD_RoomAdminMenu({
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
              '部屋管理メニュー',
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
            offset: Offset(0.0, 130.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_RoomAdminindividual(),
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
            offset: Offset(50.0, 150.0),
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
            offset: Offset(0.0, 190.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_RoomAdminindividual(),
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
            offset: Offset(50.0, 210.0),
            child: Text(
              'Room 2',
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
            offset: Offset(12.5, 155.0),
            child: SvgPicture.string(
              _svg_l1u87t,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_l1u87t =
    '<svg viewBox="12.5 155.0 350.0 76.0" ><path transform="translate(12.5, 190.0)" d="M 0 0 L 350 0" fill="none" stroke="#e0e0e0" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.0, -1.0, 1.0, 0.0, 288.33, 248.0)" d="M 92.60610961914062 58.94936370849609 C 93.13130187988281 58.43307113647461 93.13130187988281 57.58741760253906 92.60610961914062 57.06222152709961 C 92.08090209960938 56.54593276977539 91.23526763916016 56.54593276977539 90.71896362304688 57.06222152709961 L 86.00110626220703 61.78007888793945 L 81.27435302734375 57.06222152709961 C 80.75807189941406 56.54593276977539 79.91241455078125 56.54593276977539 79.38721466064453 57.06222152709961 C 78.87092590332031 57.58741760253906 78.87092590332031 58.43307113647461 79.38721466064453 58.94936370849609 L 85.05754089355469 64.61968994140625 C 85.57382965087891 65.13597869873047 86.41949462890625 65.13597869873047 86.94468688964844 64.61968994140625 L 92.60610961914062 58.94936370849609 Z" fill="#393939" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.0, -1.0, 1.0, 0.0, 288.33, 310.0)" d="M 92.60610961914062 58.94936370849609 C 93.13130187988281 58.43307113647461 93.13130187988281 57.58741760253906 92.60610961914062 57.06222152709961 C 92.08090209960938 56.54593276977539 91.23526763916016 56.54593276977539 90.71896362304688 57.06222152709961 L 86.00110626220703 61.78007888793945 L 81.27435302734375 57.06222152709961 C 80.75807189941406 56.54593276977539 79.91241455078125 56.54593276977539 79.38721466064453 57.06222152709961 C 78.87092590332031 57.58741760253906 78.87092590332031 58.43307113647461 79.38721466064453 58.94936370849609 L 85.05754089355469 64.61968994140625 C 85.57382965087891 65.13597869873047 86.41949462890625 65.13597869873047 86.94468688964844 64.61968994140625 L 92.60610961914062 58.94936370849609 Z" fill="#393939" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
