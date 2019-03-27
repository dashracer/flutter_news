import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTOpIds returns a list of ids', () async {
    // setup of test case
    final newsApi = NewsApiProvider();

    // this will be called if our app make api request
    // replace client on NewsApiProvider wiht mock client
    newsApi.client = MockClient((request) async {
      return Response(
        json.encode([1, 2, 3, 4]),
        200,
      );
    });

    
    final ids = await newsApi.fetchTopIds();

    // expectation
    expect(ids, [1, 2, 3, 4]);
  });
}
