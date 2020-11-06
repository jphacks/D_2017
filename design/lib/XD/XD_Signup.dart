import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './XD_EnterAuthcode.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XD_Signup extends StatelessWidget {
  XD_Signup({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
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
          Container(),
          Container(),
          Transform.translate(
            offset: Offset(30.0, 101.0),
            child: Text(
              'アカウント登録',
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
            offset: Offset(82.0, 241.0),
            child: Text(
              'Mail Address',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 16,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(82.0, 301.0),
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 16,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 240.0),
            child:
                // Adobe XD layer: 'Free Mail icon' (group)
                SizedBox(
              width: 25.0,
              height: 19.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(22.0, 5.2, 3.3, 6.2),
                    size: Size(25.3, 19.0),
                    pinRight: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_w2s7fu,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 5.2, 3.3, 6.2),
                    size: Size(25.3, 19.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_ca7ikg,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 9.4, 25.3, 9.6),
                    size: Size(25.3, 19.0),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_jv16te,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 25.3, 13.2),
                    size: Size(25.3, 19.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_951p1o,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(44.0, 300.0),
            child:
                // Adobe XD layer: 'key icon' (group)
                SizedBox(
              width: 19.0,
              height: 19.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 19.3, 19.0),
                    size: Size(19.3, 19.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_w0vg0g,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(37.5, 265.5),
            child: SvgPicture.string(
              _svg_satdzr,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(114.0, 451.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XD_EnterAuthcode(),
                ),
              ],
              child: Container(
                width: 147.0,
                height: 43.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xff459cf4),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(172.0, 465.0),
            child: Text(
              '登録',
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
            offset: Offset(47.0, 371.0),
            child: Container(
              width: 13.0,
              height: 13.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(82.0, 370.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 16,
                  color: const Color(0xff0046b5),
                ),
                children: [
                  TextSpan(
                    text: '利用規約',
                  ),
                  TextSpan(
                    text: 'に同意します',
                    style: TextStyle(
                      color: const Color(0xff000000),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(82.0, 180.0),
            child: Text(
              'Name',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 16,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(37.5, 204.5),
            child: SvgPicture.string(
              _svg_rf605q,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 178.8),
            child:
                // Adobe XD layer: 'People icon' (group)
                SizedBox(
              width: 13.0,
              height: 19.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(1.4, 0.0, 9.8, 9.9),
                    size: Size(12.7, 19.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_i3uaso,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 10.4, 12.7, 8.6),
                    size: Size(12.7, 19.0),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_4flkg0,
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

const String _svg_w2s7fu =
    '<svg viewBox="22.0 68.8 3.3 6.2" ><path transform="translate(-423.91, -100.85)" d="M 449.181396484375 175.7990112304688 L 445.9199829101562 172.4112548828125 L 449.181396484375 169.6000061035156 L 449.181396484375 175.7990112304688 Z" fill="#4b4b4b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ca7ikg =
    '<svg viewBox="0.0 68.8 3.3 6.2" ><path transform="translate(0.0, -100.85)" d="M 3.265364646911621 172.4112548828125 L 0 175.8029479980469 L 0 169.6000061035156 L 3.265364646911621 172.4112548828125 Z" fill="#4b4b4b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jv16te =
    '<svg viewBox="0.0 73.0 25.3 9.6" ><path transform="translate(0.0, -181.92)" d="M 25.27005195617676 259.9488525390625 L 25.27005195617676 263.068115234375 C 25.27005195617676 263.822265625 24.65804290771484 264.434326171875 23.90388870239258 264.434326171875 L 1.366162419319153 264.434326171875 C 0.6119597554206848 264.434326171875 0 263.8223266601562 0 263.068115234375 L 0 259.9488525390625 L 4.884177684783936 254.8789978027344 L 10.46338081359863 259.6842041015625 C 11.04380226135254 260.1818237304688 11.81369972229004 260.4581909179688 12.63502597808838 260.4581909179688 C 13.45635223388672 260.4581909179688 14.23019886016846 260.1818237304688 14.81062030792236 259.6842041015625 L 20.38577651977539 254.8789978027344 L 25.27005195617676 259.9488525390625 Z" fill="#4b4b4b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_951p1o =
    '<svg viewBox="0.0 63.5 25.3 13.2" ><path  d="M 25.27005195617676 64.88121795654297 L 25.27005195617676 66.24737548828125 L 13.35354423522949 76.51334381103516 C 12.97054386138916 76.84500885009766 12.29935836791992 76.84500885009766 11.91635894775391 76.51334381103516 L 0 66.24737548828125 L 0 64.88121795654297 C 0 64.12711334228516 0.6119104027748108 63.51900482177734 1.366162419319153 63.51900482177734 L 23.90388870239258 63.51900482177734 C 24.65804290771484 63.51900482177734 25.27005195617676 64.12711334228516 25.27005195617676 64.88121795654297 Z" fill="#4b4b4b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w0vg0g =
    '<svg viewBox="0.0 3.6 19.3 19.0" ><path transform="translate(0.0, 0.0)" d="M 18.97674369812012 11.00501251220703 L 11.91527843475342 3.943580627441406 C 11.49824333190918 3.526545524597168 10.79122638702393 3.550638675689697 10.34475326538086 3.997111797332764 L 7.096076011657715 7.245789527893066 C 6.649641036987305 7.692224979400635 6.354350090026855 8.546924591064453 6.440822124481201 9.144543647766113 L 7.089600086212158 13.64902973175049 L 4.355609893798828 16.38301849365234 C 4.24384069442749 16.49478912353516 4.023276805877686 16.5930061340332 3.865618467330933 16.60185241699219 L 3.000943422317505 16.65301322937012 C 2.843284845352173 16.66242027282715 2.715666770935059 16.79949188232422 2.717436790466309 16.95710945129395 L 2.727450132369995 17.72003173828125 C 2.729822397232056 17.87768936157227 2.602166414260864 18.0100154876709 2.44394326210022 18.0141544342041 L 1.631030440330505 18.03414535522461 C 1.472807049751282 18.03768157958984 1.356332421302795 18.16944122314453 1.371052026748657 18.32649612426758 L 1.434597373008728 18.98999786376953 C 1.449880957603455 19.14765357971191 1.333406567573547 19.28761863708496 1.176388144493103 19.30173683166504 L 0.2593860626220703 19.38467025756836 C 0.1017274782061577 19.39938926696777 -0.0141447652131319 19.53935050964355 0.001741554704494774 19.69701194763184 L 0.266425758600235 22.39102363586426 C 0.281709760427475 22.54808235168457 0.4228795766830444 22.66218376159668 0.5799358487129211 22.64396286010742 L 2.649260759353638 22.4051399230957 C 2.805714845657349 22.38748741149902 3.025714159011841 22.28102493286133 3.136881113052368 22.16925811767578 L 9.449548721313477 15.8571891784668 L 13.77582168579102 16.4801082611084 C 14.37344169616699 16.56597518920898 15.22810363769531 16.27068901062012 15.67457389831543 15.82425022125244 L 18.92325019836426 12.57557201385498 C 19.36964988708496 12.12906360626221 19.39438247680664 11.42204761505127 18.97674369812012 11.00501251220703 Z M 15.14159297943115 11.94143867492676 L 14.17753601074219 12.90549564361572 C 13.95343399047852 13.130202293396 13.58872509002686 13.12960052490234 13.36522483825684 12.90549564361572 L 10.01479244232178 9.555667877197266 C 9.790690422058105 9.331564903259277 9.790690422058105 8.967459678649902 10.01479244232178 8.743356704711914 L 10.97945308685303 7.778695583343506 C 11.20355701446533 7.553991794586182 11.56766033172607 7.555158615112305 11.79176330566406 7.778695583343506 L 15.14159297943115 11.12912845611572 C 15.36573219299316 11.35323238372803 15.36629581451416 11.7173376083374 15.14159297943115 11.94143867492676 Z" fill="#4b4b4b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_satdzr =
    '<svg viewBox="37.5 265.5 300.0 60.0" ><path transform="translate(37.5, 265.5)" d="M 0 0 L 300 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(37.5, 325.5)" d="M 0 0 L 300 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i3uaso =
    '<svg viewBox="86.1 0.0 9.8 9.9" ><path transform="translate(-37.3, 0.0)" d="M 128.2772979736328 9.859047889709473 C 130.9945220947266 9.859047889709473 133.1976318359375 7.652032852172852 133.1976318359375 4.929523944854736 C 133.1976318359375 2.207794904708862 130.9945220947266 0 128.2772979736328 0 C 125.559700012207 0 123.3569946289062 2.207794904708862 123.3569946289062 4.929523944854736 C 123.3569946289062 7.652032375335693 125.559700012207 9.859047889709473 128.2772979736328 9.859047889709473 Z" fill="#4b4b4b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_4flkg0 =
    '<svg viewBox="84.6 10.4 12.7 8.6" ><path transform="translate(0.0, -271.31)" d="M 97.2806396484375 285.8938598632812 C 97.06088256835938 284.5756225585938 95.9447021484375 282.7534484863281 95.14492034912109 281.9003601074219 C 94.92861938476562 281.6695251464844 94.55310821533203 281.7655639648438 94.42115020751953 281.8473510742188 C 93.41771697998047 282.4668884277344 92.23978424072266 282.828369140625 90.97669982910156 282.828369140625 C 89.71364593505859 282.828369140625 88.53572082519531 282.4668884277344 87.53228759765625 281.8473510742188 C 87.40036010742188 281.7655639648438 87.02481842041016 281.6695251464844 86.8084716796875 281.9003601074219 C 86.00875854492188 282.7534484863281 84.89258575439453 284.5756225585938 84.67279052734375 285.8938598632812 C 84.13277435302734 289.1394653320312 87.59522247314453 290.3121337890625 90.97673797607422 290.3121337890625 C 94.35824584960938 290.3121337890625 97.82069396972656 289.1394653320312 97.2806396484375 285.8938598632812 Z" fill="#4b4b4b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rf605q =
    '<svg viewBox="37.5 204.5 300.0 1.0" ><path transform="translate(37.5, 204.5)" d="M 0 0 L 300 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
