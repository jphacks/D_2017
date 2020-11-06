import 'package:flutter/material.dart';
import './XD_UserMenu.dart';
import 'package:adobe_xd/page_link.dart';

class XD_Tutorial3 extends StatelessWidget {
  XD_Tutorial3({
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
            offset: Offset(113.0, 663.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_UserMenu(),
                ),
              ],
              child: Container(
                width: 150.0,
                height: 44.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xff459cf4),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(156.0, 677.0),
            child: Text(
              'スタート',
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
            offset: Offset(28.0, 140.0),
            child: Text(
              '入室申請はワンタップ',
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
          Transform.translate(
            offset: Offset(34.4, 572.0),
            child: SizedBox(
              width: 307.0,
              child: Text(
                '管理者から送られてきた\n申請リンクをワンタップするだけで\n簡単に申請完了。',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 16,
                  color: const Color(0xff000000),
                  height: 1.25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(44.0, 192.0),
            child: Container(
              width: 288.0,
              height: 360.0,
              decoration: BoxDecoration(
                color: const Color(0xffd6d6d6),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
