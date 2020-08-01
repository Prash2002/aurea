import 'package:aurea/screens/infoVideos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              orientation==Orientation.portrait?Column(
              children:<Widget>[
              Image.asset("assets/images/parrot.jpg",
              height: height*0.57,
              width: width,
              fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top:10),
                height: height*0.27,
                width: width*0.93,
                child: Column(
                  children: <Widget>[
                    Text("The Golden Ratio",style: TextStyle(
                                fontSize: height*0.05,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Acme',
                                color: Colors.pink[600]
                              ),),
                    Text("The Golden ratio is a special irrational number like pi (π) represented as phi, Φ. Its value is 1.61803398874989484820...\nGolden ratio has its applications in all aspects of nature, art, finance, and much more.",
                    style: TextStyle(fontSize: height*0.027),
                    )
                ],),
              ),
              ],
              ):
              Row(
              children:<Widget>[
              Image.asset("assets/images/parrot.jpg",
              height: height*0.7,
              width: width*0.29,
              fit: BoxFit.contain,
              ),
              SizedBox(width: 20,),
              Container(
                margin: EdgeInsets.only(top:10),
                height: height*0.6,
                width: width*0.67,

                child: Column(
                  children: <Widget>[
                    Text("The Golden Ratio",style: TextStyle(
                                fontSize: height*0.1,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Acme',
                                color: Colors.pink[600]
                              ),),
                    Text("The Golden ratio is a special irrational number like pi (π) represented as phi, Φ. Its value is 1.61803398874989484820...\nGolden ratio has its applications in all aspects of nature, art, finance, and much more.",
                    style: TextStyle(fontSize: height*0.053),
                    )
                ],),
              ),
              ],
              ),
              SizedBox(height:60),
              Container(
                height: height-60,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/info1.jpg"),
                    fit: BoxFit.cover
                  ),
                ),
                child: Center(
                  child: Container(
                  height: height*0.7,
                  width: width*0.9,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    // image: DecorationImage(
                    //   image: AssetImage("assets/images/info1.jpg"),
                    //   fit: BoxFit.cover
                    // ),
                  ),
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                        border: Border.all(width: 1)
                      ),
                      child: SvgPicture.network("https://www.mathsisfun.com/numbers/images/golden-ratio.svg",
                      height: height*0.31,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                     
                      child: 
                      Column(
                        children: <Widget>[
                          Text("We find the golden ratio when we divide a line into two parts so that:", style: TextStyle(fontSize: 18),),
                          SizedBox(height: 10),
                          Text("the long part divided by the short part",style: TextStyle(fontSize: 20,backgroundColor: Colors.orange[100]),),
                          Text("is also equal to", style: TextStyle(fontSize: 19,fontStyle: FontStyle.italic),),
                          SizedBox(height: 15),
                          Text("the whole length divided by the long part",style: TextStyle(fontSize: 20,backgroundColor: Colors.indigo[100]),),
                        ],
                      ),
                    ),
                  ],),
                  ),
                ),
              ),
              Container(
                height: height*1.3,
                width: width,
                 decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/petals.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                 padding: EdgeInsets.symmetric(vertical:20,horizontal:15),
                 color: Colors.white.withOpacity(0.25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Center(child: Text("Calculations", style: TextStyle(fontSize: 35,fontFamily: 'Acme'),)),
                    SizedBox(height: 10,),
                    Text("Two quantities a and b are said to be in the golden ratio φ if", style: TextStyle(fontSize: 19)),
                    SvgPicture.asset("assets/images/cal.svg",
                    height:50,
                    ),
                    SizedBox(height: 10,),
                    Text("One method for finding the value of φ is to start with the left fraction. Through simplifying the fraction and substituting in b/a = 1/φ,", style: TextStyle(fontSize: 19)),
                    SizedBox(height: 10,),
                    SvgPicture.asset("assets/images/cal2.svg",
                    height:55,
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Text("Therefore," ,style: TextStyle(fontSize: 19)),
                        SizedBox(width:width*0.06,),
                        SvgPicture.asset("assets/images/cal3.svg",
                        height:60,
                    ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Text("Multiplying by φ gives",style: TextStyle(fontSize: 19)),
                        SizedBox(width: width*0.06,),
                        SvgPicture.asset("assets/images/cal4.svg",
                        height:35,
                    ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("which can be rearranged to",style: TextStyle(fontSize: 19)),
                    SizedBox(height: 5,),
                    Center(
                      child: SvgPicture.asset("assets/images/cal5.svg",
                      height:35,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Using the quadratic formula, two solutions are obtained:",style: TextStyle(fontSize: 19,)),
                    SizedBox(height: 5,),
                    Center(
                      child: SvgPicture.asset("assets/images/cal6.svg",
                      height:50,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Center(child: Text("and",style: TextStyle(fontSize: 19))),
                    SizedBox(height: 5,),
                    Center(
                      child: SvgPicture.asset("assets/images/cal7.svg",
                      height:50,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Because φ is the ratio between positive quantities, φ is necessarily positive:",style: TextStyle(fontSize: 19)),
                    SizedBox(height: 5,),
                    SvgPicture.asset("assets/images/cal8.svg",
                    height:50,
                    ),
                   
                  ],),
                ),
              ),
              Container(
                height: height-80,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg-1.jpg"),
                    fit: BoxFit.cover
                    )
                ),
                child: Center(
                  child: Container(
                    height: height*0.75,
                    width: width*0.9,
                    padding: EdgeInsets.all(10),
                    color: Color.fromRGBO(255, 255, 199,0.85),
                    child: Column(
                      children: <Widget>[
                    Image.network("https://he-s3.s3.amazonaws.com/media/uploads/cb96336.gif",
                     height: height*0.25, width: double.infinity,fit: BoxFit.contain,
                      ),
                      Text("The golden ratio is best approximated by the famous 'Fibonacci numbers'. Fibonacci numbers are a never-ending sequence starting with 0 and 1 and continuing by adding the previous two numbers. The next numbers in the Fibonacci sequence, for instance, are 1, 2, 3, and 5.\n The ratios of sequential Fibonacci numbers (2/1, 3/2, 5/3, etc.) approach the golden ratio. In fact, the higher the Fibonacci numbers, the closer their relationship is to 1.618.",
                      style: TextStyle(fontSize: 19),
                      )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                 height: height - 80,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg5.jpg"),
                    fit: BoxFit.cover
                    )
                ),
                child: Center(
                  child: Container(
                    height: height*0.8,
                    width: width*0.9,
                    color: Colors.white.withOpacity(0.75),
                    child: Column(
                      children: <Widget>[
                        Image.network("https://upload.wikimedia.org/wikipedia/commons/e/e9/GoldenSpiralLogarithmic_color_in.gif",
                        height: height*0.25, fit: BoxFit.cover, width: double.infinity,
                        ),
                      
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:10,vertical:10),
                          child: Text("In geometry, a golden spiral is a logarithmic spiral whose growth factor is φ, the golden ratio. Golden spirals are self-similar. The shape is infinitely repeated when magnified.",
                          style: TextStyle(fontSize: 18),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal:10),
                        //   child: Text("\nA mathematical method for exploring irrational numbers is to play a kind of game.The idea is that you have a flower, and you are trying to place seeds on the face of the flower in such a way that you can fit as many as possible.The best number to rotate the flower for optimal seed placement is the golden ratio, where the entire face gets covered more or less evenly without the seeds clustering in any one spot. ",
                        //   style: TextStyle(fontSize: 18),
                        //   ),
                        // ),
                        // Spacer(),
                        // Image.network("https://thumbs.gfycat.com/VigilantHardAsiaticmouflon-max-1mb.gif",
                        // height: 200, fit: BoxFit.cover, width: double.infinity,
                        // )
                         Image.network("https://media1.giphy.com/media/Up8GmvOMbSdvJWvhgI/giphy.gif",
                        height: height*0.25, fit: BoxFit.cover, width: double.infinity,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left:10,top:10),
                              child: Text("For more \n information -->",textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
                            ),
                           
                            Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: FlatButton.icon(
                                color: Colors.red[400],
                                textColor: Colors.black,
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoVideos())), 
                                icon: Icon(Icons.video_library, color: Colors.white,), 
                                label: Text("Watch Videos",style: TextStyle(fontSize: 16),)),
                             
                            )
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}