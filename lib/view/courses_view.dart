import 'package:assessment/utils/custom_color.dart';
import 'package:assessment/utils/custom_style.dart';
import 'package:assessment/widgets/custom_size.dart';
import 'package:assessment/widgets/textfields/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../model/products.dart';
import '../utils/strings.dart';
import '../view_model/courses_view_model.dart';
import '../widgets/shimmer_card.dart';
import '../widgets/star_rating.dart';
import '../widgets/textlabels/text_lable_widget.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final coursesViewModel = Provider.of<CoursesViewModel>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0XFFf6f9fa),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.white,
        title: Image.asset("assets/images/courses.png", width: 130,),
      ),
      body: coursesViewModel.isStart
          ? ShimmerCard(8) // Show shimmer effect while data is being loaded
          : coursesViewModel.data.isNotEmpty
          ? ListView.builder(
        controller: Provider.of<CoursesViewModel>(context).scrollController,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: coursesViewModel.data.length + 1, // Add one for loading indicator
        itemBuilder: (context, index) {
          if (index < coursesViewModel.data.length) {
            // Display product card for existing products
            Product product = coursesViewModel.data[index];
            return Column(
              children: [
                if (index == 0) ...[
                  // Show label indicating the number of courses
                  CustomSize.heightBetween(),
                  SearchTextFieldWidget(
                    name: Strings.searchLabel, // Input field name
                    controller: coursesViewModel.searchParams, // Controller for email input
                    hintText: Strings.searchLabel, // Hint text
                    icon: Icons.search, // Icon
                    onChanged: (val) {
                      coursesViewModel.notifyListeners();
                    },
                  ),
                  TextLabelWidget(
                    text: "Showing ${coursesViewModel.data.length} Courses",
                  ),
                ],
                if(product.title.toLowerCase().contains(coursesViewModel.searchParams.text.toLowerCase()))
                Container(
                  height: 120,
                  child: Card(
                    margin: EdgeInsets.symmetric(
                        vertical: 4, horizontal: width * 0.04),
                    elevation: 0,
                    color: CustomColor.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              product.image,
                              height: 100.0,
                              width: 100.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Display product title
                                Text(
                                  product.title,
                                  style: CustomStyle.cardHeadingStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8), // Add spacing
                                // Display product category
                                Text(
                                  product.category,
                                  style: CustomStyle.cardSubHeadingStyle,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Display star rating
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        StarRating(
                                          rating: double.parse(
                                              product.rating['rate']
                                                  .toString()),
                                        ),
                                        SizedBox(width: 5), // Add spacing
                                        // Display rating count
                                        Text(
                                          '(${product.rating['rate']}) (${product.rating['count']})',
                                          style: CustomStyle.ratingStyle,
                                        ),
                                      ],
                                    ),
                                    // Display product price
                                    Text(
                                      '\$${product.price}',
                                      style: CustomStyle.textLabelStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return coursesViewModel.isLoading
                ? ShimmerCard(2) // Show shimmer effect for loading indicator
                : Container(); // Return an empty container if not loading
          }
        },
      )
          : const Center(
        // Display a message when no courses are available
        child: Text(
          'No courses available',
          style: TextStyle(fontSize: 16),
        ),
      ),
      );
  }
}
