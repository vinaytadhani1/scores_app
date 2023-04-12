import 'package:flutter/material.dart';

class TodayMatchTile extends StatelessWidget {
  final String? tema1;
  final String? tema2;
  final String? tema1img;
  final String? tema2img;
  final String? minuteNumber;
  TodayMatchTile({
    Key? key,
    this.tema1,
    this.tema2,
    this.tema1img,
    this.tema2img,
    this.minuteNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            tema1 ?? "",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          Container(
            height: 35,width: 35,
            // color: Colors.white24,
            child: Image.network(tema1img ?? "", height: 32, width: 32),
          ),
          // Image(image: NetworkImage(tema1??","),height: 32,width: 32,),
          Container(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            height: 25,
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Color(0xff00C566).withOpacity(0.4),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Color(0xff00C566), width: 0.8),
            ),
            child: Text(
              minuteNumber ?? "",
              style: TextStyle(fontSize: 10, color: Color(0xff00C566),),
            ),
          ),
          Text(
            tema2 ?? "",overflow: TextOverflow.clip,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          Image.network(tema2img ?? "", height: 32, width: 32),
        ],
      ),
    );
  }
}
