import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:youtube_play/models/channel_info.dart';
import '../models/videomodel.dart';
import 'constants.dart';

class Services {
  //
  static const CHANNEL_ID = 'UC5lbdURzjB0irr-FTbjWN1A';
  static const _baseUrl = 'www.googleapis.com';

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': CHANNEL_ID,
      'key': Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
   // print(response.body);
    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

  static Future<VideosList> getVideosList(
      {String? playListId, String? pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playListId!,
      'maxResults': '20',
      'pageToken': pageToken!,
      'key': Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    VideosList videosList = videosListFromJson(response.body);
  //  print(response.body);
    return videosList;
  }
}
