
var lettermenuindex = 0 
var lmp1 = 0;
var lmp2 = 1;
var lmp3 = 2;
var lmp4 = 3;
var lettervar1;
var lettervar2;
var lettervar3;
var lettervar4;
var lettermod;

/*
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
*/

$(document).ready(function()
{
	$(".lettermenuleft").on(interaction, lettermenuleftaction);
	$(".lettermenuright").on(interaction, lettermenurightaction);
	$(".lettermenutoggle").on(interaction, lettermenutoggleaction);
	
	//lettermenu
	$(".lettermenu1").on(interaction, menuaction01);
	$(".lettermenu2").on(interaction, menuaction02);
	$(".lettermenu3").on(interaction, menuaction03);
	$(".lettermenu4").on(interaction, menuaction04);
	
	//view
	$(".lettermenucontainer").hide();
	
	return false;
});

//backward
function lettermenuleftaction()
{
	
	if (lettermenuindex == 0)
	{
		lettermenuindex = 6;
		lettermod = (lettermenuindex * 4)-2;
	}
	
	else if (lettermenuindex < 7)
	{	
		lettermenuindex --;
		lettermod = (lettermenuindex * 4);
	}

	lmp1 = lettermod;
	lmp2 = lettermod + 1;
	lmp3 = lettermod + 2;
	lmp4 = lettermod +3;
	
	lettervar1 = "&#00" + (65 + lmp1);
	lettervar2 = "&#00" + (65 + lmp2);
	lettervar3 = "&#00" + (65 + lmp3);
	lettervar4 = "&#00" + (65 + lmp4);
	
	$(".lettermenu1").attr("id", lmp1);
	$(".lettermenu2").attr("id", lmp2);
	$(".lettermenu3").attr("id", lmp3);
	$(".lettermenu4").attr("id", lmp4);
	
	$(".lettermenu1").html(lettervar1);
	$(".lettermenu2").html(lettervar2);
	$(".lettermenu3").html(lettervar3);
	$(".lettermenu4").html(lettervar4);
	return false;
}

//forward
function lettermenurightaction()
{

	if (lettermenuindex == 5)
	{
		lettermod = (lettermenuindex * 4) + 2;
		lettermenuindex ++;
	}
	
	else if (lettermenuindex == 6)
	{
		lettermenuindex = 0;
		lettermod = lettermenuindex * 4;				
	}
	
	else if (lettermenuindex >= 0)
	{
		lettermenuindex ++;
		lettermod = lettermenuindex * 4;	
	}
	
	lmp1 = lettermod;
	lmp2 = lettermod + 1;
	lmp3 = lettermod + 2;
	lmp4 = lettermod +3;

	lettervar1 = "&#00" + (65 + lmp1);
	lettervar2 = "&#00" + (65 + lmp2);
	lettervar3 = "&#00" + (65 + lmp3);
	lettervar4 = "&#00" + (65 + lmp4);
	
	$(".lettermenu1").attr("id", lmp1);
	$(".lettermenu2").attr("id", lmp2);
	$(".lettermenu3").attr("id", lmp3);
	$(".lettermenu4").attr("id", lmp4);
	
	$(".lettermenu1").html(lettervar1);
	$(".lettermenu2").html(lettervar2);
	$(".lettermenu3").html(lettervar3);
	$(".lettermenu4").html(lettervar4);
	return false;
}

function lettermenutoggleaction()
{
	$(".lettermenucontainer").fadeToggle();
	return false;	
}
	