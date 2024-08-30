import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DealsOfTheDay extends StatelessWidget {
  const DealsOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            "Deal of the day",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          child: Image.network(
            "https://images.unsplash.com/photo-1719937206491-ed673f64be1f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8",
            height: MediaQuery.of(context).size.height *
                0.3, // 30% of screen height
            width: MediaQuery.of(context).size.width * 0.7,
            // Image will take full width of the screen
            fit: BoxFit.cover, // Adjusts the image to cover the available space
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 23),
          child: const Text(
            "\$34,556",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 23),
          child: const Text(
            "Galaxy 234",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.network(
                "https://plus.unsplash.com/premium_photo-1722077701586-a81474ac7289?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://plus.unsplash.com/premium_photo-1722077701586-a81474ac7289?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://plus.unsplash.com/premium_photo-1722077701586-a81474ac7289?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://plus.unsplash.com/premium_photo-1722077701586-a81474ac7289?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://plus.unsplash.com/premium_photo-1722077701586-a81474ac7289?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://plus.unsplash.com/premium_photo-1722077701586-a81474ac7289?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://plus.unsplash.com/premium_photo-1722077701586-a81474ac7289?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            "See All Deal",
            style: TextStyle(color: Colors.cyan),
          ),
        )
      ],
    );
  }
}
