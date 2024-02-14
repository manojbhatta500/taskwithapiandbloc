import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskapibloc/home/bloc/manager_bloc.dart';
import 'package:taskapibloc/home/ui/widgets/green_text_container.dart';
import 'package:taskapibloc/home/ui/widgets/item_container.dart';
import 'package:taskapibloc/home/ui/widgets/white_text_container.dart';
import 'package:taskapibloc/home/util/util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<ManagerBloc>(context).add(FetchData(userCurrentindex: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<ManagerBloc, DataState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case DataLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case DataFetchedSuccess:
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1000,
                        child: BlocBuilder<ManagerBloc, DataState>(
                          builder: (context, state) {
                            if (state is DataFetchedSuccess) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 45,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.headingList.length,
                                      itemBuilder: (context, index) {
                                        String currentstring =
                                            state.headingList[index];
                                        return index == state.currentIndex
                                            ? GreenTextContainer(
                                                inputKeyword: currentstring)
                                            : GestureDetector(
                                                onTap: () {
                                                  BlocProvider.of<ManagerBloc>(
                                                          context)
                                                      .add(
                                                    FetchData(
                                                        userCurrentindex:
                                                            index),
                                                  );
                                                },
                                                child: WhiteTextContainer(
                                                    inputKeyword:
                                                        currentstring),
                                              );
                                      },
                                    ),
                                  ),
                                  const Divider(),
                                  Flexible(
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10.0,
                                        mainAxisExtent: 220,
                                        childAspectRatio: 2 / 3,
                                      ),
                                      itemCount: state
                                          .dishList[state.currentIndex]
                                          .products!
                                          .length,
                                      itemBuilder: (context, index) {
                                        var product = state
                                            .dishList[state.currentIndex]
                                            .products![index];
                                        return ItemContainer(
                                          image: product.image ?? '',
                                          outofraing:
                                              product.noOfRating?.toInt() ?? 0,
                                          rating: product.rating?.toInt() ??
                                              0, // Convert num to int and provide default value
                                          name: product.name ?? '',
                                          price: product.price?.toInt() ??
                                              0, // Convert num to int and provide default value
                                          underlineprice: product.crossedPrice
                                                  ?.toInt() ??
                                              0, // Convert num to int and provide default value
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Text(
                                  'this else will never happens because of state checking');
                            }
                          },
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                );

              case DataFetchedFailed:
                return Center(
                  child: Text('failed'),
                );
              default:
                return Center(
                  child: Text('Unknown state'),
                );
            }
          },
        ),
      )),
    );
  }
}
