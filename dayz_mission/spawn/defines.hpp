#define CT_STATICe 0
#define CT_BUTTONe 1
#define ST_CENTERe 0x02
#define ST_PICTUREe 0x30
#define ST_FRAMEe 0x40
class RscButtone
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = {0.8784,0.8471,0.651,1};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {1,0.537,0,0.5};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	colorBackgroundActive[] = {1,0.537,0,1};
	colorFocused[] = {1,0.537,0,1};
	colorShadow[] = {0.023529,0,0.0313725,1};
	colorBorder[] = {0.023529,0,0.0313725,1};
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};
class RscFramee
{
    type = CT_STATICe;
    idc = -1;
    style = ST_FRAMEe;
    shadow = 2;
    colorBackground[] = {1,1,1,1};
    colorText[] = {1,1,1,0.9};
    font = "Bitstream";
    sizeEx = 0.03;
    text = "";
};
class Boxe
{ 
    type = CT_STATICe;
    idc = -1;
    style = ST_CENTERe;
    shadow = 2;
    colorText[] = {1,1,1,1};
    font = "Bitstream";
    sizeEx = 0.02;
    colorBackground[] = { 0.2,0.2,0.2, 0.9 }; 
    text = ""; 
};