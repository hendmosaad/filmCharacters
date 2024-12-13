import 'package:bloc_app/business_logic/characters_cubit.dart';
import 'package:bloc_app/conestances/my_colors.dart';
import 'package:bloc_app/data/models/charcter_model.dart';
import 'package:bloc_app/persenatation/widgets/items/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
class Character extends StatefulWidget {
  const Character({super.key});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  late List <CharacterModel> allCharacters;
  late List <CharacterModel> searchedForCharacters;
  bool isSearching =false;
  final searchTextController=TextEditingController();
  Widget buildSearchField(){
    return TextField(
      controller: searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: "find a character",
        hintStyle: TextStyle(color: MyColors.myGrey,fontSize: 18),
        border: InputBorder.none,

      ),
      onChanged: (searchedCharacter){
        addSearchedForItemsToSearchedList(searchedCharacter);
      },

    );
  }
 void addSearchedForItemsToSearchedList(String searchedCharacter){
    searchedForCharacters=allCharacters.where((character)=>character.name!.toLowerCase().startsWith(searchedCharacter)).toList();
  setState(() {

  });
  }
  List<Widget> buildAppBarActions(){
    if(isSearching){
      return [
        IconButton(onPressed: (){
         clearSearch();

           //Navigator.pop(context);
           setState(() {
             isSearching=false;
           });
        }, icon: Icon(Icons.clear,color:MyColors.myGrey,size: 30,))
      ];
    }else{
      return [IconButton(onPressed:(){
        setState(() {
          isSearching=true;
        });
      }
          , icon: Icon(Icons.search,color:MyColors.myGrey,size: 30,))];
    }
  }
  //   _startSearch(){
  //  ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove:stopSearching() ));
  //   setState(() {
  //     isSearching=true;
  //   });
  // }

  // stopSearching(){
  //   clearSearch();
  // setState(() {
  //
  //   isSearching=false;
  // });
  // }
  clearSearch(){
    setState(() {
      searchTextController.clear();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();

  }
  Widget BuildBlocWidget(){
    return BlocBuilder<CharactersCubit,CharactersState>(
        builder: (context,state){
          if(state is CharactersLoaded){
         this.allCharacters=state.Characters;
          return BuildLoadedListWidet();
          }else {
          return  Container(
              child:
              showLoadingWidget(),
            );
          }
        },);
  }
  Widget showLoadingWidget(){
    return Center(child: CircularProgressIndicator(color: MyColors.myYellow,));
  }
  Widget BuildLoadedListWidet(){
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            BuildCharactersList(),
          ],
        ),
      ),
    );

  }
  Widget BuildCharactersList(){

    return GridView.builder(

      itemCount: searchTextController.text.isEmpty? this.allCharacters.length: this.searchedForCharacters.length,
      gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1),
        shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding:EdgeInsets.zero,
      itemBuilder: (context,index){
      return CharacterItem(characterModel: searchTextController.text.isEmpty? this.allCharacters[index]: this.searchedForCharacters[index],);
        },);
  }
  Widget buildTitle(){
    return  Text("Characters",style: TextStyle(color: MyColors.myGrey),  );
  }
  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            Image.asset('assets/images/fail2.png')
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title:isSearching?buildSearchField():buildTitle(),
        leading: isSearching?BackButton(color: MyColors.myGrey):Container(),
        actions: buildAppBarActions(),
      ),
      body: OfflineBuilder(connectivityBuilder: (BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,){
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return BuildBlocWidget();
        } else {
          return buildNoInternetWidget();
        }
      },child:showLoadingWidget() ,),
    );
  }
}
