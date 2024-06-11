import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CustomShimmerEffect{
  Shimmer shimmerForSearch(){
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        enabled:true,
        direction: ShimmerDirection.ltr,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            ListTile(

              leading: Container(
                height: 50,
                width: 50,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),

              ),
              title: Container(
                height: 10,
                width: 30,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 10,
                      width: 50,
                      color: Colors.white,
                    )

                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 10,
                      width: 50,
                      color: Colors.white,
                    )

                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 10,
                      width: 50,
                      color: Colors.white,
                    )

                  ],
                ),
              ],
            ),

          ],
        )

    );
  }
  Shimmer shimmerForRequestScreen(){
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        enabled:true,
        direction: ShimmerDirection.ltr,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            ListTile(

              leading: Container(
                height: 50,
                width: 50,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),

              ),
              title: Container(
                height: 10,
                width: 10,
                color: Colors.white,
              ),
              subtitle: Container(
                height: 10,
                width: 30,
                color: Colors.white,
              ),
            ),


          ],
        )

    );
  }
  static Shimmer shimmerForProfile(){
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        enabled:true,
        direction: ShimmerDirection.ltr,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            ListTile(

              leading: Container(
                height: 15.h,
                width: 22.w,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),

              ),
              title: Container(
                height: 10,
                width: 10,
                color: Colors.white,
              ),
              subtitle: Container(
                height: 10,
                width: 30,
                color: Colors.white,
              ),
            ),


          ],
        )

    );
  }

  Shimmer shimmerForMyRequest(){
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        enabled:true,
        direction: ShimmerDirection.ltr,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            ListTile(

              leading: Container(
                height: 50,
                width: 50,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),

              ),
              title: Container(
                height: 10,
                width: 10,
                color: Colors.white,
              ),
              subtitle: Container(
                height: 10,
                width: 30,
                color: Colors.white,
              ),
            ),


          ],
        )

    );
  }
  static Shimmer shimmerForLoadingMainPage(){
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        enabled:true,
        direction: ShimmerDirection.ltr,
        highlightColor: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              height: 30,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
              ),
            ),
            Container(
              height: 50,
              width: 50,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
              ),

            ),


          ],
        )

    );
  }
  static Shimmer shimmerForLoadingPost(){
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        enabled:true,
        direction: ShimmerDirection.ltr,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            ListTile(

              leading: Container(
                height: 50,
                width: 50,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),

              ),
              title: Container(
                height: 10,
                width: 10,
                color: Colors.white,
              ),
              subtitle: Container(
                height: 10,
                width: 30,
                color: Colors.white,
              ),
            ),
            Container(
              height: 200,
              width: 300,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),

            )


          ],
        )

    );
  }

  static Shimmer shimmerForCircularPic(){
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      enabled:true,
      direction: ShimmerDirection.ltr,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height:60,
        width: 60,

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),

      ),

    );
  }
  static Shimmer shimmerForRectangularPic(){
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      enabled:true,
      direction: ShimmerDirection.ltr,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 20.h,
        width: 40.w,

        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)
        ),

      ),

    );
  }

}