import 'package:bloc_app/conestances/my_colors.dart';
import 'package:bloc_app/data/models/charcter_model.dart';
import 'package:flutter/material.dart';
class CharacterDetails extends StatelessWidget {
  final CharacterModel characterModel;
  const CharacterDetails({super.key,required this.characterModel});
 Widget buildSliverAppBar(){
   return SliverAppBar(

     expandedHeight: 600,
     pinned: true,
     stretch: true,

     flexibleSpace: FlexibleSpaceBar(
       background: Hero(
         tag: characterModel.charId!,
         child: Image.network(
           characterModel.image!,
           fit: BoxFit.cover,
         ),
       ),
       title: Text("${characterModel.name!}",style: TextStyle(color: MyColors.myGrey),
       ),
       centerTitle: true,

     ),


   );
 }
  Widget characterInfo(String ? title ,String ? value){
   return RichText(
     maxLines: 1,
     overflow: TextOverflow.ellipsis,

     text: TextSpan(children: [
       TextSpan(
         text: title,
         style: TextStyle(
           fontWeight: FontWeight.bold,
           color: MyColors.myWhite,
           fontSize: 18
         )
       ),
       TextSpan(
         text: value,
         style: TextStyle(
           color: MyColors.myWhite,
           fontSize: 16
         )
       ),
     ]),);
  }
  buildDivider(double endIndent){
   return Divider(
     height: 30,
     thickness: 2,
     color: MyColors.myYellow,
     endIndent: endIndent,
   );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
                       Container(
                         margin: EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
                         padding: EdgeInsets.all(8),
                         child:Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             characterInfo("status if alive or dead :  ",characterModel.statusIfDeadOrAlive),
                             buildDivider(200),
                             characterInfo("gender :  ",characterModel.gender),
                             buildDivider(315),
                             characterInfo("species ",characterModel.species),
                             buildDivider(315),
                             characterInfo("url ",characterModel.url),
                             buildDivider(315),
                             characterInfo("creation date ",characterModel.created),
                             buildDivider(250),
                             SizedBox(
                               height: 500,
                             )


                           ],
                         )
                       )
            ]),
          )
        ],
      ),
    );
  }
}
