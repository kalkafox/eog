<head>
  <style>
    body{
	top:0;
	margin:0;
	width:auto;
	height:auto;
    background-color:#000;
	-webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    }

	@font-face
    {
    font-family: Segoe UI Light;
    src: url(segoeuil.ttf);
    }
	
	@font-face
    {
    font-family: Dosis Light;
    src: url(Dosis-Light.ttf);
    }
	
    #startimg{
    background: url('http://puu.sh/99UFv/aa599abfdd.jpg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
	position:fixed;
    top:0;
    opacity:0;
    -webkit-transition:1s;
    -moz-transition:1s;
    transition:1s;
    width:100%;
    height:100%;
    z-index:-9999 !important;
    }

    #img{
    background: url('http://puu.sh/99UFv/aa599abfdd.jpg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
	position:fixed;
    top:0;
    opacity:0;
    -webkit-transition:1s;
    -moz-transition:1s;
    transition:1s;
    width:100%;
    height:100%;
    z-index:-9999 !important;
    }
	
	#img2{
    background: url('http://puu.sh/9jh8c/f6ef9fd1c6.png') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
	position:fixed;
    top:0;
    opacity:0;
    -webkit-transition:1s;
    -moz-transition:1s;
    transition:1s;
    width:100%;
    height:100%;
    z-index:-99999 !important;
    }
	
	#color{
	background-color: #00000;
	position:fixed;
	top:0;
	opacity:0;
    -webkit-transition:1s;
    -moz-transition:1s;
    transition:1s;
    width:100%;
    height:100%;
	z-index:-99999 !important;
	}
	
	
	.youtube {
    margin: 0 auto;
    opacity:1;
    }

    #JOHNMADDENA{
    top: 0%;
    position: fixed;
    font-size:40px;
    font-family: Segoe UI Light;
    color:orange;
    opacity:0;
    white-space: nowrap;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
	z-index: 99999;
    }


    #miles{
	background-image:url('soon2.png');
	position:fixed;
	width:160px;
	height:248px;
    opacity:0;
    transition:1s;
	-moz-transition:4s;
	z-index:9999 !important;
    }

    #miles2{
	background-image:url('darktails3.png');
	position:fixed;
	width:176px;
	height:248px;
    opacity:0;
    transition:1s;
	-moz-transition:4s;
	z-index:9999 !important;
    }

	#miles3{
	background-image:url('darktails.png');
	position:fixed;
	width:176px;
	height:248px;
    opacity:0;
    transition:1s;
	-moz-transition:4s;
	z-index:999 !important;
    }

	#mileslambda{
	background-image:url('metal.png');
	position:fixed;
	width:135px;
	height:233px;
    opacity:0;
    transition:1s;
	-moz-transition:4s;
	z-index:999 !important;
    }

    a{
    text-decoration: none;
    color:inherit;
    }

    #select{
    top: 0;
    color:orange;
    position:absolute;
    opacity:0;
    text-decoration: none;
    font-size:40px;
    font-family: Segoe UI Light;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
	z-index: 99999;
    }


    #selectgenocide{
    top:85%;
    left:50%;
    position:fixed;
    color:white;
    opacity:0;
    text-decoration: none;
    font-size:40px;
    font-family: Segoe UI Light;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
	z-index: 99999;
    }
	
	#selectlambda{
    top:85%;
    left:50%;
    position:fixed;
    color:white;
    opacity:0;
    text-decoration: none;
    font-size:40px;
    font-family: Segoe UI Light;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
	z-index: 99999;
    }



    #text{
    padding:20px;
    position:absolute;
    opacity:0;
    display:none;
    transition:1s;
    margin: 0;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    z-index: 9999999;
    }

    #genocide{
    padding:20px;
    position:absolute;
    opacity:0;
    display:none;
    transition:1s;
    margin: 0;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    z-index: 9999999;
    }
	
    #lambda{
    padding:20px;
    position:absolute;
    opacity:0;
    display:none;
    transition:1s;
    margin: 0;
	width:50%;
	height:50%;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    z-index: 9999999;
    }
  </style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="spoiler.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="js/jquery.tubular.1.0.js"></script>
  <title>Miles Prower</title>
<link rel="icon" id="favicon" type="image/png" href="favicon.png">
<!--<script type="text/javascript" src="something.php?"></script>-->
</head>

<body>
<div id="miles"></div>
<div id="miles3"></div>
<div id="mileslambda"></div>
<div id="color"></div>
<div id="miles2"></div>
  <div id="text">
  <div class="youtube"></div>
    <font color="orange" face="Segoe UI Light" size="5pt">
      <p>Hi.</p>
      <p>My name is Kalka, and this is my new website.</p>

      <p>Ah yes, unpopular, but I felt I should grab a new start from the old garbage I recently threw away. I feel it will open a new opportunity for friends to view this in a way that would become a reality.</p>
      <p>What else to say? More to come, I suppose.</p>
    </div>
  <div id="genocide">
    <font color="white" face="Segoe UI Light" size="5pt">
      <p>"An onimous reproach stands in my stance."</p>
      <p>"Embedded between the sweets of lies and the bitters of truth."</p>
            <p>"Confirmed isolation with the blink of an eye."</p>
			<p>"Quiet pace in stages of sleep."</p>
			<br><br><br>
			<p>"Hover over me and the answer will reveal."</p>
			<p>"As if a drift onto an offset, whereas"</p>
			<p>"candy filled dreams lie"</p>
			<p>"I can't feel my other self, yet it's inexplicable"</p>
			<p>"Please tell me <i>he</i> isn't parting.</p>
          </div>
  <div id="lambda">
   <font color="orange" face="Dosis Light" size="5pt">
   <p>This is Miles Prower.</p>
   <p>I'm not exactly sure what I've discovered while building this robot, but it's something phenomenal. I know it.</p>
   <br><br>
   <p>It's like... some kind of weird feeling. I'm not exactly sure how to describe it.</p>
   <br><br>
   <p>It's scaring me really badly.</p>
   <br><br>
   <p>I've codenamed it "<b>λ</b>".</p>
   <p>So... I wonder, should I continue working on this project? Is it going to suddenly turn self-aware on me...?</p>
   <br><br>
   <p>I'm... scared.</p>
   </div>
  <div id="img"></div>
  <div id="img2"></div>
  <div id="all">
    <div id="JOHNMADDENA"></div>
    <!--<div id="select">
      <p>
        <!--<a href="#" onclick="one()" id="link"><s>Learn more</s></a>-->
      <!--</p>
    </div>-->
    <div id="selectgenocide">
      <p>
        <a href="#" onclick="genocide()" id="link">Mirror</a>
      </p>
    </div>
	<div id="selectlambda">
      <p>
        <a href="#" onclick="lambda()" id="link">Metallic Structure</a>
      </p>
    </div>
  </div>


  <script>
    function hide(e){$(e).css({display:'none'});};
    function show(e){$(e).css({display:'inherit'});};

    var one = function(){
	mouse();
    $("#img").css({transition:'1s'});
    $("#img").css({opacity:'0'});
    $("#miles").css({transition:'1s'});
    $("#miles2").css({transition:'1s'});
    $("#selectgenocide").css({transition:'1s'});
    $("#JOHNMADDENA").css({transition:'1s'});
    $("#select").css({transition:'1s'});
    $("#JOHNMADDENA").css({opacity:'0'});
    $("#miles").css({opacity:'0'});
    $("#miles2").css({opacity:'0'});
    $("#select").css({opacity:'0'});
    $("#selectgenocide").css({opacity:'0'});
    setTimeout(function(){
    $("#img").css({background:'url("http://puu.sh/99UFv/aa599abfdd.jpg") no-repeat center center fixed'});
    $("#img").css({transition:'0'});
    hide("#miles");
    hide("#miles2");
    hide("#JOHNMADDENA");
    hide("#select");
    show("#text");
    },1000);

    setTimeout(function(){
    $("#img").css({transition:'1s'});
    $("#text").css({opacity:'1'});
    $("#img").css({opacity:'0.5'});
    },1200);
    };
	
	var genocide = function(){
	mouse();
	$(document).ready(function(){
    $("#img").css({transition:'1s'});
    $("#img").css({opacity:'0'});
    $("#miles2").css({'background-image':'url("darktails3.png")'});
    $("#miles2").css({transition:'1s'});
    $("#selectgenocide").css({transition:'1s'});
	$("#selectlambda").css({transition:'1s'});
    $("#JOHNMADDENA").css({transition:'1s'});
    $("#select").css({transition:'1s'});
    $("#JOHNMADDENA").css({opacity:'0'});
	$("#miles").css({transition:'1s'});
    $("#miles2").css({opacity:'1'});
    $("#miles").css({opacity:'0'});
    $("#select").css({opacity:'0'});
	$("#selectlambda").css({opacity:'0'});
    $("#selectgenocide").css({opacity:'0'});
    $("#miles").mouseenter(function(){
	$("#img").css({transition:'0.5s'});
	$("#img").css({opacity:'0'});
    $("#img2").css({transition:'0.5s'});
	$("#img2").css({opacity:'1'});
	$("#miles").css({opacity:'0.4'});
    });
	$("#miles").mouseleave(function(){
    $("#img").css({transition:'0.5s'});
	$("#img").css({opacity:'0.4'});
    $("#img2").css({transition:'0.5s'});
	$("#img2").css({opacity:'0'});
	$("#miles").css({opacity:'1'});
	});
	$("#miles2").mouseenter(function(){
	$("#img").css({opacity:'1'});
	$("#img").css({transition:'0.5s'});
	$("#miles").css({opacity:'0.4'});
	});
	$("#miles2").mouseleave(function(){
	$("#img").css({opacity:'0.3'});
	$("#img").css({transition:'0.5s'});
	$("#miles").css({opacity:'1'});
	});
	setTimeout(function(){
	$("#miles").css({transition:'0'});
	$("#miles").css({'background-image':'url("darktailsa.png")'});
	$("#miles").css({width:'176px', height:'248px'});
	},800);
    setTimeout(function(){
    $("#img").css({transition:'0'});
    $("#img").css({background:'url("http://p1.pichost.me/i/10/1326326.jpg") no-repeat center center fixed'});
	$("#img").css({'background-size':'cover'});
	$("#miles").css({top:'50%',left:'60%',margin:'-'+($('#miles').height() / 2)+'px 0 0 -'+($('#miles').width() / 2)+'px'});
	$("#miles").css({transition:'1s'});
	$("#miles").css({opacity:'1'});
    $("#miles2").css({top:'50%',left:'85%',margin:'-'+($('#miles2').height() / 2)+'px 0 0 -'+($('#miles2').width() / 2)+'px'});
	$("#miles3").css({top:'50%',left:'85%',margin:'-'+($('#miles3').height() / 2)+'px 0 0 -'+($('#miles3').width() / 2)+'px'});
    hide("#JOHNMADDENA");
    hide("#select");
    hide("#selectgenocide");
	show("#genocide");
    },1000);
	});
	setTimeout(function(){
	$("#img").css({transition:'0.5s'});
	$("#genocide").css({opacity:'1'});
	$("#img").css({opacity:'0.4'});
	},1200);
	
	
	
	
	
	};
	
	var lambda = function(){
	mouse();
	$(document).ready(function(){
	//$("#miles").css({transition:'0'});
	//$("#miles").css({'background-image':'url("darktailsa.png")'});
	//$("#miles").css({width:'176px', height:'248px'});
    $("#img").css({transition:'1s'});
    $("#img").css({opacity:'0'});
    $("#selectgenocide").css({transition:'1s'});
	$("#selectlambda").css({transition:'1s'});
    $("#JOHNMADDENA").css({transition:'1s'});
    $("#select").css({transition:'1s'});
    $("#JOHNMADDENA").css({opacity:'0'});
	$("#miles").css({transition:'1s'});
	$("#mileslambda").css({transition:'1s'});
    $("#mileslambda").css({opacity:'1'});
    $("#miles").css({opacity:'0'});
    $("#select").css({opacity:'0'});
	$("#selectlambda").css({opacity:'0'});
    $("#selectgenocide").css({opacity:'0'});
    /*$("#miles").mouseenter(function(){
	$("#img").css({transition:'0.5s'});
	$("#img").css({opacity:'0'});
    $("#img2").css({transition:'0.5s'});
	$("#img2").css({opacity:'1'});
	$("#miles").css({opacity:'0.4'});
    });
	$("#miles").mouseleave(function(){
    $("#img").css({transition:'0.5s'});
	$("#img").css({opacity:'0.4'});
    $("#img2").css({transition:'0.5s'});
	$("#img2").css({opacity:'0'});
	$("#miles").css({opacity:'1'});
	});*/
	$("#mileslambda").mouseenter(function(){
	$("#color").css({'background-color':'red'});
	$("#color").css({transition:'0.5s'});
	$("#color").css({opacity:'0.1'});
	});
	$("#mileslambda").mouseleave(function(){
	$("#color").css({'background-color':'#000000'});
	$("#color").css({opacity:'0'});
	$("#color").css({transition:'0.5s'});
	});
	setTimeout(function(){
	$("#mileslambda").css({transition:'1s'});
	$("#mileslambda").css({top:'40%',left:'80%',margin:'-'+($('#mileslambda').height() / 2)+'px 0 0 -'+($('#mileslambda').width() / 2)+'px'});
	$("#miles").css({top:'80%',left:'20%',margin:'-'+($('#miles').height() / 2)+'px 0 0 -'+($('#miles').width() / 2)+'px'});
	$("#miles").css({transition:'1s'});
	$("#miles").css({opacity:'0'});
    //$("#miles2").css({top:'50%',left:'85%',margin:'-'+($('#miles2').height() / 2)+'px 0 0 -'+($('#miles2').width() / 2)+'px'});
	//$("#miles3").css({top:'50%',left:'85%',margin:'-'+($('#miles3').height() / 2)+'px 0 0 -'+($('#miles3').width() / 2)+'px'});
	},80);
    setTimeout(function(){
    //$("#img").css({transition:'0'});
    //$("#img").css({background:'url("http://p1.pichost.me/i/10/1326326.jpg") no-repeat center center fixed'});
	//$("#img").css({'background-size':'cover'});
    hide("#JOHNMADDENA");
    hide("#select");
    hide("#selectgenocide");
	hide("#selectlambda");
	show("#lambda");
    },1000);
	});
	setTimeout(function(){
	//$("#img").css({transition:'20s'});
	$("#lambda").css({opacity:'1'});
	//$("#img").css({opacity:'0.4'});
	},1200);
	
	
	
	
	
	};

    var genocideA = function(){
	mouse();
    $("#img").css({transition:'1s'});
    $("#img").css({opacity:'0'});
    $("#miles").css({transition:'1s'});
    $("#miles2").css({transition:'1s'});
    $("#selectgenocide").css({transition:'1s'});
    $("#JOHNMADDENA").css({transition:'1s'});
    $("#select").css({transition:'1s'});
    $("#JOHNMADDENA").css({opacity:'0'});
    $("#miles2").css({opacity:'0'});
    $("#miles").css({opacity:'1'});
    $("#select").css({opacity:'0'});
    $("#selectgenocide").css({opacity:'0'});
    setTimeout(function(){
    $("#img").css({transition:'0'});
    $("#img").css({background:'url("http://puu.sh/9a8Bu/964190edb1.jpg") no-repeat center center fixed'});
    $("#miles").css({top:'50%',left:'70%',margin:'-'+($('#miles').height() / 2)+'px 0 0 -'+($('#miles').width() / 2)+'px'});
    hide("#miles2");
    hide("#JOHNMADDENA");
    hide("#select");
    hide("#selectgenocide");
    show("#genocide");
    },1000);

    setTimeout(function(){
    $("#miles").css({transition:'4s'});
    $("#img").css({transition:'4s'});
	if(is_chrome){
    $("#miles").css({opacity:'1'});
	};
    $("#genocide").css({opacity:'1'});
    $("#img").css({opacity:'0.3'});
    },1200);
    };

    $(document).ready(function(){
	$("#tubular-container").css({opacity:'1'});
    $("#miles").css({transition:'4s'});
    $("#miles2").css({transition:'4s'});
    $("#JOHNMADDENA").css({transition:'4s'});
    $("#img").css({transition:'0'});
    $("#img").css({background:'url("http://puu.sh/9baBy/e5f44dc6a6.png") no-repeat center center fixed'});
    setTimeout(function(){
    $("#miles").css({top:'50%',left:'50%',margin:'-'+($('#miles').height() / 2)+'px 0 0 -'+($('#miles').width() / 2)+'px'});
    $("#miles2").css({top:'50%',left:'50%',margin:'-'+($('#miles').height() / 2)+'px 0 0 -'+($('#miles').width() / 2)+'px'});
    $("#select").css({top:'70%',left:'50%',margin:'-'+($('#select').height() / 2)+'px 0 0 -'+($('#select').width() / 2)+'px'});
    $("#mileslambda").css({top:'50%',left:'50%',margin:'-'+($('#mileslambda').height() / 2)+'px 0 0 -'+($('#mileslambda').width() / 2)+'px'});
    $("#selectgenocide").css({top:'85%',left:'50%',margin:'-'+($('#selectgenocide').height() / 2)+'px 0 0 -'+($('#selectgenocide').width() / 2)+'px'});
	$("#selectlambda").css({top:'75%',left:'50%',margin:'-'+($('#selectlambda').height() / 2)+'px 0 0 -'+($('#selectlambda').width() / 2)+'px'});
    $("#img").css({transition:'4s'});
    $("#img").css({opacity:'0'});
    $("#JOHNMADDENA").text("λ");
    $("#JOHNMADDENA").css({top:'5%',left:'50%',margin:'-'+($('#JOHNMADDENA').height() / 2)+'px 0 0 -'+($('#JOHNMADDENA').width() / 2)+'px'});
    $("#JOHNMADDENA").css({opacity:'1'});
    $("#miles2").css({opacity:'0'});
	$("#miles").css({opacity:'1'});
    },500);
    setTimeout(function(){
	//$(".youtube").tubular({videoId: 'BOGrE5lwILY', start: 13});
    $("#selectgenocide").css({opacity:'1'});
    $("#select").css({transition:'4s'});
    $("#selectgenocide").css({transition:'4s'});
	$("#selectlambda").css({transition:'4s'});
	$("#selectlambda").css({opacity:'1'});
    $("#select").css({opacity:'1'});
    //setInterval(function(){
    //$( "#miles" ).effect( "shake", {times:144, distance:200, direction:"up"} );
    //$( "#miles2" ).effect( "shake", {times:144, distance:500, direction:"left"} );
    //},500);
    },2000);
    //setTimeout(function(){
    //window.location = "http://titan.pro/";
    //},11500);
    });

    var knuckles = new Array(
    "SHOXIE!",
    "o7 shox",
    "titan.com",
    "Protecting your rights.",
    "kennyS",
    "ScreaM",
    "Ex6TenZ",
    "SmithZz",
    "NBK"
    );
	

    $("#JOHNMADDENA").mouseenter(function(){
    $("#JOHNMADDENA").css({transition:'0.5s'});
    $("#JOHNMADDENA").css({opacity:'0.4'});
    }).mouseleave(function(){
    $("#JOHNMADDENA").css({opacity:'1'});
    });

    $("#select").mouseenter(function(){
    $("#select").css({transition:'0.5s'});
    $("#select").css({opacity:'0.4'});
    }).mouseleave(function(){
    $("#select").css({opacity:'1'});
    });

    $("#selectgenocide").mouseenter(function(){
    $("#selectgenocide").css({transition:'0.5s'});
    $("#selectgenocide").css({opacity:'0.4'});
    }).mouseleave(function(){
    $("#selectgenocide").css({opacity:'1'});
    });
	
	
	
	function mouse(){
	$("#JOHNMADDENA").mouseenter(function(){
    $("#JOHNMADDENA").css({transition:'0.5s'});
    $("#JOHNMADDENA").css({opacity:'0'});
    }).mouseleave(function(){
    $("#JOHNMADDENA").css({opacity:'0'});
    });

    $("#select").mouseenter(function(){
    $("#select").css({transition:'0.5s'});
    $("#select").css({opacity:'0'});
    }).mouseleave(function(){
    $("#select").css({opacity:'0'});
    });

    $("#selectgenocide").mouseenter(function(){
    $("#selectgenocide").css({transition:'0.5s'});
    $("#selectgenocide").css({opacity:'0'});
    }).mouseleave(function(){
    $("#selectgenocide").css({opacity:'0'});
    });
	};

var is_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;

var FIREFOX = /Firefox/i.test(navigator.userAgent);

//if (FIREFOX) {
//alert("NOTICE! Firefox does not work on this site. Please use Chrome. Thank you.");
//window.location = 'https://www.google.com/intl/en/chrome/browser/#eula'
//};

    //if(screen.height==1080)
    //    document.getElementById("miles").src = "img2/IMG_"+numRand+".png";
    //if(screen.height==768)
    //    document.getElementById("miles").src = "img768/IMG_"+numRand+".png";
  </script>


</body>