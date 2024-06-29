import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/core/utils/theme.dart';

class OrderScreen extends StatefulWidget {
  static const String id = 'OrderScreen';

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int quantity = 1;
  double totalPrice = 0.0;
  double pricePerItem = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    quantity = args['quantity'];
    totalPrice = args['totalPrice'];
    pricePerItem = totalPrice / quantity;
  }

  void updateTotalPrice(int newQuantity) {
    setState(() {
      quantity = newQuantity;
      totalPrice = pricePerItem * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: secondGreyColor,
      appBar: AppBar(
        backgroundColor: white,
        title: Text("Confirm Order", style: theme().textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mediaQuery.height * 0.01),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, top: 20, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          "Delivery to",
                          style: theme().textTheme.titleLarge,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.5),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 10),
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/Mini_Map.png",
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        "(323) 238-0678\n909-1/2 E 49th St\nLos Angeles, California(CA), 90011",
                        style: theme().textTheme.labelSmall!.copyWith(
                            color: secondaryColor, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: [
                          SvgPicture.asset("assets/icons/address_icon.svg"),
                          Text(args['partnerDistance'] ?? ''),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.01),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, top: 20, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          args['partnerName'],
                          style: theme().textTheme.titleLarge,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 10),
                    child: ListTile(
                      leading: Image.asset(
                        args['confirmOrderImage'],
                      ),
                      title: Text(
                        args['name'],
                        style: theme().textTheme.labelSmall!.copyWith(
                            color: secondaryColor, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            margin: const EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                                color: greyColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (quantity > 1) {
                                      updateTotalPrice(quantity - 1);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: thirdColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(quantity.toString()),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    updateTotalPrice(quantity + 1);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              '\$ ${totalPrice.toStringAsFixed(2)}',
                              style: theme()
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(thickness: 0.5),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal ($quantity items)',
                          style: theme().textTheme.labelMedium,
                        ),
                        Text("\$${totalPrice.toStringAsFixed(2)}")
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.5),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: theme().textTheme.labelMedium,
                        ),
                        const Text("\$ 0.00")
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.5),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Voucher',
                          style: theme().textTheme.labelMedium,
                        ),
                        const Text("-")
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.5),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 12, bottom: 15, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: theme()
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: secondaryColor),
                        ),
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: theme()
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.01),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: white,
              ),
              child: ListTile(
                leading: Icon(Icons.percent, color: primaryColor, size: 26),
                title: Text(
                  'Add Voucher',
                  style: theme()
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFEBE5).withOpacity(0.3),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Text("Add", style: TextStyle(color: primaryColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
