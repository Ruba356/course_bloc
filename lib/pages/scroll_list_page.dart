import 'package:course/bloc/data_bloc.dart';
import 'package:course/bloc/data_freezed/data_freezed_bloc.dart';
import 'package:course/bloc/internet_bloc.dart';
import 'package:course/bloc/scroll_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollListPage extends StatefulWidget {
  const ScrollListPage({Key? key}) : super(key: key);

  @override
  State<ScrollListPage> createState() => _ScrollListPageState();
}

class _ScrollListPageState extends State<ScrollListPage> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= (maxScroll * 0.9)) {
      context.read<ScrollListBloc>().add(GetPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ScrollListBloc, ScrollListState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.success:
              if (state.posts.isEmpty) {
                return const Center(child: Text("No Posts"));
              }
              return ListView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedMax
                    ? state.posts.length
                    : state.posts.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.posts.length
                      ? const Center(child: CircularProgressIndicator())
                      : ListTile(
                          leading: Text(state.posts[index].id.toString()),
                          title: Text(state.posts[index].title.toString()),
                        );
                },
              );
            case PostStatus.error:
              return Center(child: Text(state.errorMessage));
          }
        },
      ),
    );
  }
}
