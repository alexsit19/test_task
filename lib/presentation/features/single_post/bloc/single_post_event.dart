import 'package:equatable/equatable.dart';

class SinglePostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPost extends SinglePostEvent {
  final int? id;

  GetPost({required this.id});
}
