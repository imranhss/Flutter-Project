import 'package:e_commerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/catalog.dart';
import 'package:e_commerce/pages/home_detail_page.dart';
import 'package:e_commerce/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog_image.dart';


class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.item.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.item[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({ Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg.color(context.accentColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      _AddToCart(catalog: catalog) // we need statefull widget for that we extract that
                    ],
                  ).pOnly(right: 8.0)
                ],
              ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

        isAdded = isAdded.toggle();
        final _catalog = CatalogModel(); // whet it run it will create new object every time
        final _cart = CartModel(); // we should stop create new object every time
        _cart.catalog = _catalog; // for that we create a singletone object
       _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
