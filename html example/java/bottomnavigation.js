
//open checker
var nameopen = 0; 
var scoreopen = 0;

// position navigation array
  var appmasterarray = new Array;
	appmasterarray = ["#","letters.html","vocabulary.html","picturetoword.html","wordsearch.html","spelling.html","matchsingle.html","findmatch.html","findpicture.html","simplespell.html","scramble.html","matchdouble.html","#"];

//load
$(document).ready(function()
{

	globalmasterwrite ();//runs writer
	$(".globenavnext").on("mousedown", globenavnextaction);
	$(".globenavprev").on("mousedown", globenavprevaction);
	$(".globalreveal").on("mousedown", globalrevealaction);
	$(".globalprotector").on("mousedown", globalprotectoraction)
	$(".globalresetbutton").on("mousedown", globalresetbuttonaction);
	$(".globalnamesave").on("mousedown", globalnamesaveaction);
	$(".globalname").on("mousedown", globalnameaction);
	$(".globalscore").on("mousedown", globalscoreaction);

	//set on start	
	$(".globalpopups").hide();
	$(".globalvictory").hide();
	$(".globalnamepop").hide();

	//bookmode
	globalletterwriteraction ();
	$(".globalletterlist ul li").on (interaction, globalletterbuttonchoice);
	$(".globalbookoff").on (interaction, globalbookoffaction);
	

	return false;
});//end document ready

//masterwrite
function globalmasterwrite ()
{
	var globalwritevariable;
	
	globalwritevariable =
	"<div class='bottomnavigation'><div class='globalprotector'><div class='globalreddot'></div></div><a href='../abc.html'><div class='eduhome'>&#8962;</div></a><div class='globalresetbutton'>&#9055;</div><div class='subnav'><a href='"+appmasterarray[appmasterset]+"'><div class='globenavprev'>&#0060;</div></a><a href='"+appmasterarray[(appmasterset+2)]+"'><div class='globenavnext'>&#0062;</div></a></div><div class='globalname'>Name</div><div class='globalscore'>Score</div><div class='bookselect'>Book</div><div class='soundselect'>Sound</div><div class='globalcover'><div class='globalreveal'></div></div></div><div class='globalpopups'><div class='globalnamepop'><ul class='globalnamelist'><h1>Hello</h1><li class='globalname1'><h6 contenteditable='true'>NAME</h6><p>Unlock this level </p> </li> </ul> <div class='globalnamesave'> <p>save</p> </div></div><div class='globalvictory'><h1><span class='victoryname'>Your</span> Achievements</h1><ul class='playerrecord'> <li> <p> Level Up and Unlock Achievements </p></li></ul></div><div class='globalletterlist'><h6>Book Learning Mode</h6><ul></ul><h1 class='globalbookoff'>Off</h1></div></div>";

/*
	<div class='bottomnavigation'>
		
		<div class='globalprotector'>
			<div class='globalreddot'>
			</div>
		</div>
		
		<a href='../abc.html'>
			<div class='eduhome'>
				&#8962;
			</div>
		</a>
		
		<div class='globalresetbutton'>
			&#9055;
			</div>
		
		<div class='subnav'>
			<a href='"+appmasterarray[appmasterset]+"'>
				<div class='globenavprev'>
					&#0060;
				</div>
			</a>
			<a href='"+appmasterarray[(appmasterset+2)]+"'>
				<div class='globenavnext'>
					&#0062;
				</div>
			</a>
		</div>
		
		<div class='globalname'>
			Name
		</div>
		
		<div class='globalscore'>
			Score
		</div>
		
		<div class='bookselect'>
			Book
		</div>
		
		<div class='soundselect'>
			Sound
		</div>
		
		<div class='globalcover'>
			<div class='globalreveal'>
			</div>
		</div>
		
		<div class='globalletterlist'>
			<h6>
				Book Learning Mode
			</h6>
			<ul>
			</ul>
			<h1 class='globalbookoff'>
				Off
			</h1>
		</div>
		
	</div>
	
	<div class='globalpopups'>
	
		<div class='globalnamepop'>
		
			<ul class='globalnamelist'>
				<h1>	
					Hello
				</h1>
				<li class='globalname1'>
					<h6 contenteditable='true'>
						NAME
					</h6>
					<p>
						Unlock this level 
					</p>
				</li>
			</ul>
	
			<div class='globalnamesave'>
				<p>
					save
				</p>
			</div>
	
		</div> <!-- end name pop--

		<div class='globalvictory'>
		
			<h1>
				<span class='victoryname'>
					Your
				</span>
				Achievements
			</h1>
		
			<ul class='playerrecord'>
				<li>
					<p>
						Level Up and Unlock Achievements
					</p>
				</li>
			</ul>
		
		</div> <!-- end global victory -->
	
	</div> <!-- globalpops -->
*/

	$(".globalnavigationspace").html(globalwritevariable);
	globalwritevariable = null;
	
	//$(".playerrecord") overflowauto --- append and html <li><p>STUFF</p></li>
	
	return false;
}//end writer

//name check	
function globalnamecheck ()
{
	//value check
	var storagecheck;
	storagecheck = (localStorage.globalusername).length; 

	if (storagecheck > 0 )
	{
		$(".globalname1 h6 ").html(localStorage.globalusername);
		$(".victoryname").html(localStorage.globalusername + "'s");
	}
	storagecheck = null;
	return false;
}

//nav cleaner
function globenavnextaction()
{
	if (appmasterset == 10)
	{
		//empty
	}
	else
	{
		cleaner();
		globalcleaner ();
		localStorage.bookpageswitch = 0;
	}
	return false;
}

//nav cleaner
function globenavprevaction()
{
	if (appmasterset == 0)
	{
		//empty
	}
	else
	{
		cleaner();
		globalcleaner ();
		localStorage.bookpageswitch = 0;
		
	}
	return false;
}

//uncover
function globalrevealaction()
{
	$(".globalcover").removeClass("globalzindex");
	return false;
}

//cover
function globalprotectoraction()
{
	$(".globalcover").addClass("globalzindex");
	return false;
}

//reset
function globalresetbuttonaction()
{  
	cleaner();
	globalcleaner();
	window.location.reload();
	return false;
}

//savebutton
function globalnamesaveaction()
{
	localStorage.globalusername = $(".globalname1 h6").html();
	return false;
}

//showname
function globalnameaction()
{
	if (nameopen == 0 && scoreopen == 0)
	{		
		$(".globalpopups").show();
		$(".globalnamepop").show();
		$(".globalname").addClass('redhighlight')
		
		nameopen=1;
		globalnamecheck ();
	}

	else if (nameopen == 0 && scoreopen == 1)
	{
		$(".globalpopups").show();
		$(".globalnamepop").show();
		nameopen=1;
		scoreopen=0;	
		$(".globalvictory").hide();
		globalnamecheck ();
		$(".globalname").addClass('redhighlight');
		$(".globalscore").removeClass('redhighlight');
	}

	else if (nameopen == 1)
	{
		$(".globalpopups").hide();
		$(".globalnamepop").hide();
		nameopen=0;	
		$(".globalname").removeClass('redhighlight');
	}
	return false;
}

//show victory
function globalscoreaction()
{	
	if (scoreopen == 0 && nameopen == 0)
	{
		$(".globalpopups").show();
		$(".globalvictory").show();
		scoreopen=1;
		globalnamecheck ();
		$(".globalscore").addClass('redhighlight');
	}
	
	else if (scoreopen == 0 && nameopen == 1)
	{
		$(".globalpopups").show();
		$(".globalvictory").show();
		scoreopen=1;
		nameopen=0;	
		$(".globalnamepop").hide();
		$(".globalscore").addClass('redhighlight');
		$(".globalname").removeClass('redhighlight');
		
		globalnamecheck ();
	}
	
	else if (scoreopen == 1)
	{
		$(".globalpopups").hide();
		$(".globalvictory").hide();
		scoreopen=0;
		$(".globalscore").removeClass('redhighlight');
	}
	return false;
}

//cleaner
function globalcleaner ()
{
	globalwritevariable = null;
	globalmasterwrite = null;
	globalnamecheck = null;
	appmasterarray = null;
	globenavnextaction = null;
	globalrevealaction = null;
	globalprotectoraction = null;
	globalresetbuttonaction = null;
	globalnamesaveaction = null;
	globalnameaction = null;
	globalscoreaction = null;
	nameopen = null;
	scoreopen = null;
	
	//letter menu
	lettermenuindex = null;
	lmp1 = null;
	lmp2 = null;
	lmp3 = null;
	lmp4 = null;
	lettervar1 = null;
	lettervar2 = null;
	lettervar3 = null;
	lettervar4 = null;
	lettermod = null;
	menuaction01 = null;
	menuaction02 = null;
	menuaction03 = null;	
	menuaction04 = null;
	lettermenuleftaction  = null;
	lettermenurightaction = null;
	lettermenutoggleaction = null;
	
	//book
	globalletterwriteraction = null;
	globalletterbuttonchoice = null;
	globalbookoffaction= null;
	bookpower = null;
	booksetdata = null;
	
	return false;;
}

//bookmode
function globalletterwriteraction ()
{
	//data
	var templetterarray = new Array(); 
	templetterarray = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
	var tempwrite = "";
	for (i=0;i<26;i++)
	{
			tempwrite += "<li class='globalletter"+i+"'>"+templetterarray[i]+"</li>";
	}
	
	//write
	$(".globalletterlist ul").html(tempwrite);
	
	//clean
	tempwrite = null;
	return false;
}

function globalletterbuttonchoice ()
{
	//data
	var tempvar;
	tempvar = $(this).attr('class');
	$(".globalletterlist ul li").removeClass('globalletterlistcurrent');
	$(this).addClass('globalletterlistcurrent');
	tempvar = tempvar.replace("globalletter","");

	//storage
	localStorage.bookpagestorage = tempvar;
	localStorage.bookswitchsave = "yes";

	//data
	bookset = 1;
	$(".bookselect").addClass('redhighlight');
	
	//action
	booksetdata ();
	
	//clean
	tempvar = null;
	return false;
}

function globalbookoffaction ()
{
	localStorage.bookswitchsave = "no";
	bookset = 0;
	$(".bookselect").removeClass('redhighlight');
	$(".globalletterlist ul li").removeClass('globalletterlistcurrent');
	return false;
}

function bookpower()
{
	if ($(".globalletterlist").is(":hidden"))
	{
		$(".globalletterlist").show();
		$(".globalpopups").show();
	}
	else
	{
		$(".globalletterlist").hide();
		$(".globalpopups").hide();	
	}
	return false;
}

//setter
function booksetdata ()
{
	localStorage.bookdatastorage = datainput;
	return false;	
}
