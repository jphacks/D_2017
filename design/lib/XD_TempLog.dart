import 'package:flutter/material.dart';
import './XD_UserMenu.dart';
import 'package:adobe_xd/page_link.dart';
import './XD_TempLogTempDevice.dart';
import './XD_TempReqest.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XD_TempLog extends StatelessWidget {
  XD_TempLog({
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
            offset: Offset(22.0, 151.0),
            child: Container(
              width: 331.0,
              height: 199.0,
              decoration: BoxDecoration(
                color: const Color(0xffe2fafc),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
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
            offset: Offset(30.0, 101.0),
            child: Text(
              '検温ログ',
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
            offset: Offset(20.0, 60.0),
            child:
                // Adobe XD layer: '戻るボタン' (shape)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_UserMenu(),
                ),
              ],
              child: SvgPicture.string(
                _svg_5dnjim,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 470.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_TempLogTempDevice(),
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
            offset: Offset(50.0, 490.0),
            child: Text(
              'User Device 1',
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
            offset: Offset(0.0, 430.0),
            child: Container(
              width: 375.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: const Color(0xffe0e0e0),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(30.0, 441.0),
            child: Text(
              '機器別検温データ',
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
            offset: Offset(0.0, 530.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_TempLogTempDevice(),
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
            offset: Offset(50.0, 550.0),
            child: Text(
              'User Device 2',
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
            offset: Offset(12.5, 497.0),
            child: SvgPicture.string(
              _svg_d55jov,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 590.0),
            child: Container(
              width: 375.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: const Color(0xffe0e0e0),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(30.0, 601.0),
            child: Text(
              '手動登録',
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
            offset: Offset(0.0, 630.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_TempReqest(),
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
            offset: Offset(345.0, 657.0),
            child: SvgPicture.string(
              _svg_c28rae,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(50.0, 651.0),
            child: Text(
              '体温手動登録',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff000000),
                height: 1.1666666666666667,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_5dnjim =
    '<svg viewBox="20.0 60.0 11.3 19.0" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 87.98, -19.0)" d="M 97.46916961669922 59.76226043701172 C 98.18206787109375 59.06143569946289 98.18206787109375 57.91353225708008 97.46916961669922 57.20061874389648 C 96.75624084472656 56.49979782104492 95.60836029052734 56.49979782104492 94.90752410888672 57.20061874389648 L 88.50341796875 63.60472106933594 L 82.08724975585938 57.20061874389648 C 81.38643646240234 56.49979782104492 80.238525390625 56.49979782104492 79.52561187744141 57.20061874389648 C 78.82479095458984 57.91353225708008 78.82479095458984 59.06143569946289 79.52561187744141 59.76226043701172 L 87.22261047363281 67.45925903320312 C 87.92342376708984 68.16007995605469 89.07134246826172 68.16007995605469 89.78425598144531 67.45925903320312 L 97.46916961669922 59.76226043701172 Z" fill="#ffffff" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d55jov =
    '<svg viewBox="12.5 497.0 350.0 74.0" ><path transform="translate(12.5, 530.0)" d="M 0 0 L 350 0" fill="none" stroke="#e0e0e0" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.0, -1.0, 1.0, 0.0, 288.33, 590.0)" d="M 92.60610961914062 58.94936370849609 C 93.13130187988281 58.43307113647461 93.13130187988281 57.58741760253906 92.60610961914062 57.06222152709961 C 92.08090209960938 56.54593276977539 91.23526763916016 56.54593276977539 90.71896362304688 57.06222152709961 L 86.00110626220703 61.78007888793945 L 81.27435302734375 57.06222152709961 C 80.75807189941406 56.54593276977539 79.91241455078125 56.54593276977539 79.38721466064453 57.06222152709961 C 78.87092590332031 57.58741760253906 78.87092590332031 58.43307113647461 79.38721466064453 58.94936370849609 L 85.05754089355469 64.61968994140625 C 85.57382965087891 65.13597869873047 86.41949462890625 65.13597869873047 86.94468688964844 64.61968994140625 L 92.60610961914062 58.94936370849609 Z" fill="#393939" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.0, -1.0, 1.0, 0.0, 288.33, 650.0)" d="M 92.60610961914062 58.94936370849609 C 93.13130187988281 58.43307113647461 93.13130187988281 57.58741760253906 92.60610961914062 57.06222152709961 C 92.08090209960938 56.54593276977539 91.23526763916016 56.54593276977539 90.71896362304688 57.06222152709961 L 86.00110626220703 61.78007888793945 L 81.27435302734375 57.06222152709961 C 80.75807189941406 56.54593276977539 79.91241455078125 56.54593276977539 79.38721466064453 57.06222152709961 C 78.87092590332031 57.58741760253906 78.87092590332031 58.43307113647461 79.38721466064453 58.94936370849609 L 85.05754089355469 64.61968994140625 C 85.57382965087891 65.13597869873047 86.41949462890625 65.13597869873047 86.94468688964844 64.61968994140625 L 92.60610961914062 58.94936370849609 Z" fill="#393939" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c28rae =
    '<svg viewBox="345.0 657.0 8.3 14.0" ><path transform="matrix(0.0, -1.0, 1.0, 0.0, 288.33, 750.0)" d="M 92.60610961914062 58.94936370849609 C 93.13130187988281 58.43307113647461 93.13130187988281 57.58741760253906 92.60610961914062 57.06222152709961 C 92.08090209960938 56.54593276977539 91.23526763916016 56.54593276977539 90.71896362304688 57.06222152709961 L 86.00110626220703 61.78007888793945 L 81.27435302734375 57.06222152709961 C 80.75807189941406 56.54593276977539 79.91241455078125 56.54593276977539 79.38721466064453 57.06222152709961 C 78.87092590332031 57.58741760253906 78.87092590332031 58.43307113647461 79.38721466064453 58.94936370849609 L 85.05754089355469 64.61968994140625 C 85.57382965087891 65.13597869873047 86.41949462890625 65.13597869873047 86.94468688964844 64.61968994140625 L 92.60610961914062 58.94936370849609 Z" fill="#393939" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
