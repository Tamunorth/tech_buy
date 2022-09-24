import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_buy/features/admin/screens/add_products_screen.dart';
import 'package:tech_buy/router.dart';

import '../../../common/widgets/single_product.dart';
import '../bloc/admin_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<AdminBloc>().add(GetAllProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    var productList = context.watch<AdminBloc>().productList?.data;
    return BlocConsumer<AdminBloc, AdminState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      if (state is ErrorState) {
        return Scaffold(
          body: Container(
            child: Text('No products found'),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      }

      if (state is LoadingState) {
        return Center(child: CircularProgressIndicator());
      }

      if (state is SuccessState) {
        if (state.result?.data?.isEmpty ?? true) {
          return Scaffold(
            body: Center(child: Text('Empty')),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Routers.pushNamed(AddProductsScreen.routeName, context);
              },
              tooltip: 'Add a Product',
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: productList?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 130.0,
                        child: SingleProduct(
                            image: productList![index].images!.first),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              productList[index].name!,
                              maxLines: 2,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<AdminBloc>().add(
                                    DeleteProductEven(
                                      productList[index].id.toString(),
                                    ),
                                  );
                            },
                            icon: Icon(Icons.delete_outline),
                          ),
                        ],
                      )
                    ],
                  );
                }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Routers.pushNamed(AddProductsScreen.routeName, context);
            },
            tooltip: 'Add a Product',
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      }
      return Scaffold();
    });
  }
}
