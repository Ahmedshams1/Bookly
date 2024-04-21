import 'package:bookly/Features/home/data/presentation/maneger/newset_book_cubit/newset_book_cubit.dart';
import 'package:bookly/Features/home/data/presentation/views/widgets/Book_item_list_view.dart';
import 'package:bookly/core/widget/custom_err_widget.dart';
import 'package:bookly/core/widget/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBookCubit, NewsetBookState>(
      builder: (context, state) {
        if (state is NewsetBookSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookItemListView(
                    bookModel: state.books[index],
                  ),
                );
              });
        } else if (state is NewsetBookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
