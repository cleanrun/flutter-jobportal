import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:job_portal/models/built_post.dart';

part 'serializers.g.dart';

@SerializersFor(const [BuiltPost])
final Serializers serializer = (_$serializer.toBuilder()..addPlugin(StandardJsonPlugin())).build();