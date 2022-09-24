import 'dart:io';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_buy/common/widgets/custom_button.dart';
import 'package:tech_buy/common/widgets/custom_textfield.dart';
import 'package:tech_buy/features/admin/models/add_product/add_product_req.dart';
import 'package:tech_buy/features/home/widgets/carousel_image.dart';
import 'package:tech_buy/router.dart';
import 'package:tech_buy/utils/app_dialogs.dart';
import 'package:tech_buy/utils/image_picker_util.dart';
import 'package:tech_buy/utils/validation_helpers.dart';

import '../../../constants/env_consts.dart';
import '../bloc/admin_bloc.dart';

class AddProductsScreen extends StatefulWidget {
  static const String routeName = 'add-product-screen';

  const AddProductsScreen({Key? key}) : super(key: key);

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController quantityCtrl = TextEditingController();

  final List<String> items = [
    'Mobile',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose

    nameCtrl.dispose();

    descriptionCtrl.dispose();
    priceCtrl.dispose();
    quantityCtrl.dispose();
    super.dispose();
  }

  List<File> images = [];

  selectImages() async {
    try {
      var result = await ImagePickerUtil.pickImages();
      setState(() {
        images = result;
      });
    } catch (e) {
      TechBuy.showSnackBar(context, "Failed to Pick Images");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBloc, AdminState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: EnvConsts.appBarGradient,
                ),
              ),
              title: Text(
                "Add Products",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  images.isNotEmpty
                      ? CarouselImage(
                          imageList: images,
                        )
                      : DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          dashPattern: [10, 5],
                          child: GestureDetector(
                            onTap: selectImages,
                            child: Container(
                              height: 150,
                              width: window.physicalSize.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Text(
                                      'Select Product Images',
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  25.verticalSpace,
                  TextBoxField(
                    controller: nameCtrl,
                    hintText: 'Product Name',
                    validator: FieldValidators.notEmptyValidator,
                  ),
                  10.verticalSpace,
                  TextBoxField(
                    maxLines: 10,
                    controller: descriptionCtrl,
                    hintText: 'Description',
                    validator: FieldValidators.notEmptyValidator,
                  ),
                  10.verticalSpace,
                  TextBoxField(
                    controller: priceCtrl,
                    hintText: 'Price',
                    validator: FieldValidators.numberValidator,
                  ),
                  10.verticalSpace,
                  TextBoxField(
                    controller: quantityCtrl,
                    hintText: 'Quality',
                    validator: FieldValidators.numberValidator,
                  ),
                  20.verticalSpace,
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: const [
                            Icon(
                              Icons.list,
                              size: 16,
                              color: Colors.black38,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Select Item Category',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black87,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.black38,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 50,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.black26,
                          ),
                          color: Colors.transparent,
                        ),
                        // buttonElevation: 2,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 4,
                        scrollbarAlwaysShow: true,
                      ),
                    ),
                  ),
                  50.verticalSpace,
                  BlocListener<AdminBloc, AdminState>(
                    listener: (context, state) {
                      // TODO: implement listener

                      if (state is LoadingState) {}
                      if (state is ErrorState) {
                        TechBuy.showSnackBar(context, state.message,
                            type: SnackType.error);
                      }
                      if (state is SuccessState) {
                        Routers.pop(context);
                        TechBuy.showSnackBar(
                            context, "Product added Successfully",
                            type: SnackType.success);
                      }
                    },
                    child: CustomTextButton(
                      isLoading: state is LoadingState,
                      text: "Sell",
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          context.read<AdminBloc>().add(
                                AddProductEvent(
                                  AdminProductReq(
                                    name: nameCtrl.text,
                                    description: descriptionCtrl.text,
                                    price: double.parse(priceCtrl.text),
                                    quantity: double.parse(quantityCtrl.text),
                                    category: selectedValue.toString(),
                                    imageFiles: images,
                                  ),
                                ),
                              );

                          setState(() {});
                        }
                      },
                    ),
                  ),
                  50.verticalSpace,
                  50.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
