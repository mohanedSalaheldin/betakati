import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:new_app0820/modules/web_view/wen_view.dart';

import '../cubit/cubit.dart';

Widget buildNewsItem(article, context) => InkWell(
      onTap: () {
        // navigateTo(context, WebViewScreen('url'));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                      //hoals
                      lmlmlmlmlit 
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
Widget mySeparetor() => Container(
      margin: const EdgeInsets.only(
        left: 20.0,
      ),
      height: .5,
      color: Colors.grey[400],
    );
Widget articleBuilder(list, context) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildNewsItem(list[index], context),
        separatorBuilder: (context, index) => mySeparetor(),
        itemCount: list.length,
      ),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
