import 'package:equatable/equatable.dart';

// extends eqauatable so that we can compare the difference 
// between 2 Post objects 
final class Post extends Equatable {
  const Post({required this.id, required this.title, required this.body});

  final int id;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, title, body];
}