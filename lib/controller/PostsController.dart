// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:posts_app/common/api.dart';
import 'package:posts_app/model/PostsModel.dart';

class PostsController extends GetxController {
  List<Post> posts = [];
  List<Post> myPosts = [];

  Future<List> fetchData() async {
    await Api().getData().then((apiData) {
      posts.addAll(apiData.map((onePost) => Post.fromJson(onePost)));
      posts.shuffle();
    });

    return posts;
  }

  addPost(Post myPost) {
    myPosts.add(myPost);
    update();
  }

  deletePost(int id) {
    myPosts.removeWhere((element) => element.id == id);
    posts.removeWhere((element) => element.id == id);
    update();
  }
}
