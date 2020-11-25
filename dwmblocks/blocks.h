//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/	 	/*Update Interval*/	/*Update Signal*/
    {"",     "battery",         5,                  3},

	{"", "volume",  			0,		            10},

	{" 🕑 ", "clock",			60,		            1},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
