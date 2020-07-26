//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/	 	/*Update Interval*/	/*Update Signal*/
    {" 🐧 ", "kernel",		    3600,		        2},

	{" 🔺 ", "upt",		        60,		            2},

	{" 📦 ", "pacupdate",		1800,		        9},
	
	{" 💻 ", "memory",	        6,		            1},

    {" 🔋 ", "battery",         20,                 1},

	{" 🔊 ", "volume",			2,		            10},

	{" 🕑 ", "clock",			5,		            0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
