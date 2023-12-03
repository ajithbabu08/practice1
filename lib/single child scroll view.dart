import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MaterialApp(home: SingleScroll(),));
}
class SingleScroll extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Story"),),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
             padding: const EdgeInsets.only(left: 10,right: 10),
             child: Text("Spider Man",style: GoogleFonts.rubik(fontWeight: FontWeight.bold,color: Colors.red),),
           ),
          Expanded(child: Text("""
          
          Peter Benjamin Parker (Tobey Maguire) is a nerdy and shy but intelligent high school senior student at Midtown Secondary College Of Science & Technology in Queens, New York City. His parents are dead and he lives with his Uncle Benjamin Franklin Ben Parker (Cliff Robertson) and Aunt Mayabella May Parker (Rosemary Harris). He has a crush on his next door neighbor, Mariam Mary Jane Watson (Kirsten Dunst), who is also one of the few classmates who is nice to him. Her boyfriend, a sports player and the school bully, Eugene Flash Thompson (Joe Manganiello) and his buddies bully and pick on him. Peter's only friend is Harold Theopolis Harry Osborn (James Franco), who, though rich and good-looking, is similarly an outcast. Harry, however, is somewhat jealous of the affection his billionaire scientist father, Professer Norman Virgil Osborn (Willem Dafoe) shows Peter. Norman, the founder, owner and head of weapons contractor of Oscorp Science Industries, appreciates Peter's scientific aptitude and can barely conceal his desire that Peter was his own son.

Peter's science class takes a field trip excursion to a genetics science laboratory at Columbia University. The lab works on spiders and has even managed to create new species of super-spiders through genetic DNA manipulation and combination. While Peter is taking photographs of Mary Jane for the school newspaper, one of these new genetically-altered spiders (one which is red and blue) escapes without anyone noticing lands on his hand and hungrily bites him. Peter comes home feeling ill and immediately goes to bed. At the genetic level, the genetically mutated DNA-filled venom injected by the spider bite begins to work strange magic on Peter. Meanwhile, General Slocum (Stanley Anderson) visits Oscorp to see the results of their new super soldier formula. When one of Norman's top scientists, Professor Stromm (Ron Perkins) warns him the formula is unstable, General Slocum threatens to pull all of the military's funding from Oscorp. Later that night, Norman exposes himself to the gas formula. He gains superhuman strength and agility but is driven insane. He kills Stromm and steals two other Oscorp inventions, a green goblin-shaped armoured exoskeleton flight suit and bat-shaped jet glider.

Peter wakes up the next morning feeling better than ever. He also learns his scrawny physique now ripples with muscles and his eyesight is perfect. At school that day, he learns he can shoot webs out of spinnerettes in his wrists. He demonstrates his own new agility by catching Mary Jane and her food tray when she slips at lunch and then beating an enraged Flash in a fistfight. That night, he and Mary Jane casually flirt across the fence separating their backyards, although Flash breaks this up when he arrives with his new car. Peter believes he needs a car to impress Mary Jane but knows neither he nor the cash-strapped and retired Ben and May would be able to afford one.

One night he spies an advertisement in the paper. A local professional wrestling league will pay 3000 to anyone who can survive three minutes in the ring with their wrestling champion, Bonesaw McGraw (Randy Macho Man Savage). Peter designs a suit and heads out to the arena, telling Ben and May he is going to the library. Ben and May are worried about the changes in Peter's personality and Ben insists on driving him to the library. He tries to explain his and May's concerns. He encourages Peter not to get into any more fights; he might have the power to beat the Flash Thompsons of the world, but with great power comes great responsibility -- the responsibility to know when and how best to use that power. Peter reacts badly. He tells Ben he is not Peter's father and should not act like he is. Peter not only survives the wrestling match, he defeats Bone Saw in two minutes. But the promoter pays Peter only 100. Angry at being gypped, Peter stands aside as an armed robber named Dennis Carradine (Michael Papajohn) steals all the cash and holds up the promoter, escaping through an elevator. However, when he gets out to the street, he discovers horrified that Dennis the criminal fatally wounded Ben with a gun and stole his car. In anguish, Peter chases down Dennis and beats him. The robber falls out of a window where his body is recovered by the police. Peter is heartbroken that night, knowing that if he had stopped Dennis when he had the chance and not acted so selfishly then Uncle Ben would still be alive. That same night, a menacing figure wearing the stolen Oscorp exoskeleton and riding the jet glider attacks a weapons test at Quest Aerospace, Oscorp's chief competitor. Their prototype is destroyed and General Slocum is killed.
          
          """))

        ],
      ),
    );
  }
}
