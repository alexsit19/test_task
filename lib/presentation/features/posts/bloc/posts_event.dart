import 'package:flutter/cupertino.dart';

@immutable
sealed class PostsEvent {}

final class GetPostsEvent extends PostsEvent {}
