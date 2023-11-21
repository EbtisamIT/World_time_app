import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String flag;
  String url;
  String time="";
  String place="";
  bool isDayTime=true;
  WorldTime({required this.location, required this.flag, required this.url ,required this.place}  );


  Future<void> getTime() async{
    try{
    Response respone= await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data= jsonDecode(respone.body);
    String datetime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);
    DateTime now= DateTime.parse(datetime);
    now=now.add((Duration(hours: int.parse(offset))));
    time=DateFormat.jm().format(now);
    isDayTime =now.hour>6 &&now.hour<20 ? true : false;
    }


  catch(e){
      print('Caught error: $e');
      time="error in returnning time data";
  }
  }}

