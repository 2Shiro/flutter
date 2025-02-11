import 'package:class_f_story/data/_vm/post_list_view_model.dart';
import 'package:class_f_story/data/model/post_list.dart';
import 'package:class_f_story/ui/pages/post/list_page/widgets/post_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../detail_page/post_detail_page.dart';

class PostListBody extends ConsumerWidget {
  const PostListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 상태 구독
    PostList? model = ref.watch(postListProvider);
    // ViewModel 인스턴스 들고 오기
    PostListViewModel vm = ref.read(postListProvider.notifier);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SmartRefresher(
        controller: vm.refreshController,
        enablePullUp: true, // 아래로 스크롤하여 다음 페이지 로드 가능
        onRefresh: () async => await vm.init(), // 새로고침 동작
        enablePullDown: true, // 위로 당겨서 새로고침 가능
        onLoading: () async => vm.nextList(),
        child: ListView.separated(
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      // 자연스로운 애니메이션 추가
                      // 게시글 post id 추출해 보자.
                      MaterialPageRoute(
                        builder: (context) => PostDetailPage(
                          postId: model.posts[index].id!,
                        ),
                      ),
                    );
                  },
                  child: PostListItem(
                    model.posts[index],
                  ),
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: model.posts.length),
      );
    }
  }
}
