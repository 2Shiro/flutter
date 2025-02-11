import 'package:class_f_story/data/model/post.dart';

class PostDetail {
  Post post;

  PostDetail({required this.post});

  PostDetail copyWith({Post? post}) {
    return PostDetail(post: post ?? this.post);
  }

  PostDetail.fromMap(Map<String, dynamic> map) : post = Post.fromMap(map);
}
