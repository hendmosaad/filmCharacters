import 'package:bloc_app/conestances/my_colors.dart';
import 'package:bloc_app/data/models/charcter_model.dart';
import 'package:bloc_app/persenatation/screens/character_details.dart';
import 'package:flutter/material.dart';
class CharacterItem extends StatelessWidget {
 final CharacterModel characterModel;
  const CharacterItem({super.key,required this.characterModel});

  @override
  Widget build(BuildContext context) {
    print(characterModel.image);
    return Container(
      width: double.infinity,
      margin:EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8) ,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: MyColors.myWhite,borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, '/character_details', arguments: characterModel);
        },
        child: GridTile(
            child: Hero(
              tag: characterModel.charId!,
              child: Container(
                        color: MyColors.myGrey,
                        child:
                        characterModel.image!.isNotEmpty?
                        FadeInImage.assetNetwork(
              width: double.infinity,
              height: double.infinity,
              placeholder: "assets/images/loading.gif",
              image: characterModel.image!,
              fit: BoxFit.cover,
                        ):
                Image.asset("assets/images/fail2.png"),


                      ),
            ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10,),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text("${characterModel.name}",style: TextStyle(height: 1.3,fontSize: 16,color: MyColors.myWhite),overflow: TextOverflow.ellipsis,maxLines: 2,textAlign: TextAlign.center,),
          ),
        ),
      ),
      
    );
  }
}
