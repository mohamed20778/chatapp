import 'package:flutter/material.dart';

class MassengerScreeen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: Colors.white,
        elevation: 0.0,
          title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://scontent.fcai21-2.fna.fbcdn.net/v/t39.30808-6/305447738_627240605427224_6831826573318395078_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=IiazWh9EJF8AX-V16sE&_nc_ht=scontent.fcai21-2.fna&oh=00_AT_eYImieFMEYwBfhBr-bOgE5huh6OdoCeaaxKwkM7sUzQ&oe=631E1E3D'),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                    Icons.camera_alt,
                  size: 16,
                ),
              ),

          ),
          IconButton(
            onPressed: (){},
            icon: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16,
              ),
            ),

          )

        ],
      ),//بنعطى ال title space نفس مقاس ال padding بتاع ال column الى فى الbody عشان يبقوا مساووين لبعض
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Search')
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                child: ListView.separated(

                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                    itemBuilder:(context,index)
                    {
                      return buildStoryItem();
                    },
                    separatorBuilder: (context,index)
                    {
                      return SizedBox(width: 20);
                    },
                    itemCount:30
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder:(context,index)
                  {
                    return buildChatItem();
                  },
                itemCount: 60,
                separatorBuilder: (context,index)
                {
                  return const SizedBox(
                    height: 20,
                  );
                },



              ),//ممكن نعملها arrow function عشان هى بترجعلنا عنصر واحد او object واحد
              //ممكن نعملها arrow function عشان هى بترجعلنا عنصر واحد او object واحد
            ],
          ),
        ),
      ),
    );
  }


  Widget buildStoryItem()// ممكن نعملها arrow function عشان هى بترجعلنا عنصر واحد او object واحد
  {
    return  Row(
      children: [
        SizedBox(
          width: 60.0,
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://scontent.fcai21-2.fna.fbcdn.net/v/t39.30808-6/305447738_627240605427224_6831826573318395078_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=IiazWh9EJF8AX-V16sE&_nc_ht=scontent.fcai21-2.fna&oh=00_AT_eYImieFMEYwBfhBr-bOgE5huh6OdoCeaaxKwkM7sUzQ&oe=631E1E3D'),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius:7.5  ,
                  ),//ممكن نعمل padding عشان نحرك الدايرة
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius:7  ,
                  ),
                ],
              ),
              const SizedBox(height: 6,),
              const Text(
                'Mohamed gehad elnenaa',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

      ],
    );
  }
  Widget buildChatItem()
  {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: const [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://scontent.fcai21-2.fna.fbcdn.net/v/t39.30808-6/305447738_627240605427224_6831826573318395078_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=IiazWh9EJF8AX-V16sE&_nc_ht=scontent.fcai21-2.fna&oh=00_AT_eYImieFMEYwBfhBr-bOgE5huh6OdoCeaaxKwkM7sUzQ&oe=631E1E3D'),
            ),
            CircleAvatar(
              radius:7.5,
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              radius: 7,
              backgroundColor: Colors.green,
            ),
          ],
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohamed elneanaa',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Hello my name mohamed',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text('02.00 PM')
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
