import 'package:flutter/material.dart';

import '../../../constants/env_consts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: EnvConsts.appBarGradient,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 42,
                margin: const EdgeInsets.only(
                  left: 15,
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search TechBuy",
                      prefixIcon: InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 23,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(top: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.mic,
                color: Colors.black,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
