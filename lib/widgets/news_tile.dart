import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/views/news_web_view_screen.dart';

class NewsTile extends StatelessWidget {
  final ArticleModel articleModel;

  const NewsTile({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsWebViewScreen(
              url: articleModel.url,
              title: articleModel.title,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: articleModel.image != null && articleModel.image!.isNotEmpty
                ? Image.network(
                    articleModel.image!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        height: 200,
                        width: double.infinity,
                        child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                      );
                    },
                  )
                : Container(
                    color: Colors.grey[300],
                    height: 200,
                    width: double.infinity,
                    child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                  ),
          ),
          const SizedBox(height: 12),
          Text(
            // ignore: dead_null_aware_expression
            articleModel.title ?? 'No Title Available',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            articleModel.subTitle ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}


