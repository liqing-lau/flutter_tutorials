part of 'post_bloc.dart';

// When the user scrolls, it will fetch more posts from backend
sealed class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Will be called when UI layer needs more posts
final class PostFetched extends PostEvent {}