import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class DataUpdate {

  late WebSocketChannel channel;
  String baseurl = "ws://192.168.0.1:81";

  Future<String> channelConnect() async {
    final wsUrl = Uri.parse(baseurl);
    channel = WebSocketChannel.connect(wsUrl);

    channel.stream.listen((message) {
      final response = jsonDecode(message);

      String body = response['data']['message'];

      if (body == "connected") {
        channel.sink.add('home');
        print(">>>>>>>>>>>>>>>>" + message);

        /*  Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen()));*/
      } else if (body == "homeData") {
        print(">>>>>>>>>>>>>>>>" + message);
        final response = jsonDecode(message);
        final value = response['data']['value'];
        String laserValue = value['DutyCycle'].toString();
        print(">>>>>>>>>>>>>>>>" + laserValue);
      }

      // channel.sink.add('received!');
      //channel.sink.close(status.goingAway);
    });

    return "param";
  }

  Future<String> postData(Map<String, dynamic> json) async {

    print(json);

    final wsUrl = Uri.parse(baseurl);
    channel = WebSocketChannel.connect(wsUrl);

    channel.stream.listen((message) {
      final response = jsonDecode(message);

      String body = response['data']['message'];

      if (body == "connected") {
        channel.sink.add(json);
        print(">>>>>>>>>>>>>>>>" + message);
      }

      // channel.sink.add('received!');
      //channel.sink.close(status.goingAway);
    });

    return "param";
  }

  Future<String> getData(Map<String, dynamic> json) async {

    print(json);

    final wsUrl = Uri.parse(baseurl);
    channel = WebSocketChannel.connect(wsUrl);

    channel.stream.listen((message) {
      final response = jsonDecode(message);

      String body = response['data']['message'];

      if (body == "connected") {
        channel.sink.add(json);
        print(">>>>>>>>>>>>>>>>" + message);
      }

      // channel.sink.add('received!');
      //channel.sink.close(status.goingAway);
    });

    return "param";
  }
}
