import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'dart:async';

import 'package:job_portal/models/built_post.dart';
import 'package:built_collection/built_collection.dart';

import 'built_value_converter.dart';

part 'fetch_api_data.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class FetchApiData extends ChopperService{
  @Get()
  Future<Response<BuiltList<BuiltPost>>> getPosts();

  @Get(path: '/{id}')
  Future<Response<BuiltPost>> getPost(@Path('id') int id);

  @Post()
  Future<Response<BuiltPost>> postPost(@Body() BuiltPost body);

  static FetchApiData create(){
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$FetchApiData()
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ]
    );
  }

}

