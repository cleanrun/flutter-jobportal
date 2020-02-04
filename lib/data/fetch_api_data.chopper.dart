// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_api_data.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$FetchApiData extends FetchApiData {
  _$FetchApiData([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FetchApiData;

  @override
  Future<Response<BuiltList<BuiltPost>>> getPosts() {
    final $url = '/posts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<BuiltPost>, BuiltPost>($request);
  }

  @override
  Future<Response<BuiltPost>> getPost(int id) {
    final $url = '/posts/$id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltPost, BuiltPost>($request);
  }

  @override
  Future<Response<BuiltPost>> postPost(BuiltPost body) {
    final $url = '/posts';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<BuiltPost, BuiltPost>($request);
  }
}
