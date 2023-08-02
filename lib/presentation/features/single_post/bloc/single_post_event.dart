import 'package:flutter/material.dart';

@immutable
sealed class SinglePostEvent {}

final class GetSinglePostEvent extends SinglePostEvent {
  final int? id;
  GetSinglePostEvent({required this.id});
}

