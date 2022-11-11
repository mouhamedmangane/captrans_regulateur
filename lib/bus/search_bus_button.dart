import 'package:flutter/material.dart';
import 'package:noppal_util/ui/link/searchLInk.dart';

class SearchBusButton extends StatelessWidget {
  const SearchBusButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned  : true,
      //floating: true,
      delegate: _Delegate()
    );
  }
}


class _Delegate extends SliverPersistentHeaderDelegate {
  _Delegate();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return  SearchLInk("Recherche bus",
      leading: Padding(
        padding: EdgeInsets.only(right: 25),
        child: Icon(Icons.search,color: Colors.white,),
      ),
      background: Colors.blue,
      textColor: Colors.white,
      borderColor: Colors.blue.shade700,
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}