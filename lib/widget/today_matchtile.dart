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
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.black38,
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100,
                  child: Text(
                    tema1 ?? "",overflow: TextOverflow.fade,maxLines: 1,softWrap: false,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  height: 32,width: 32,
                  // color: Colors.white24,
                  child: Image.network(tema1img ?? "", height: 32, width: 32),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 5),
          Container(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            height: 25,width: 35,
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Color(0xff00C566).withOpacity(0.4),
              borderRadius: BorderRadius.circular(14),
              // border: Border.all(color: Color(0xff00C566), width: 0.8),
            ),
            child: Text(
              minuteNumber ?? "",
              style: TextStyle(fontSize: 10, color: Color(0xff00C566),),
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Container(
            width: 30,
            decoration: BoxDecoration(
              // color: Colors.black38,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(tema2img ?? "", height: 32, width: 32),
                Container(width: 100,
                  child: Text(
                        tema2 ?? "",overflow: TextOverflow.fade,maxLines: 1,softWrap: false,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                      ),
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
