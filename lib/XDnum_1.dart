import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XDnum_1 extends StatelessWidget {
  XDnum_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0x14656d74),
                offset: Offset(0, 5),
                blurRadius: 12,
              ),
            ],
          ),
        ),
        Pinned.fromPins(
          Pin(start: 9.1, end: 9.1),
          Pin(size: 1.0, middle: 0.7908),
          child: SvgPicture.string(
            _svg_f82vuw,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

const String _svg_f82vuw =
    '<svg viewBox="9.1 34.8 26.8 1.0" ><path transform="translate(258.12, -454.71)" d="M -248.9999694824219 489.5006713867188 L -222.2330322265625 489.5006713867188" fill="none" stroke="#babdbf" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
