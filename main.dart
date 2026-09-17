Container(
        width: double.infinity,
        height: 300,
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 17),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         textDirection: TextDirection.rtl,
         children: [
         
          
          Spacer(),
               Icon(Icons.access_alarm_outlined,color: Colors.grey,),
               Text("7ايام",style: TextStyle(fontSize: 30,color: Colors.grey),
               )
             ],

           ),
           SizedBox(height: 25,),
        Row(textDirection: TextDirection.rtl,
        children: [Icon(Icons.network_wifi,color: Colors.grey,),
          Text("1.5جيجاصباحي",style: TextStyle(fontSize: 30,color: Colors.grey)
          ),
         ],
        ),
           SizedBox(height: 25,),
           Row(
             textDirection: TextDirection.rtl,
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Container(
                 width: 200,
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                 child: MaterialButton(
                   color: Colors.red,
                   onPressed: (){},child:
                 Text("اشتراك",style: TextStyle(fontSize: 30,color: Colors.white),
                 ),),
               ),
               Text("1000ريال",style: TextStyle(fontSize: 22,color: Colors.red),)

           ],

           )
          ],
      ),
      ),
