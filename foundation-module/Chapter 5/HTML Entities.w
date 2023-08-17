[HTMLEntities::] HTML Entities.

Utility functions for dealing with those ampersanded paraphrases of characters
which seemed like a good idea in around the year 2000.

@ The following returns |TRUE| if |entity| is a valid HTML5 entity: note that
this includes some with no trailing semicolon. (I didn't make these rules.)

If the pointers |A| and |B| are non-null, they are set to the Unicode code points
for the character referred to by the entity. |B| is zero unless this is a digraph.

If the |entity| is not valid, neither |A| nor |B| is written to, and |FALSE|
is returned.

=
int HTMLEntities::parse(text_stream *entity, wchar_t *A, wchar_t *B) {
	if (Str::get_at(entity, 0) != '&') return FALSE;
// PRINT("Entity: <%S>\n", entity);
	if (Str::get_at(entity, 1) == '#') {
		int base = 10, from = 2;
		if ((Str::get_at(entity, 2) == 'x') || (Str::get_at(entity, 2) == 'X')) {
			base = 16; from = 3;
		}
		int total = 0, dc = 0;
		while (Str::get_at(entity, from)) {
			int dval = -1;
			wchar_t digit = Str::get_at(entity, from);
// PRINT("Digit: <%c>\n", digit);
			if ((digit >= '0') && (digit <= '9')) dval = (int) digit - (int) '0';
			else if ((base == 16) && (digit >= 'a') && (digit <= 'f')) dval = 10 + (int) digit - (int) 'a';
			else if ((base == 16) && (digit >= 'A') && (digit <= 'F')) dval = 10 + (int) digit - (int) 'A';
			else if (digit == ';') break;
			else return FALSE;
			total = base*total + dval; dc++;
			from++;
			if (dc > 7) return FALSE;
		}
		if (dc == 0) return FALSE;
		if (A) *A = total; if (B) *B = 0;
		return TRUE;
	} else {
		switch (Str::get_at(entity, 1)) {
			case 'A':
				if (Str::eq(entity, I"&AElig")) { if (A) *A = 198; return TRUE; }
				if (Str::eq(entity, I"&AElig;")) { if (A) *A = 198; return TRUE; }
				if (Str::eq(entity, I"&AMP")) { if (A) *A = 38; return TRUE; }
				if (Str::eq(entity, I"&AMP;")) { if (A) *A = 38; return TRUE; }
				if (Str::eq(entity, I"&Aacute")) { if (A) *A = 193; return TRUE; }
				if (Str::eq(entity, I"&Aacute;")) { if (A) *A = 193; return TRUE; }
				if (Str::eq(entity, I"&Abreve;")) { if (A) *A = 258; return TRUE; }
				if (Str::eq(entity, I"&Acirc")) { if (A) *A = 194; return TRUE; }
				if (Str::eq(entity, I"&Acirc;")) { if (A) *A = 194; return TRUE; }
				if (Str::eq(entity, I"&Acy;")) { if (A) *A = 1040; return TRUE; }
				if (Str::eq(entity, I"&Afr;")) { if (A) *A = 120068; return TRUE; }
				if (Str::eq(entity, I"&Agrave")) { if (A) *A = 192; return TRUE; }
				if (Str::eq(entity, I"&Agrave;")) { if (A) *A = 192; return TRUE; }
				if (Str::eq(entity, I"&Alpha;")) { if (A) *A = 913; return TRUE; }
				if (Str::eq(entity, I"&Amacr;")) { if (A) *A = 256; return TRUE; }
				if (Str::eq(entity, I"&And;")) { if (A) *A = 10835; return TRUE; }
				if (Str::eq(entity, I"&Aogon;")) { if (A) *A = 260; return TRUE; }
				if (Str::eq(entity, I"&Aopf;")) { if (A) *A = 120120; return TRUE; }
				if (Str::eq(entity, I"&ApplyFunction;")) { if (A) *A = 8289; return TRUE; }
				if (Str::eq(entity, I"&Aring")) { if (A) *A = 197; return TRUE; }
				if (Str::eq(entity, I"&Aring;")) { if (A) *A = 197; return TRUE; }
				if (Str::eq(entity, I"&Ascr;")) { if (A) *A = 119964; return TRUE; }
				if (Str::eq(entity, I"&Assign;")) { if (A) *A = 8788; return TRUE; }
				if (Str::eq(entity, I"&Atilde")) { if (A) *A = 195; return TRUE; }
				if (Str::eq(entity, I"&Atilde;")) { if (A) *A = 195; return TRUE; }
				if (Str::eq(entity, I"&Auml")) { if (A) *A = 196; return TRUE; }
				if (Str::eq(entity, I"&Auml;")) { if (A) *A = 196; return TRUE; }
				break;
			case 'B':
				if (Str::eq(entity, I"&Backslash;")) { if (A) *A = 8726; return TRUE; }
				if (Str::eq(entity, I"&Barv;")) { if (A) *A = 10983; return TRUE; }
				if (Str::eq(entity, I"&Barwed;")) { if (A) *A = 8966; return TRUE; }
				if (Str::eq(entity, I"&Bcy;")) { if (A) *A = 1041; return TRUE; }
				if (Str::eq(entity, I"&Because;")) { if (A) *A = 8757; return TRUE; }
				if (Str::eq(entity, I"&Bernoullis;")) { if (A) *A = 8492; return TRUE; }
				if (Str::eq(entity, I"&Beta;")) { if (A) *A = 914; return TRUE; }
				if (Str::eq(entity, I"&Bfr;")) { if (A) *A = 120069; return TRUE; }
				if (Str::eq(entity, I"&Bopf;")) { if (A) *A = 120121; return TRUE; }
				if (Str::eq(entity, I"&Breve;")) { if (A) *A = 728; return TRUE; }
				if (Str::eq(entity, I"&Bscr;")) { if (A) *A = 8492; return TRUE; }
				if (Str::eq(entity, I"&Bumpeq;")) { if (A) *A = 8782; return TRUE; }
				break;
			case 'C':
				if (Str::eq(entity, I"&CHcy;")) { if (A) *A = 1063; return TRUE; }
				if (Str::eq(entity, I"&COPY")) { if (A) *A = 169; return TRUE; }
				if (Str::eq(entity, I"&COPY;")) { if (A) *A = 169; return TRUE; }
				if (Str::eq(entity, I"&Cacute;")) { if (A) *A = 262; return TRUE; }
				if (Str::eq(entity, I"&Cap;")) { if (A) *A = 8914; return TRUE; }
				if (Str::eq(entity, I"&CapitalDifferentialD;")) { if (A) *A = 8517; return TRUE; }
				if (Str::eq(entity, I"&Cayleys;")) { if (A) *A = 8493; return TRUE; }
				if (Str::eq(entity, I"&Ccaron;")) { if (A) *A = 268; return TRUE; }
				if (Str::eq(entity, I"&Ccedil")) { if (A) *A = 199; return TRUE; }
				if (Str::eq(entity, I"&Ccedil;")) { if (A) *A = 199; return TRUE; }
				if (Str::eq(entity, I"&Ccirc;")) { if (A) *A = 264; return TRUE; }
				if (Str::eq(entity, I"&Cconint;")) { if (A) *A = 8752; return TRUE; }
				if (Str::eq(entity, I"&Cdot;")) { if (A) *A = 266; return TRUE; }
				if (Str::eq(entity, I"&Cedilla;")) { if (A) *A = 184; return TRUE; }
				if (Str::eq(entity, I"&CenterDot;")) { if (A) *A = 183; return TRUE; }
				if (Str::eq(entity, I"&Cfr;")) { if (A) *A = 8493; return TRUE; }
				if (Str::eq(entity, I"&Chi;")) { if (A) *A = 935; return TRUE; }
				if (Str::eq(entity, I"&CircleDot;")) { if (A) *A = 8857; return TRUE; }
				if (Str::eq(entity, I"&CircleMinus;")) { if (A) *A = 8854; return TRUE; }
				if (Str::eq(entity, I"&CirclePlus;")) { if (A) *A = 8853; return TRUE; }
				if (Str::eq(entity, I"&CircleTimes;")) { if (A) *A = 8855; return TRUE; }
				if (Str::eq(entity, I"&ClockwiseContourIntegral;")) { if (A) *A = 8754; return TRUE; }
				if (Str::eq(entity, I"&CloseCurlyDoubleQuote;")) { if (A) *A = 8221; return TRUE; }
				if (Str::eq(entity, I"&CloseCurlyQuote;")) { if (A) *A = 8217; return TRUE; }
				if (Str::eq(entity, I"&Colon;")) { if (A) *A = 8759; return TRUE; }
				if (Str::eq(entity, I"&Colone;")) { if (A) *A = 10868; return TRUE; }
				if (Str::eq(entity, I"&Congruent;")) { if (A) *A = 8801; return TRUE; }
				if (Str::eq(entity, I"&Conint;")) { if (A) *A = 8751; return TRUE; }
				if (Str::eq(entity, I"&ContourIntegral;")) { if (A) *A = 8750; return TRUE; }
				if (Str::eq(entity, I"&Copf;")) { if (A) *A = 8450; return TRUE; }
				if (Str::eq(entity, I"&Coproduct;")) { if (A) *A = 8720; return TRUE; }
				if (Str::eq(entity, I"&CounterClockwiseContourIntegral;")) { if (A) *A = 8755; return TRUE; }
				if (Str::eq(entity, I"&Cross;")) { if (A) *A = 10799; return TRUE; }
				if (Str::eq(entity, I"&Cscr;")) { if (A) *A = 119966; return TRUE; }
				if (Str::eq(entity, I"&Cup;")) { if (A) *A = 8915; return TRUE; }
				if (Str::eq(entity, I"&CupCap;")) { if (A) *A = 8781; return TRUE; }
				break;
			case 'D':
				if (Str::eq(entity, I"&DD;")) { if (A) *A = 8517; return TRUE; }
				if (Str::eq(entity, I"&DDotrahd;")) { if (A) *A = 10513; return TRUE; }
				if (Str::eq(entity, I"&DJcy;")) { if (A) *A = 1026; return TRUE; }
				if (Str::eq(entity, I"&DScy;")) { if (A) *A = 1029; return TRUE; }
				if (Str::eq(entity, I"&DZcy;")) { if (A) *A = 1039; return TRUE; }
				if (Str::eq(entity, I"&Dagger;")) { if (A) *A = 8225; return TRUE; }
				if (Str::eq(entity, I"&Darr;")) { if (A) *A = 8609; return TRUE; }
				if (Str::eq(entity, I"&Dashv;")) { if (A) *A = 10980; return TRUE; }
				if (Str::eq(entity, I"&Dcaron;")) { if (A) *A = 270; return TRUE; }
				if (Str::eq(entity, I"&Dcy;")) { if (A) *A = 1044; return TRUE; }
				if (Str::eq(entity, I"&Del;")) { if (A) *A = 8711; return TRUE; }
				if (Str::eq(entity, I"&Delta;")) { if (A) *A = 916; return TRUE; }
				if (Str::eq(entity, I"&Dfr;")) { if (A) *A = 120071; return TRUE; }
				if (Str::eq(entity, I"&DiacriticalAcute;")) { if (A) *A = 180; return TRUE; }
				if (Str::eq(entity, I"&DiacriticalDot;")) { if (A) *A = 729; return TRUE; }
				if (Str::eq(entity, I"&DiacriticalDoubleAcute;")) { if (A) *A = 733; return TRUE; }
				if (Str::eq(entity, I"&DiacriticalGrave;")) { if (A) *A = 96; return TRUE; }
				if (Str::eq(entity, I"&DiacriticalTilde;")) { if (A) *A = 732; return TRUE; }
				if (Str::eq(entity, I"&Diamond;")) { if (A) *A = 8900; return TRUE; }
				if (Str::eq(entity, I"&DifferentialD;")) { if (A) *A = 8518; return TRUE; }
				if (Str::eq(entity, I"&Dopf;")) { if (A) *A = 120123; return TRUE; }
				if (Str::eq(entity, I"&Dot;")) { if (A) *A = 168; return TRUE; }
				if (Str::eq(entity, I"&DotDot;")) { if (A) *A = 8412; return TRUE; }
				if (Str::eq(entity, I"&DotEqual;")) { if (A) *A = 8784; return TRUE; }
				if (Str::eq(entity, I"&DoubleContourIntegral;")) { if (A) *A = 8751; return TRUE; }
				if (Str::eq(entity, I"&DoubleDot;")) { if (A) *A = 168; return TRUE; }
				if (Str::eq(entity, I"&DoubleDownArrow;")) { if (A) *A = 8659; return TRUE; }
				if (Str::eq(entity, I"&DoubleLeftArrow;")) { if (A) *A = 8656; return TRUE; }
				if (Str::eq(entity, I"&DoubleLeftRightArrow;")) { if (A) *A = 8660; return TRUE; }
				if (Str::eq(entity, I"&DoubleLeftTee;")) { if (A) *A = 10980; return TRUE; }
				if (Str::eq(entity, I"&DoubleLongLeftArrow;")) { if (A) *A = 10232; return TRUE; }
				if (Str::eq(entity, I"&DoubleLongLeftRightArrow;")) { if (A) *A = 10234; return TRUE; }
				if (Str::eq(entity, I"&DoubleLongRightArrow;")) { if (A) *A = 10233; return TRUE; }
				if (Str::eq(entity, I"&DoubleRightArrow;")) { if (A) *A = 8658; return TRUE; }
				if (Str::eq(entity, I"&DoubleRightTee;")) { if (A) *A = 8872; return TRUE; }
				if (Str::eq(entity, I"&DoubleUpArrow;")) { if (A) *A = 8657; return TRUE; }
				if (Str::eq(entity, I"&DoubleUpDownArrow;")) { if (A) *A = 8661; return TRUE; }
				if (Str::eq(entity, I"&DoubleVerticalBar;")) { if (A) *A = 8741; return TRUE; }
				if (Str::eq(entity, I"&DownArrow;")) { if (A) *A = 8595; return TRUE; }
				if (Str::eq(entity, I"&DownArrowBar;")) { if (A) *A = 10515; return TRUE; }
				if (Str::eq(entity, I"&DownArrowUpArrow;")) { if (A) *A = 8693; return TRUE; }
				if (Str::eq(entity, I"&DownBreve;")) { if (A) *A = 785; return TRUE; }
				if (Str::eq(entity, I"&DownLeftRightVector;")) { if (A) *A = 10576; return TRUE; }
				if (Str::eq(entity, I"&DownLeftTeeVector;")) { if (A) *A = 10590; return TRUE; }
				if (Str::eq(entity, I"&DownLeftVector;")) { if (A) *A = 8637; return TRUE; }
				if (Str::eq(entity, I"&DownLeftVectorBar;")) { if (A) *A = 10582; return TRUE; }
				if (Str::eq(entity, I"&DownRightTeeVector;")) { if (A) *A = 10591; return TRUE; }
				if (Str::eq(entity, I"&DownRightVector;")) { if (A) *A = 8641; return TRUE; }
				if (Str::eq(entity, I"&DownRightVectorBar;")) { if (A) *A = 10583; return TRUE; }
				if (Str::eq(entity, I"&DownTee;")) { if (A) *A = 8868; return TRUE; }
				if (Str::eq(entity, I"&DownTeeArrow;")) { if (A) *A = 8615; return TRUE; }
				if (Str::eq(entity, I"&Downarrow;")) { if (A) *A = 8659; return TRUE; }
				if (Str::eq(entity, I"&Dscr;")) { if (A) *A = 119967; return TRUE; }
				if (Str::eq(entity, I"&Dstrok;")) { if (A) *A = 272; return TRUE; }
				break;
			case 'E':
				if (Str::eq(entity, I"&ENG;")) { if (A) *A = 330; return TRUE; }
				if (Str::eq(entity, I"&ETH")) { if (A) *A = 208; return TRUE; }
				if (Str::eq(entity, I"&ETH;")) { if (A) *A = 208; return TRUE; }
				if (Str::eq(entity, I"&Eacute")) { if (A) *A = 201; return TRUE; }
				if (Str::eq(entity, I"&Eacute;")) { if (A) *A = 201; return TRUE; }
				if (Str::eq(entity, I"&Ecaron;")) { if (A) *A = 282; return TRUE; }
				if (Str::eq(entity, I"&Ecirc")) { if (A) *A = 202; return TRUE; }
				if (Str::eq(entity, I"&Ecirc;")) { if (A) *A = 202; return TRUE; }
				if (Str::eq(entity, I"&Ecy;")) { if (A) *A = 1069; return TRUE; }
				if (Str::eq(entity, I"&Edot;")) { if (A) *A = 278; return TRUE; }
				if (Str::eq(entity, I"&Efr;")) { if (A) *A = 120072; return TRUE; }
				if (Str::eq(entity, I"&Egrave")) { if (A) *A = 200; return TRUE; }
				if (Str::eq(entity, I"&Egrave;")) { if (A) *A = 200; return TRUE; }
				if (Str::eq(entity, I"&Element;")) { if (A) *A = 8712; return TRUE; }
				if (Str::eq(entity, I"&Emacr;")) { if (A) *A = 274; return TRUE; }
				if (Str::eq(entity, I"&EmptySmallSquare;")) { if (A) *A = 9723; return TRUE; }
				if (Str::eq(entity, I"&EmptyVerySmallSquare;")) { if (A) *A = 9643; return TRUE; }
				if (Str::eq(entity, I"&Eogon;")) { if (A) *A = 280; return TRUE; }
				if (Str::eq(entity, I"&Eopf;")) { if (A) *A = 120124; return TRUE; }
				if (Str::eq(entity, I"&Epsilon;")) { if (A) *A = 917; return TRUE; }
				if (Str::eq(entity, I"&Equal;")) { if (A) *A = 10869; return TRUE; }
				if (Str::eq(entity, I"&EqualTilde;")) { if (A) *A = 8770; return TRUE; }
				if (Str::eq(entity, I"&Equilibrium;")) { if (A) *A = 8652; return TRUE; }
				if (Str::eq(entity, I"&Escr;")) { if (A) *A = 8496; return TRUE; }
				if (Str::eq(entity, I"&Esim;")) { if (A) *A = 10867; return TRUE; }
				if (Str::eq(entity, I"&Eta;")) { if (A) *A = 919; return TRUE; }
				if (Str::eq(entity, I"&Euml")) { if (A) *A = 203; return TRUE; }
				if (Str::eq(entity, I"&Euml;")) { if (A) *A = 203; return TRUE; }
				if (Str::eq(entity, I"&Exists;")) { if (A) *A = 8707; return TRUE; }
				if (Str::eq(entity, I"&ExponentialE;")) { if (A) *A = 8519; return TRUE; }
				break;
			case 'F':
				if (Str::eq(entity, I"&Fcy;")) { if (A) *A = 1060; return TRUE; }
				if (Str::eq(entity, I"&Ffr;")) { if (A) *A = 120073; return TRUE; }
				if (Str::eq(entity, I"&FilledSmallSquare;")) { if (A) *A = 9724; return TRUE; }
				if (Str::eq(entity, I"&FilledVerySmallSquare;")) { if (A) *A = 9642; return TRUE; }
				if (Str::eq(entity, I"&Fopf;")) { if (A) *A = 120125; return TRUE; }
				if (Str::eq(entity, I"&ForAll;")) { if (A) *A = 8704; return TRUE; }
				if (Str::eq(entity, I"&Fouriertrf;")) { if (A) *A = 8497; return TRUE; }
				if (Str::eq(entity, I"&Fscr;")) { if (A) *A = 8497; return TRUE; }
				break;
			case 'G':
				if (Str::eq(entity, I"&GJcy;")) { if (A) *A = 1027; return TRUE; }
				if (Str::eq(entity, I"&GT")) { if (A) *A = 62; return TRUE; }
				if (Str::eq(entity, I"&GT;")) { if (A) *A = 62; return TRUE; }
				if (Str::eq(entity, I"&Gamma;")) { if (A) *A = 915; return TRUE; }
				if (Str::eq(entity, I"&Gammad;")) { if (A) *A = 988; return TRUE; }
				if (Str::eq(entity, I"&Gbreve;")) { if (A) *A = 286; return TRUE; }
				if (Str::eq(entity, I"&Gcedil;")) { if (A) *A = 290; return TRUE; }
				if (Str::eq(entity, I"&Gcirc;")) { if (A) *A = 284; return TRUE; }
				if (Str::eq(entity, I"&Gcy;")) { if (A) *A = 1043; return TRUE; }
				if (Str::eq(entity, I"&Gdot;")) { if (A) *A = 288; return TRUE; }
				if (Str::eq(entity, I"&Gfr;")) { if (A) *A = 120074; return TRUE; }
				if (Str::eq(entity, I"&Gg;")) { if (A) *A = 8921; return TRUE; }
				if (Str::eq(entity, I"&Gopf;")) { if (A) *A = 120126; return TRUE; }
				if (Str::eq(entity, I"&GreaterEqual;")) { if (A) *A = 8805; return TRUE; }
				if (Str::eq(entity, I"&GreaterEqualLess;")) { if (A) *A = 8923; return TRUE; }
				if (Str::eq(entity, I"&GreaterFullEqual;")) { if (A) *A = 8807; return TRUE; }
				if (Str::eq(entity, I"&GreaterGreater;")) { if (A) *A = 10914; return TRUE; }
				if (Str::eq(entity, I"&GreaterLess;")) { if (A) *A = 8823; return TRUE; }
				if (Str::eq(entity, I"&GreaterSlantEqual;")) { if (A) *A = 10878; return TRUE; }
				if (Str::eq(entity, I"&GreaterTilde;")) { if (A) *A = 8819; return TRUE; }
				if (Str::eq(entity, I"&Gscr;")) { if (A) *A = 119970; return TRUE; }
				if (Str::eq(entity, I"&Gt;")) { if (A) *A = 8811; return TRUE; }
				break;
			case 'H':
				if (Str::eq(entity, I"&HARDcy;")) { if (A) *A = 1066; return TRUE; }
				if (Str::eq(entity, I"&Hacek;")) { if (A) *A = 711; return TRUE; }
				if (Str::eq(entity, I"&Hat;")) { if (A) *A = 94; return TRUE; }
				if (Str::eq(entity, I"&Hcirc;")) { if (A) *A = 292; return TRUE; }
				if (Str::eq(entity, I"&Hfr;")) { if (A) *A = 8460; return TRUE; }
				if (Str::eq(entity, I"&HilbertSpace;")) { if (A) *A = 8459; return TRUE; }
				if (Str::eq(entity, I"&Hopf;")) { if (A) *A = 8461; return TRUE; }
				if (Str::eq(entity, I"&HorizontalLine;")) { if (A) *A = 9472; return TRUE; }
				if (Str::eq(entity, I"&Hscr;")) { if (A) *A = 8459; return TRUE; }
				if (Str::eq(entity, I"&Hstrok;")) { if (A) *A = 294; return TRUE; }
				if (Str::eq(entity, I"&HumpDownHump;")) { if (A) *A = 8782; return TRUE; }
				if (Str::eq(entity, I"&HumpEqual;")) { if (A) *A = 8783; return TRUE; }
				break;
			case 'I':
				if (Str::eq(entity, I"&IEcy;")) { if (A) *A = 1045; return TRUE; }
				if (Str::eq(entity, I"&IJlig;")) { if (A) *A = 306; return TRUE; }
				if (Str::eq(entity, I"&IOcy;")) { if (A) *A = 1025; return TRUE; }
				if (Str::eq(entity, I"&Iacute")) { if (A) *A = 205; return TRUE; }
				if (Str::eq(entity, I"&Iacute;")) { if (A) *A = 205; return TRUE; }
				if (Str::eq(entity, I"&Icirc")) { if (A) *A = 206; return TRUE; }
				if (Str::eq(entity, I"&Icirc;")) { if (A) *A = 206; return TRUE; }
				if (Str::eq(entity, I"&Icy;")) { if (A) *A = 1048; return TRUE; }
				if (Str::eq(entity, I"&Idot;")) { if (A) *A = 304; return TRUE; }
				if (Str::eq(entity, I"&Ifr;")) { if (A) *A = 8465; return TRUE; }
				if (Str::eq(entity, I"&Igrave")) { if (A) *A = 204; return TRUE; }
				if (Str::eq(entity, I"&Igrave;")) { if (A) *A = 204; return TRUE; }
				if (Str::eq(entity, I"&Im;")) { if (A) *A = 8465; return TRUE; }
				if (Str::eq(entity, I"&Imacr;")) { if (A) *A = 298; return TRUE; }
				if (Str::eq(entity, I"&ImaginaryI;")) { if (A) *A = 8520; return TRUE; }
				if (Str::eq(entity, I"&Implies;")) { if (A) *A = 8658; return TRUE; }
				if (Str::eq(entity, I"&Int;")) { if (A) *A = 8748; return TRUE; }
				if (Str::eq(entity, I"&Integral;")) { if (A) *A = 8747; return TRUE; }
				if (Str::eq(entity, I"&Intersection;")) { if (A) *A = 8898; return TRUE; }
				if (Str::eq(entity, I"&InvisibleComma;")) { if (A) *A = 8291; return TRUE; }
				if (Str::eq(entity, I"&InvisibleTimes;")) { if (A) *A = 8290; return TRUE; }
				if (Str::eq(entity, I"&Iogon;")) { if (A) *A = 302; return TRUE; }
				if (Str::eq(entity, I"&Iopf;")) { if (A) *A = 120128; return TRUE; }
				if (Str::eq(entity, I"&Iota;")) { if (A) *A = 921; return TRUE; }
				if (Str::eq(entity, I"&Iscr;")) { if (A) *A = 8464; return TRUE; }
				if (Str::eq(entity, I"&Itilde;")) { if (A) *A = 296; return TRUE; }
				if (Str::eq(entity, I"&Iukcy;")) { if (A) *A = 1030; return TRUE; }
				if (Str::eq(entity, I"&Iuml")) { if (A) *A = 207; return TRUE; }
				if (Str::eq(entity, I"&Iuml;")) { if (A) *A = 207; return TRUE; }
				break;
			case 'J':
				if (Str::eq(entity, I"&Jcirc;")) { if (A) *A = 308; return TRUE; }
				if (Str::eq(entity, I"&Jcy;")) { if (A) *A = 1049; return TRUE; }
				if (Str::eq(entity, I"&Jfr;")) { if (A) *A = 120077; return TRUE; }
				if (Str::eq(entity, I"&Jopf;")) { if (A) *A = 120129; return TRUE; }
				if (Str::eq(entity, I"&Jscr;")) { if (A) *A = 119973; return TRUE; }
				if (Str::eq(entity, I"&Jsercy;")) { if (A) *A = 1032; return TRUE; }
				if (Str::eq(entity, I"&Jukcy;")) { if (A) *A = 1028; return TRUE; }
				break;
			case 'K':
				if (Str::eq(entity, I"&KHcy;")) { if (A) *A = 1061; return TRUE; }
				if (Str::eq(entity, I"&KJcy;")) { if (A) *A = 1036; return TRUE; }
				if (Str::eq(entity, I"&Kappa;")) { if (A) *A = 922; return TRUE; }
				if (Str::eq(entity, I"&Kcedil;")) { if (A) *A = 310; return TRUE; }
				if (Str::eq(entity, I"&Kcy;")) { if (A) *A = 1050; return TRUE; }
				if (Str::eq(entity, I"&Kfr;")) { if (A) *A = 120078; return TRUE; }
				if (Str::eq(entity, I"&Kopf;")) { if (A) *A = 120130; return TRUE; }
				if (Str::eq(entity, I"&Kscr;")) { if (A) *A = 119974; return TRUE; }
				break;
			case 'L':
				if (Str::eq(entity, I"&LJcy;")) { if (A) *A = 1033; return TRUE; }
				if (Str::eq(entity, I"&LT")) { if (A) *A = 60; return TRUE; }
				if (Str::eq(entity, I"&LT;")) { if (A) *A = 60; return TRUE; }
				if (Str::eq(entity, I"&Lacute;")) { if (A) *A = 313; return TRUE; }
				if (Str::eq(entity, I"&Lambda;")) { if (A) *A = 923; return TRUE; }
				if (Str::eq(entity, I"&Lang;")) { if (A) *A = 10218; return TRUE; }
				if (Str::eq(entity, I"&Laplacetrf;")) { if (A) *A = 8466; return TRUE; }
				if (Str::eq(entity, I"&Larr;")) { if (A) *A = 8606; return TRUE; }
				if (Str::eq(entity, I"&Lcaron;")) { if (A) *A = 317; return TRUE; }
				if (Str::eq(entity, I"&Lcedil;")) { if (A) *A = 315; return TRUE; }
				if (Str::eq(entity, I"&Lcy;")) { if (A) *A = 1051; return TRUE; }
				if (Str::eq(entity, I"&LeftAngleBracket;")) { if (A) *A = 10216; return TRUE; }
				if (Str::eq(entity, I"&LeftArrow;")) { if (A) *A = 8592; return TRUE; }
				if (Str::eq(entity, I"&LeftArrowBar;")) { if (A) *A = 8676; return TRUE; }
				if (Str::eq(entity, I"&LeftArrowRightArrow;")) { if (A) *A = 8646; return TRUE; }
				if (Str::eq(entity, I"&LeftCeiling;")) { if (A) *A = 8968; return TRUE; }
				if (Str::eq(entity, I"&LeftDoubleBracket;")) { if (A) *A = 10214; return TRUE; }
				if (Str::eq(entity, I"&LeftDownTeeVector;")) { if (A) *A = 10593; return TRUE; }
				if (Str::eq(entity, I"&LeftDownVector;")) { if (A) *A = 8643; return TRUE; }
				if (Str::eq(entity, I"&LeftDownVectorBar;")) { if (A) *A = 10585; return TRUE; }
				if (Str::eq(entity, I"&LeftFloor;")) { if (A) *A = 8970; return TRUE; }
				if (Str::eq(entity, I"&LeftRightArrow;")) { if (A) *A = 8596; return TRUE; }
				if (Str::eq(entity, I"&LeftRightVector;")) { if (A) *A = 10574; return TRUE; }
				if (Str::eq(entity, I"&LeftTee;")) { if (A) *A = 8867; return TRUE; }
				if (Str::eq(entity, I"&LeftTeeArrow;")) { if (A) *A = 8612; return TRUE; }
				if (Str::eq(entity, I"&LeftTeeVector;")) { if (A) *A = 10586; return TRUE; }
				if (Str::eq(entity, I"&LeftTriangle;")) { if (A) *A = 8882; return TRUE; }
				if (Str::eq(entity, I"&LeftTriangleBar;")) { if (A) *A = 10703; return TRUE; }
				if (Str::eq(entity, I"&LeftTriangleEqual;")) { if (A) *A = 8884; return TRUE; }
				if (Str::eq(entity, I"&LeftUpDownVector;")) { if (A) *A = 10577; return TRUE; }
				if (Str::eq(entity, I"&LeftUpTeeVector;")) { if (A) *A = 10592; return TRUE; }
				if (Str::eq(entity, I"&LeftUpVector;")) { if (A) *A = 8639; return TRUE; }
				if (Str::eq(entity, I"&LeftUpVectorBar;")) { if (A) *A = 10584; return TRUE; }
				if (Str::eq(entity, I"&LeftVector;")) { if (A) *A = 8636; return TRUE; }
				if (Str::eq(entity, I"&LeftVectorBar;")) { if (A) *A = 10578; return TRUE; }
				if (Str::eq(entity, I"&Leftarrow;")) { if (A) *A = 8656; return TRUE; }
				if (Str::eq(entity, I"&Leftrightarrow;")) { if (A) *A = 8660; return TRUE; }
				if (Str::eq(entity, I"&LessEqualGreater;")) { if (A) *A = 8922; return TRUE; }
				if (Str::eq(entity, I"&LessFullEqual;")) { if (A) *A = 8806; return TRUE; }
				if (Str::eq(entity, I"&LessGreater;")) { if (A) *A = 8822; return TRUE; }
				if (Str::eq(entity, I"&LessLess;")) { if (A) *A = 10913; return TRUE; }
				if (Str::eq(entity, I"&LessSlantEqual;")) { if (A) *A = 10877; return TRUE; }
				if (Str::eq(entity, I"&LessTilde;")) { if (A) *A = 8818; return TRUE; }
				if (Str::eq(entity, I"&Lfr;")) { if (A) *A = 120079; return TRUE; }
				if (Str::eq(entity, I"&Ll;")) { if (A) *A = 8920; return TRUE; }
				if (Str::eq(entity, I"&Lleftarrow;")) { if (A) *A = 8666; return TRUE; }
				if (Str::eq(entity, I"&Lmidot;")) { if (A) *A = 319; return TRUE; }
				if (Str::eq(entity, I"&LongLeftArrow;")) { if (A) *A = 10229; return TRUE; }
				if (Str::eq(entity, I"&LongLeftRightArrow;")) { if (A) *A = 10231; return TRUE; }
				if (Str::eq(entity, I"&LongRightArrow;")) { if (A) *A = 10230; return TRUE; }
				if (Str::eq(entity, I"&Longleftarrow;")) { if (A) *A = 10232; return TRUE; }
				if (Str::eq(entity, I"&Longleftrightarrow;")) { if (A) *A = 10234; return TRUE; }
				if (Str::eq(entity, I"&Longrightarrow;")) { if (A) *A = 10233; return TRUE; }
				if (Str::eq(entity, I"&Lopf;")) { if (A) *A = 120131; return TRUE; }
				if (Str::eq(entity, I"&LowerLeftArrow;")) { if (A) *A = 8601; return TRUE; }
				if (Str::eq(entity, I"&LowerRightArrow;")) { if (A) *A = 8600; return TRUE; }
				if (Str::eq(entity, I"&Lscr;")) { if (A) *A = 8466; return TRUE; }
				if (Str::eq(entity, I"&Lsh;")) { if (A) *A = 8624; return TRUE; }
				if (Str::eq(entity, I"&Lstrok;")) { if (A) *A = 321; return TRUE; }
				if (Str::eq(entity, I"&Lt;")) { if (A) *A = 8810; return TRUE; }
				break;
			case 'M':
				if (Str::eq(entity, I"&Map;")) { if (A) *A = 10501; return TRUE; }
				if (Str::eq(entity, I"&Mcy;")) { if (A) *A = 1052; return TRUE; }
				if (Str::eq(entity, I"&MediumSpace;")) { if (A) *A = 8287; return TRUE; }
				if (Str::eq(entity, I"&Mellintrf;")) { if (A) *A = 8499; return TRUE; }
				if (Str::eq(entity, I"&Mfr;")) { if (A) *A = 120080; return TRUE; }
				if (Str::eq(entity, I"&MinusPlus;")) { if (A) *A = 8723; return TRUE; }
				if (Str::eq(entity, I"&Mopf;")) { if (A) *A = 120132; return TRUE; }
				if (Str::eq(entity, I"&Mscr;")) { if (A) *A = 8499; return TRUE; }
				if (Str::eq(entity, I"&Mu;")) { if (A) *A = 924; return TRUE; }
				break;
			case 'N':
				if (Str::eq(entity, I"&NJcy;")) { if (A) *A = 1034; return TRUE; }
				if (Str::eq(entity, I"&Nacute;")) { if (A) *A = 323; return TRUE; }
				if (Str::eq(entity, I"&Ncaron;")) { if (A) *A = 327; return TRUE; }
				if (Str::eq(entity, I"&Ncedil;")) { if (A) *A = 325; return TRUE; }
				if (Str::eq(entity, I"&Ncy;")) { if (A) *A = 1053; return TRUE; }
				if (Str::eq(entity, I"&NegativeMediumSpace;")) { if (A) *A = 8203; return TRUE; }
				if (Str::eq(entity, I"&NegativeThickSpace;")) { if (A) *A = 8203; return TRUE; }
				if (Str::eq(entity, I"&NegativeThinSpace;")) { if (A) *A = 8203; return TRUE; }
				if (Str::eq(entity, I"&NegativeVeryThinSpace;")) { if (A) *A = 8203; return TRUE; }
				if (Str::eq(entity, I"&NestedGreaterGreater;")) { if (A) *A = 8811; return TRUE; }
				if (Str::eq(entity, I"&NestedLessLess;")) { if (A) *A = 8810; return TRUE; }
				if (Str::eq(entity, I"&NewLine;")) { if (A) *A = 10; return TRUE; }
				if (Str::eq(entity, I"&Nfr;")) { if (A) *A = 120081; return TRUE; }
				if (Str::eq(entity, I"&NoBreak;")) { if (A) *A = 8288; return TRUE; }
				if (Str::eq(entity, I"&NonBreakingSpace;")) { if (A) *A = 160; return TRUE; }
				if (Str::eq(entity, I"&Nopf;")) { if (A) *A = 8469; return TRUE; }
				if (Str::eq(entity, I"&Not;")) { if (A) *A = 10988; return TRUE; }
				if (Str::eq(entity, I"&NotCongruent;")) { if (A) *A = 8802; return TRUE; }
				if (Str::eq(entity, I"&NotCupCap;")) { if (A) *A = 8813; return TRUE; }
				if (Str::eq(entity, I"&NotDoubleVerticalBar;")) { if (A) *A = 8742; return TRUE; }
				if (Str::eq(entity, I"&NotElement;")) { if (A) *A = 8713; return TRUE; }
				if (Str::eq(entity, I"&NotEqual;")) { if (A) *A = 8800; return TRUE; }
				if (Str::eq(entity, I"&NotEqualTilde;")) { if (A) *A = 8770; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotExists;")) { if (A) *A = 8708; return TRUE; }
				if (Str::eq(entity, I"&NotGreater;")) { if (A) *A = 8815; return TRUE; }
				if (Str::eq(entity, I"&NotGreaterEqual;")) { if (A) *A = 8817; return TRUE; }
				if (Str::eq(entity, I"&NotGreaterFullEqual;")) { if (A) *A = 8807; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotGreaterGreater;")) { if (A) *A = 8811; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotGreaterLess;")) { if (A) *A = 8825; return TRUE; }
				if (Str::eq(entity, I"&NotGreaterSlantEqual;")) { if (A) *A = 10878; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotGreaterTilde;")) { if (A) *A = 8821; return TRUE; }
				if (Str::eq(entity, I"&NotHumpDownHump;")) { if (A) *A = 8782; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotHumpEqual;")) { if (A) *A = 8783; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotLeftTriangle;")) { if (A) *A = 8938; return TRUE; }
				if (Str::eq(entity, I"&NotLeftTriangleBar;")) { if (A) *A = 10703; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotLeftTriangleEqual;")) { if (A) *A = 8940; return TRUE; }
				if (Str::eq(entity, I"&NotLess;")) { if (A) *A = 8814; return TRUE; }
				if (Str::eq(entity, I"&NotLessEqual;")) { if (A) *A = 8816; return TRUE; }
				if (Str::eq(entity, I"&NotLessGreater;")) { if (A) *A = 8824; return TRUE; }
				if (Str::eq(entity, I"&NotLessLess;")) { if (A) *A = 8810; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotLessSlantEqual;")) { if (A) *A = 10877; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotLessTilde;")) { if (A) *A = 8820; return TRUE; }
				if (Str::eq(entity, I"&NotNestedGreaterGreater;")) { if (A) *A = 10914; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotNestedLessLess;")) { if (A) *A = 10913; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotPrecedes;")) { if (A) *A = 8832; return TRUE; }
				if (Str::eq(entity, I"&NotPrecedesEqual;")) { if (A) *A = 10927; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotPrecedesSlantEqual;")) { if (A) *A = 8928; return TRUE; }
				if (Str::eq(entity, I"&NotReverseElement;")) { if (A) *A = 8716; return TRUE; }
				if (Str::eq(entity, I"&NotRightTriangle;")) { if (A) *A = 8939; return TRUE; }
				if (Str::eq(entity, I"&NotRightTriangleBar;")) { if (A) *A = 10704; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotRightTriangleEqual;")) { if (A) *A = 8941; return TRUE; }
				if (Str::eq(entity, I"&NotSquareSubset;")) { if (A) *A = 8847; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotSquareSubsetEqual;")) { if (A) *A = 8930; return TRUE; }
				if (Str::eq(entity, I"&NotSquareSuperset;")) { if (A) *A = 8848; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotSquareSupersetEqual;")) { if (A) *A = 8931; return TRUE; }
				if (Str::eq(entity, I"&NotSubset;")) { if (A) *A = 8834; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&NotSubsetEqual;")) { if (A) *A = 8840; return TRUE; }
				if (Str::eq(entity, I"&NotSucceeds;")) { if (A) *A = 8833; return TRUE; }
				if (Str::eq(entity, I"&NotSucceedsEqual;")) { if (A) *A = 10928; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotSucceedsSlantEqual;")) { if (A) *A = 8929; return TRUE; }
				if (Str::eq(entity, I"&NotSucceedsTilde;")) { if (A) *A = 8831; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&NotSuperset;")) { if (A) *A = 8835; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&NotSupersetEqual;")) { if (A) *A = 8841; return TRUE; }
				if (Str::eq(entity, I"&NotTilde;")) { if (A) *A = 8769; return TRUE; }
				if (Str::eq(entity, I"&NotTildeEqual;")) { if (A) *A = 8772; return TRUE; }
				if (Str::eq(entity, I"&NotTildeFullEqual;")) { if (A) *A = 8775; return TRUE; }
				if (Str::eq(entity, I"&NotTildeTilde;")) { if (A) *A = 8777; return TRUE; }
				if (Str::eq(entity, I"&NotVerticalBar;")) { if (A) *A = 8740; return TRUE; }
				if (Str::eq(entity, I"&Nscr;")) { if (A) *A = 119977; return TRUE; }
				if (Str::eq(entity, I"&Ntilde")) { if (A) *A = 209; return TRUE; }
				if (Str::eq(entity, I"&Ntilde;")) { if (A) *A = 209; return TRUE; }
				if (Str::eq(entity, I"&Nu;")) { if (A) *A = 925; return TRUE; }
				break;
			case 'O':
				if (Str::eq(entity, I"&OElig;")) { if (A) *A = 338; return TRUE; }
				if (Str::eq(entity, I"&Oacute")) { if (A) *A = 211; return TRUE; }
				if (Str::eq(entity, I"&Oacute;")) { if (A) *A = 211; return TRUE; }
				if (Str::eq(entity, I"&Ocirc")) { if (A) *A = 212; return TRUE; }
				if (Str::eq(entity, I"&Ocirc;")) { if (A) *A = 212; return TRUE; }
				if (Str::eq(entity, I"&Ocy;")) { if (A) *A = 1054; return TRUE; }
				if (Str::eq(entity, I"&Odblac;")) { if (A) *A = 336; return TRUE; }
				if (Str::eq(entity, I"&Ofr;")) { if (A) *A = 120082; return TRUE; }
				if (Str::eq(entity, I"&Ograve")) { if (A) *A = 210; return TRUE; }
				if (Str::eq(entity, I"&Ograve;")) { if (A) *A = 210; return TRUE; }
				if (Str::eq(entity, I"&Omacr;")) { if (A) *A = 332; return TRUE; }
				if (Str::eq(entity, I"&Omega;")) { if (A) *A = 937; return TRUE; }
				if (Str::eq(entity, I"&Omicron;")) { if (A) *A = 927; return TRUE; }
				if (Str::eq(entity, I"&Oopf;")) { if (A) *A = 120134; return TRUE; }
				if (Str::eq(entity, I"&OpenCurlyDoubleQuote;")) { if (A) *A = 8220; return TRUE; }
				if (Str::eq(entity, I"&OpenCurlyQuote;")) { if (A) *A = 8216; return TRUE; }
				if (Str::eq(entity, I"&Or;")) { if (A) *A = 10836; return TRUE; }
				if (Str::eq(entity, I"&Oscr;")) { if (A) *A = 119978; return TRUE; }
				if (Str::eq(entity, I"&Oslash")) { if (A) *A = 216; return TRUE; }
				if (Str::eq(entity, I"&Oslash;")) { if (A) *A = 216; return TRUE; }
				if (Str::eq(entity, I"&Otilde")) { if (A) *A = 213; return TRUE; }
				if (Str::eq(entity, I"&Otilde;")) { if (A) *A = 213; return TRUE; }
				if (Str::eq(entity, I"&Otimes;")) { if (A) *A = 10807; return TRUE; }
				if (Str::eq(entity, I"&Ouml")) { if (A) *A = 214; return TRUE; }
				if (Str::eq(entity, I"&Ouml;")) { if (A) *A = 214; return TRUE; }
				if (Str::eq(entity, I"&OverBar;")) { if (A) *A = 8254; return TRUE; }
				if (Str::eq(entity, I"&OverBrace;")) { if (A) *A = 9182; return TRUE; }
				if (Str::eq(entity, I"&OverBracket;")) { if (A) *A = 9140; return TRUE; }
				if (Str::eq(entity, I"&OverParenthesis;")) { if (A) *A = 9180; return TRUE; }
				break;
			case 'P':
				if (Str::eq(entity, I"&PartialD;")) { if (A) *A = 8706; return TRUE; }
				if (Str::eq(entity, I"&Pcy;")) { if (A) *A = 1055; return TRUE; }
				if (Str::eq(entity, I"&Pfr;")) { if (A) *A = 120083; return TRUE; }
				if (Str::eq(entity, I"&Phi;")) { if (A) *A = 934; return TRUE; }
				if (Str::eq(entity, I"&Pi;")) { if (A) *A = 928; return TRUE; }
				if (Str::eq(entity, I"&PlusMinus;")) { if (A) *A = 177; return TRUE; }
				if (Str::eq(entity, I"&Poincareplane;")) { if (A) *A = 8460; return TRUE; }
				if (Str::eq(entity, I"&Popf;")) { if (A) *A = 8473; return TRUE; }
				if (Str::eq(entity, I"&Pr;")) { if (A) *A = 10939; return TRUE; }
				if (Str::eq(entity, I"&Precedes;")) { if (A) *A = 8826; return TRUE; }
				if (Str::eq(entity, I"&PrecedesEqual;")) { if (A) *A = 10927; return TRUE; }
				if (Str::eq(entity, I"&PrecedesSlantEqual;")) { if (A) *A = 8828; return TRUE; }
				if (Str::eq(entity, I"&PrecedesTilde;")) { if (A) *A = 8830; return TRUE; }
				if (Str::eq(entity, I"&Prime;")) { if (A) *A = 8243; return TRUE; }
				if (Str::eq(entity, I"&Product;")) { if (A) *A = 8719; return TRUE; }
				if (Str::eq(entity, I"&Proportion;")) { if (A) *A = 8759; return TRUE; }
				if (Str::eq(entity, I"&Proportional;")) { if (A) *A = 8733; return TRUE; }
				if (Str::eq(entity, I"&Pscr;")) { if (A) *A = 119979; return TRUE; }
				if (Str::eq(entity, I"&Psi;")) { if (A) *A = 936; return TRUE; }
				break;
			case 'Q':
				if (Str::eq(entity, I"&QUOT")) { if (A) *A = 34; return TRUE; }
				if (Str::eq(entity, I"&QUOT;")) { if (A) *A = 34; return TRUE; }
				if (Str::eq(entity, I"&Qfr;")) { if (A) *A = 120084; return TRUE; }
				if (Str::eq(entity, I"&Qopf;")) { if (A) *A = 8474; return TRUE; }
				if (Str::eq(entity, I"&Qscr;")) { if (A) *A = 119980; return TRUE; }
				break;
			case 'R':
				if (Str::eq(entity, I"&RBarr;")) { if (A) *A = 10512; return TRUE; }
				if (Str::eq(entity, I"&REG")) { if (A) *A = 174; return TRUE; }
				if (Str::eq(entity, I"&REG;")) { if (A) *A = 174; return TRUE; }
				if (Str::eq(entity, I"&Racute;")) { if (A) *A = 340; return TRUE; }
				if (Str::eq(entity, I"&Rang;")) { if (A) *A = 10219; return TRUE; }
				if (Str::eq(entity, I"&Rarr;")) { if (A) *A = 8608; return TRUE; }
				if (Str::eq(entity, I"&Rarrtl;")) { if (A) *A = 10518; return TRUE; }
				if (Str::eq(entity, I"&Rcaron;")) { if (A) *A = 344; return TRUE; }
				if (Str::eq(entity, I"&Rcedil;")) { if (A) *A = 342; return TRUE; }
				if (Str::eq(entity, I"&Rcy;")) { if (A) *A = 1056; return TRUE; }
				if (Str::eq(entity, I"&Re;")) { if (A) *A = 8476; return TRUE; }
				if (Str::eq(entity, I"&ReverseElement;")) { if (A) *A = 8715; return TRUE; }
				if (Str::eq(entity, I"&ReverseEquilibrium;")) { if (A) *A = 8651; return TRUE; }
				if (Str::eq(entity, I"&ReverseUpEquilibrium;")) { if (A) *A = 10607; return TRUE; }
				if (Str::eq(entity, I"&Rfr;")) { if (A) *A = 8476; return TRUE; }
				if (Str::eq(entity, I"&Rho;")) { if (A) *A = 929; return TRUE; }
				if (Str::eq(entity, I"&RightAngleBracket;")) { if (A) *A = 10217; return TRUE; }
				if (Str::eq(entity, I"&RightArrow;")) { if (A) *A = 8594; return TRUE; }
				if (Str::eq(entity, I"&RightArrowBar;")) { if (A) *A = 8677; return TRUE; }
				if (Str::eq(entity, I"&RightArrowLeftArrow;")) { if (A) *A = 8644; return TRUE; }
				if (Str::eq(entity, I"&RightCeiling;")) { if (A) *A = 8969; return TRUE; }
				if (Str::eq(entity, I"&RightDoubleBracket;")) { if (A) *A = 10215; return TRUE; }
				if (Str::eq(entity, I"&RightDownTeeVector;")) { if (A) *A = 10589; return TRUE; }
				if (Str::eq(entity, I"&RightDownVector;")) { if (A) *A = 8642; return TRUE; }
				if (Str::eq(entity, I"&RightDownVectorBar;")) { if (A) *A = 10581; return TRUE; }
				if (Str::eq(entity, I"&RightFloor;")) { if (A) *A = 8971; return TRUE; }
				if (Str::eq(entity, I"&RightTee;")) { if (A) *A = 8866; return TRUE; }
				if (Str::eq(entity, I"&RightTeeArrow;")) { if (A) *A = 8614; return TRUE; }
				if (Str::eq(entity, I"&RightTeeVector;")) { if (A) *A = 10587; return TRUE; }
				if (Str::eq(entity, I"&RightTriangle;")) { if (A) *A = 8883; return TRUE; }
				if (Str::eq(entity, I"&RightTriangleBar;")) { if (A) *A = 10704; return TRUE; }
				if (Str::eq(entity, I"&RightTriangleEqual;")) { if (A) *A = 8885; return TRUE; }
				if (Str::eq(entity, I"&RightUpDownVector;")) { if (A) *A = 10575; return TRUE; }
				if (Str::eq(entity, I"&RightUpTeeVector;")) { if (A) *A = 10588; return TRUE; }
				if (Str::eq(entity, I"&RightUpVector;")) { if (A) *A = 8638; return TRUE; }
				if (Str::eq(entity, I"&RightUpVectorBar;")) { if (A) *A = 10580; return TRUE; }
				if (Str::eq(entity, I"&RightVector;")) { if (A) *A = 8640; return TRUE; }
				if (Str::eq(entity, I"&RightVectorBar;")) { if (A) *A = 10579; return TRUE; }
				if (Str::eq(entity, I"&Rightarrow;")) { if (A) *A = 8658; return TRUE; }
				if (Str::eq(entity, I"&Ropf;")) { if (A) *A = 8477; return TRUE; }
				if (Str::eq(entity, I"&RoundImplies;")) { if (A) *A = 10608; return TRUE; }
				if (Str::eq(entity, I"&Rrightarrow;")) { if (A) *A = 8667; return TRUE; }
				if (Str::eq(entity, I"&Rscr;")) { if (A) *A = 8475; return TRUE; }
				if (Str::eq(entity, I"&Rsh;")) { if (A) *A = 8625; return TRUE; }
				if (Str::eq(entity, I"&RuleDelayed;")) { if (A) *A = 10740; return TRUE; }
				break;
			case 'S':
				if (Str::eq(entity, I"&SHCHcy;")) { if (A) *A = 1065; return TRUE; }
				if (Str::eq(entity, I"&SHcy;")) { if (A) *A = 1064; return TRUE; }
				if (Str::eq(entity, I"&SOFTcy;")) { if (A) *A = 1068; return TRUE; }
				if (Str::eq(entity, I"&Sacute;")) { if (A) *A = 346; return TRUE; }
				if (Str::eq(entity, I"&Sc;")) { if (A) *A = 10940; return TRUE; }
				if (Str::eq(entity, I"&Scaron;")) { if (A) *A = 352; return TRUE; }
				if (Str::eq(entity, I"&Scedil;")) { if (A) *A = 350; return TRUE; }
				if (Str::eq(entity, I"&Scirc;")) { if (A) *A = 348; return TRUE; }
				if (Str::eq(entity, I"&Scy;")) { if (A) *A = 1057; return TRUE; }
				if (Str::eq(entity, I"&Sfr;")) { if (A) *A = 120086; return TRUE; }
				if (Str::eq(entity, I"&ShortDownArrow;")) { if (A) *A = 8595; return TRUE; }
				if (Str::eq(entity, I"&ShortLeftArrow;")) { if (A) *A = 8592; return TRUE; }
				if (Str::eq(entity, I"&ShortRightArrow;")) { if (A) *A = 8594; return TRUE; }
				if (Str::eq(entity, I"&ShortUpArrow;")) { if (A) *A = 8593; return TRUE; }
				if (Str::eq(entity, I"&Sigma;")) { if (A) *A = 931; return TRUE; }
				if (Str::eq(entity, I"&SmallCircle;")) { if (A) *A = 8728; return TRUE; }
				if (Str::eq(entity, I"&Sopf;")) { if (A) *A = 120138; return TRUE; }
				if (Str::eq(entity, I"&Sqrt;")) { if (A) *A = 8730; return TRUE; }
				if (Str::eq(entity, I"&Square;")) { if (A) *A = 9633; return TRUE; }
				if (Str::eq(entity, I"&SquareIntersection;")) { if (A) *A = 8851; return TRUE; }
				if (Str::eq(entity, I"&SquareSubset;")) { if (A) *A = 8847; return TRUE; }
				if (Str::eq(entity, I"&SquareSubsetEqual;")) { if (A) *A = 8849; return TRUE; }
				if (Str::eq(entity, I"&SquareSuperset;")) { if (A) *A = 8848; return TRUE; }
				if (Str::eq(entity, I"&SquareSupersetEqual;")) { if (A) *A = 8850; return TRUE; }
				if (Str::eq(entity, I"&SquareUnion;")) { if (A) *A = 8852; return TRUE; }
				if (Str::eq(entity, I"&Sscr;")) { if (A) *A = 119982; return TRUE; }
				if (Str::eq(entity, I"&Star;")) { if (A) *A = 8902; return TRUE; }
				if (Str::eq(entity, I"&Sub;")) { if (A) *A = 8912; return TRUE; }
				if (Str::eq(entity, I"&Subset;")) { if (A) *A = 8912; return TRUE; }
				if (Str::eq(entity, I"&SubsetEqual;")) { if (A) *A = 8838; return TRUE; }
				if (Str::eq(entity, I"&Succeeds;")) { if (A) *A = 8827; return TRUE; }
				if (Str::eq(entity, I"&SucceedsEqual;")) { if (A) *A = 10928; return TRUE; }
				if (Str::eq(entity, I"&SucceedsSlantEqual;")) { if (A) *A = 8829; return TRUE; }
				if (Str::eq(entity, I"&SucceedsTilde;")) { if (A) *A = 8831; return TRUE; }
				if (Str::eq(entity, I"&SuchThat;")) { if (A) *A = 8715; return TRUE; }
				if (Str::eq(entity, I"&Sum;")) { if (A) *A = 8721; return TRUE; }
				if (Str::eq(entity, I"&Sup;")) { if (A) *A = 8913; return TRUE; }
				if (Str::eq(entity, I"&Superset;")) { if (A) *A = 8835; return TRUE; }
				if (Str::eq(entity, I"&SupersetEqual;")) { if (A) *A = 8839; return TRUE; }
				if (Str::eq(entity, I"&Supset;")) { if (A) *A = 8913; return TRUE; }
				break;
			case 'T':
				if (Str::eq(entity, I"&THORN")) { if (A) *A = 222; return TRUE; }
				if (Str::eq(entity, I"&THORN;")) { if (A) *A = 222; return TRUE; }
				if (Str::eq(entity, I"&TRADE;")) { if (A) *A = 8482; return TRUE; }
				if (Str::eq(entity, I"&TSHcy;")) { if (A) *A = 1035; return TRUE; }
				if (Str::eq(entity, I"&TScy;")) { if (A) *A = 1062; return TRUE; }
				if (Str::eq(entity, I"&Tab;")) { if (A) *A = 9; return TRUE; }
				if (Str::eq(entity, I"&Tau;")) { if (A) *A = 932; return TRUE; }
				if (Str::eq(entity, I"&Tcaron;")) { if (A) *A = 356; return TRUE; }
				if (Str::eq(entity, I"&Tcedil;")) { if (A) *A = 354; return TRUE; }
				if (Str::eq(entity, I"&Tcy;")) { if (A) *A = 1058; return TRUE; }
				if (Str::eq(entity, I"&Tfr;")) { if (A) *A = 120087; return TRUE; }
				if (Str::eq(entity, I"&Therefore;")) { if (A) *A = 8756; return TRUE; }
				if (Str::eq(entity, I"&Theta;")) { if (A) *A = 920; return TRUE; }
				if (Str::eq(entity, I"&ThickSpace;")) { if (A) *A = 8287; if (B) *B = 8202; return TRUE; }
				if (Str::eq(entity, I"&ThinSpace;")) { if (A) *A = 8201; return TRUE; }
				if (Str::eq(entity, I"&Tilde;")) { if (A) *A = 8764; return TRUE; }
				if (Str::eq(entity, I"&TildeEqual;")) { if (A) *A = 8771; return TRUE; }
				if (Str::eq(entity, I"&TildeFullEqual;")) { if (A) *A = 8773; return TRUE; }
				if (Str::eq(entity, I"&TildeTilde;")) { if (A) *A = 8776; return TRUE; }
				if (Str::eq(entity, I"&Topf;")) { if (A) *A = 120139; return TRUE; }
				if (Str::eq(entity, I"&TripleDot;")) { if (A) *A = 8411; return TRUE; }
				if (Str::eq(entity, I"&Tscr;")) { if (A) *A = 119983; return TRUE; }
				if (Str::eq(entity, I"&Tstrok;")) { if (A) *A = 358; return TRUE; }
				break;
			case 'U':
				if (Str::eq(entity, I"&Uacute")) { if (A) *A = 218; return TRUE; }
				if (Str::eq(entity, I"&Uacute;")) { if (A) *A = 218; return TRUE; }
				if (Str::eq(entity, I"&Uarr;")) { if (A) *A = 8607; return TRUE; }
				if (Str::eq(entity, I"&Uarrocir;")) { if (A) *A = 10569; return TRUE; }
				if (Str::eq(entity, I"&Ubrcy;")) { if (A) *A = 1038; return TRUE; }
				if (Str::eq(entity, I"&Ubreve;")) { if (A) *A = 364; return TRUE; }
				if (Str::eq(entity, I"&Ucirc")) { if (A) *A = 219; return TRUE; }
				if (Str::eq(entity, I"&Ucirc;")) { if (A) *A = 219; return TRUE; }
				if (Str::eq(entity, I"&Ucy;")) { if (A) *A = 1059; return TRUE; }
				if (Str::eq(entity, I"&Udblac;")) { if (A) *A = 368; return TRUE; }
				if (Str::eq(entity, I"&Ufr;")) { if (A) *A = 120088; return TRUE; }
				if (Str::eq(entity, I"&Ugrave")) { if (A) *A = 217; return TRUE; }
				if (Str::eq(entity, I"&Ugrave;")) { if (A) *A = 217; return TRUE; }
				if (Str::eq(entity, I"&Umacr;")) { if (A) *A = 362; return TRUE; }
				if (Str::eq(entity, I"&UnderBar;")) { if (A) *A = 95; return TRUE; }
				if (Str::eq(entity, I"&UnderBrace;")) { if (A) *A = 9183; return TRUE; }
				if (Str::eq(entity, I"&UnderBracket;")) { if (A) *A = 9141; return TRUE; }
				if (Str::eq(entity, I"&UnderParenthesis;")) { if (A) *A = 9181; return TRUE; }
				if (Str::eq(entity, I"&Union;")) { if (A) *A = 8899; return TRUE; }
				if (Str::eq(entity, I"&UnionPlus;")) { if (A) *A = 8846; return TRUE; }
				if (Str::eq(entity, I"&Uogon;")) { if (A) *A = 370; return TRUE; }
				if (Str::eq(entity, I"&Uopf;")) { if (A) *A = 120140; return TRUE; }
				if (Str::eq(entity, I"&UpArrow;")) { if (A) *A = 8593; return TRUE; }
				if (Str::eq(entity, I"&UpArrowBar;")) { if (A) *A = 10514; return TRUE; }
				if (Str::eq(entity, I"&UpArrowDownArrow;")) { if (A) *A = 8645; return TRUE; }
				if (Str::eq(entity, I"&UpDownArrow;")) { if (A) *A = 8597; return TRUE; }
				if (Str::eq(entity, I"&UpEquilibrium;")) { if (A) *A = 10606; return TRUE; }
				if (Str::eq(entity, I"&UpTee;")) { if (A) *A = 8869; return TRUE; }
				if (Str::eq(entity, I"&UpTeeArrow;")) { if (A) *A = 8613; return TRUE; }
				if (Str::eq(entity, I"&Uparrow;")) { if (A) *A = 8657; return TRUE; }
				if (Str::eq(entity, I"&Updownarrow;")) { if (A) *A = 8661; return TRUE; }
				if (Str::eq(entity, I"&UpperLeftArrow;")) { if (A) *A = 8598; return TRUE; }
				if (Str::eq(entity, I"&UpperRightArrow;")) { if (A) *A = 8599; return TRUE; }
				if (Str::eq(entity, I"&Upsi;")) { if (A) *A = 978; return TRUE; }
				if (Str::eq(entity, I"&Upsilon;")) { if (A) *A = 933; return TRUE; }
				if (Str::eq(entity, I"&Uring;")) { if (A) *A = 366; return TRUE; }
				if (Str::eq(entity, I"&Uscr;")) { if (A) *A = 119984; return TRUE; }
				if (Str::eq(entity, I"&Utilde;")) { if (A) *A = 360; return TRUE; }
				if (Str::eq(entity, I"&Uuml")) { if (A) *A = 220; return TRUE; }
				if (Str::eq(entity, I"&Uuml;")) { if (A) *A = 220; return TRUE; }
				break;
			case 'V':
				if (Str::eq(entity, I"&VDash;")) { if (A) *A = 8875; return TRUE; }
				if (Str::eq(entity, I"&Vbar;")) { if (A) *A = 10987; return TRUE; }
				if (Str::eq(entity, I"&Vcy;")) { if (A) *A = 1042; return TRUE; }
				if (Str::eq(entity, I"&Vdash;")) { if (A) *A = 8873; return TRUE; }
				if (Str::eq(entity, I"&Vdashl;")) { if (A) *A = 10982; return TRUE; }
				if (Str::eq(entity, I"&Vee;")) { if (A) *A = 8897; return TRUE; }
				if (Str::eq(entity, I"&Verbar;")) { if (A) *A = 8214; return TRUE; }
				if (Str::eq(entity, I"&Vert;")) { if (A) *A = 8214; return TRUE; }
				if (Str::eq(entity, I"&VerticalBar;")) { if (A) *A = 8739; return TRUE; }
				if (Str::eq(entity, I"&VerticalLine;")) { if (A) *A = 124; return TRUE; }
				if (Str::eq(entity, I"&VerticalSeparator;")) { if (A) *A = 10072; return TRUE; }
				if (Str::eq(entity, I"&VerticalTilde;")) { if (A) *A = 8768; return TRUE; }
				if (Str::eq(entity, I"&VeryThinSpace;")) { if (A) *A = 8202; return TRUE; }
				if (Str::eq(entity, I"&Vfr;")) { if (A) *A = 120089; return TRUE; }
				if (Str::eq(entity, I"&Vopf;")) { if (A) *A = 120141; return TRUE; }
				if (Str::eq(entity, I"&Vscr;")) { if (A) *A = 119985; return TRUE; }
				if (Str::eq(entity, I"&Vvdash;")) { if (A) *A = 8874; return TRUE; }
				break;
			case 'W':
				if (Str::eq(entity, I"&Wcirc;")) { if (A) *A = 372; return TRUE; }
				if (Str::eq(entity, I"&Wedge;")) { if (A) *A = 8896; return TRUE; }
				if (Str::eq(entity, I"&Wfr;")) { if (A) *A = 120090; return TRUE; }
				if (Str::eq(entity, I"&Wopf;")) { if (A) *A = 120142; return TRUE; }
				if (Str::eq(entity, I"&Wscr;")) { if (A) *A = 119986; return TRUE; }
				break;
			case 'X':
				if (Str::eq(entity, I"&Xfr;")) { if (A) *A = 120091; return TRUE; }
				if (Str::eq(entity, I"&Xi;")) { if (A) *A = 926; return TRUE; }
				if (Str::eq(entity, I"&Xopf;")) { if (A) *A = 120143; return TRUE; }
				if (Str::eq(entity, I"&Xscr;")) { if (A) *A = 119987; return TRUE; }
				break;
			case 'Y':
				if (Str::eq(entity, I"&YAcy;")) { if (A) *A = 1071; return TRUE; }
				if (Str::eq(entity, I"&YIcy;")) { if (A) *A = 1031; return TRUE; }
				if (Str::eq(entity, I"&YUcy;")) { if (A) *A = 1070; return TRUE; }
				if (Str::eq(entity, I"&Yacute")) { if (A) *A = 221; return TRUE; }
				if (Str::eq(entity, I"&Yacute;")) { if (A) *A = 221; return TRUE; }
				if (Str::eq(entity, I"&Ycirc;")) { if (A) *A = 374; return TRUE; }
				if (Str::eq(entity, I"&Ycy;")) { if (A) *A = 1067; return TRUE; }
				if (Str::eq(entity, I"&Yfr;")) { if (A) *A = 120092; return TRUE; }
				if (Str::eq(entity, I"&Yopf;")) { if (A) *A = 120144; return TRUE; }
				if (Str::eq(entity, I"&Yscr;")) { if (A) *A = 119988; return TRUE; }
				if (Str::eq(entity, I"&Yuml;")) { if (A) *A = 376; return TRUE; }
				break;
			case 'Z':
				if (Str::eq(entity, I"&ZHcy;")) { if (A) *A = 1046; return TRUE; }
				if (Str::eq(entity, I"&Zacute;")) { if (A) *A = 377; return TRUE; }
				if (Str::eq(entity, I"&Zcaron;")) { if (A) *A = 381; return TRUE; }
				if (Str::eq(entity, I"&Zcy;")) { if (A) *A = 1047; return TRUE; }
				if (Str::eq(entity, I"&Zdot;")) { if (A) *A = 379; return TRUE; }
				if (Str::eq(entity, I"&ZeroWidthSpace;")) { if (A) *A = 8203; return TRUE; }
				if (Str::eq(entity, I"&Zeta;")) { if (A) *A = 918; return TRUE; }
				if (Str::eq(entity, I"&Zfr;")) { if (A) *A = 8488; return TRUE; }
				if (Str::eq(entity, I"&Zopf;")) { if (A) *A = 8484; return TRUE; }
				if (Str::eq(entity, I"&Zscr;")) { if (A) *A = 119989; return TRUE; }
				break;
			case 'a':
				if (Str::eq(entity, I"&aacute")) { if (A) *A = 225; return TRUE; }
				if (Str::eq(entity, I"&aacute;")) { if (A) *A = 225; return TRUE; }
				if (Str::eq(entity, I"&abreve;")) { if (A) *A = 259; return TRUE; }
				if (Str::eq(entity, I"&ac;")) { if (A) *A = 8766; return TRUE; }
				if (Str::eq(entity, I"&acE;")) { if (A) *A = 8766; if (B) *B = 819; return TRUE; }
				if (Str::eq(entity, I"&acd;")) { if (A) *A = 8767; return TRUE; }
				if (Str::eq(entity, I"&acirc")) { if (A) *A = 226; return TRUE; }
				if (Str::eq(entity, I"&acirc;")) { if (A) *A = 226; return TRUE; }
				if (Str::eq(entity, I"&acute")) { if (A) *A = 180; return TRUE; }
				if (Str::eq(entity, I"&acute;")) { if (A) *A = 180; return TRUE; }
				if (Str::eq(entity, I"&acy;")) { if (A) *A = 1072; return TRUE; }
				if (Str::eq(entity, I"&aelig")) { if (A) *A = 230; return TRUE; }
				if (Str::eq(entity, I"&aelig;")) { if (A) *A = 230; return TRUE; }
				if (Str::eq(entity, I"&af;")) { if (A) *A = 8289; return TRUE; }
				if (Str::eq(entity, I"&afr;")) { if (A) *A = 120094; return TRUE; }
				if (Str::eq(entity, I"&agrave")) { if (A) *A = 224; return TRUE; }
				if (Str::eq(entity, I"&agrave;")) { if (A) *A = 224; return TRUE; }
				if (Str::eq(entity, I"&alefsym;")) { if (A) *A = 8501; return TRUE; }
				if (Str::eq(entity, I"&aleph;")) { if (A) *A = 8501; return TRUE; }
				if (Str::eq(entity, I"&alpha;")) { if (A) *A = 945; return TRUE; }
				if (Str::eq(entity, I"&amacr;")) { if (A) *A = 257; return TRUE; }
				if (Str::eq(entity, I"&amalg;")) { if (A) *A = 10815; return TRUE; }
				if (Str::eq(entity, I"&amp")) { if (A) *A = 38; return TRUE; }
				if (Str::eq(entity, I"&amp;")) { if (A) *A = 38; return TRUE; }
				if (Str::eq(entity, I"&and;")) { if (A) *A = 8743; return TRUE; }
				if (Str::eq(entity, I"&andand;")) { if (A) *A = 10837; return TRUE; }
				if (Str::eq(entity, I"&andd;")) { if (A) *A = 10844; return TRUE; }
				if (Str::eq(entity, I"&andslope;")) { if (A) *A = 10840; return TRUE; }
				if (Str::eq(entity, I"&andv;")) { if (A) *A = 10842; return TRUE; }
				if (Str::eq(entity, I"&ang;")) { if (A) *A = 8736; return TRUE; }
				if (Str::eq(entity, I"&ange;")) { if (A) *A = 10660; return TRUE; }
				if (Str::eq(entity, I"&angle;")) { if (A) *A = 8736; return TRUE; }
				if (Str::eq(entity, I"&angmsd;")) { if (A) *A = 8737; return TRUE; }
				if (Str::eq(entity, I"&angmsdaa;")) { if (A) *A = 10664; return TRUE; }
				if (Str::eq(entity, I"&angmsdab;")) { if (A) *A = 10665; return TRUE; }
				if (Str::eq(entity, I"&angmsdac;")) { if (A) *A = 10666; return TRUE; }
				if (Str::eq(entity, I"&angmsdad;")) { if (A) *A = 10667; return TRUE; }
				if (Str::eq(entity, I"&angmsdae;")) { if (A) *A = 10668; return TRUE; }
				if (Str::eq(entity, I"&angmsdaf;")) { if (A) *A = 10669; return TRUE; }
				if (Str::eq(entity, I"&angmsdag;")) { if (A) *A = 10670; return TRUE; }
				if (Str::eq(entity, I"&angmsdah;")) { if (A) *A = 10671; return TRUE; }
				if (Str::eq(entity, I"&angrt;")) { if (A) *A = 8735; return TRUE; }
				if (Str::eq(entity, I"&angrtvb;")) { if (A) *A = 8894; return TRUE; }
				if (Str::eq(entity, I"&angrtvbd;")) { if (A) *A = 10653; return TRUE; }
				if (Str::eq(entity, I"&angsph;")) { if (A) *A = 8738; return TRUE; }
				if (Str::eq(entity, I"&angst;")) { if (A) *A = 197; return TRUE; }
				if (Str::eq(entity, I"&angzarr;")) { if (A) *A = 9084; return TRUE; }
				if (Str::eq(entity, I"&aogon;")) { if (A) *A = 261; return TRUE; }
				if (Str::eq(entity, I"&aopf;")) { if (A) *A = 120146; return TRUE; }
				if (Str::eq(entity, I"&ap;")) { if (A) *A = 8776; return TRUE; }
				if (Str::eq(entity, I"&apE;")) { if (A) *A = 10864; return TRUE; }
				if (Str::eq(entity, I"&apacir;")) { if (A) *A = 10863; return TRUE; }
				if (Str::eq(entity, I"&ape;")) { if (A) *A = 8778; return TRUE; }
				if (Str::eq(entity, I"&apid;")) { if (A) *A = 8779; return TRUE; }
				if (Str::eq(entity, I"&apos;")) { if (A) *A = 39; return TRUE; }
				if (Str::eq(entity, I"&approx;")) { if (A) *A = 8776; return TRUE; }
				if (Str::eq(entity, I"&approxeq;")) { if (A) *A = 8778; return TRUE; }
				if (Str::eq(entity, I"&aring")) { if (A) *A = 229; return TRUE; }
				if (Str::eq(entity, I"&aring;")) { if (A) *A = 229; return TRUE; }
				if (Str::eq(entity, I"&ascr;")) { if (A) *A = 119990; return TRUE; }
				if (Str::eq(entity, I"&ast;")) { if (A) *A = 42; return TRUE; }
				if (Str::eq(entity, I"&asymp;")) { if (A) *A = 8776; return TRUE; }
				if (Str::eq(entity, I"&asympeq;")) { if (A) *A = 8781; return TRUE; }
				if (Str::eq(entity, I"&atilde")) { if (A) *A = 227; return TRUE; }
				if (Str::eq(entity, I"&atilde;")) { if (A) *A = 227; return TRUE; }
				if (Str::eq(entity, I"&auml")) { if (A) *A = 228; return TRUE; }
				if (Str::eq(entity, I"&auml;")) { if (A) *A = 228; return TRUE; }
				if (Str::eq(entity, I"&awconint;")) { if (A) *A = 8755; return TRUE; }
				if (Str::eq(entity, I"&awint;")) { if (A) *A = 10769; return TRUE; }
				break;
			case 'b':
				if (Str::eq(entity, I"&bNot;")) { if (A) *A = 10989; return TRUE; }
				if (Str::eq(entity, I"&backcong;")) { if (A) *A = 8780; return TRUE; }
				if (Str::eq(entity, I"&backepsilon;")) { if (A) *A = 1014; return TRUE; }
				if (Str::eq(entity, I"&backprime;")) { if (A) *A = 8245; return TRUE; }
				if (Str::eq(entity, I"&backsim;")) { if (A) *A = 8765; return TRUE; }
				if (Str::eq(entity, I"&backsimeq;")) { if (A) *A = 8909; return TRUE; }
				if (Str::eq(entity, I"&barvee;")) { if (A) *A = 8893; return TRUE; }
				if (Str::eq(entity, I"&barwed;")) { if (A) *A = 8965; return TRUE; }
				if (Str::eq(entity, I"&barwedge;")) { if (A) *A = 8965; return TRUE; }
				if (Str::eq(entity, I"&bbrk;")) { if (A) *A = 9141; return TRUE; }
				if (Str::eq(entity, I"&bbrktbrk;")) { if (A) *A = 9142; return TRUE; }
				if (Str::eq(entity, I"&bcong;")) { if (A) *A = 8780; return TRUE; }
				if (Str::eq(entity, I"&bcy;")) { if (A) *A = 1073; return TRUE; }
				if (Str::eq(entity, I"&bdquo;")) { if (A) *A = 8222; return TRUE; }
				if (Str::eq(entity, I"&becaus;")) { if (A) *A = 8757; return TRUE; }
				if (Str::eq(entity, I"&because;")) { if (A) *A = 8757; return TRUE; }
				if (Str::eq(entity, I"&bemptyv;")) { if (A) *A = 10672; return TRUE; }
				if (Str::eq(entity, I"&bepsi;")) { if (A) *A = 1014; return TRUE; }
				if (Str::eq(entity, I"&bernou;")) { if (A) *A = 8492; return TRUE; }
				if (Str::eq(entity, I"&beta;")) { if (A) *A = 946; return TRUE; }
				if (Str::eq(entity, I"&beth;")) { if (A) *A = 8502; return TRUE; }
				if (Str::eq(entity, I"&between;")) { if (A) *A = 8812; return TRUE; }
				if (Str::eq(entity, I"&bfr;")) { if (A) *A = 120095; return TRUE; }
				if (Str::eq(entity, I"&bigcap;")) { if (A) *A = 8898; return TRUE; }
				if (Str::eq(entity, I"&bigcirc;")) { if (A) *A = 9711; return TRUE; }
				if (Str::eq(entity, I"&bigcup;")) { if (A) *A = 8899; return TRUE; }
				if (Str::eq(entity, I"&bigodot;")) { if (A) *A = 10752; return TRUE; }
				if (Str::eq(entity, I"&bigoplus;")) { if (A) *A = 10753; return TRUE; }
				if (Str::eq(entity, I"&bigotimes;")) { if (A) *A = 10754; return TRUE; }
				if (Str::eq(entity, I"&bigsqcup;")) { if (A) *A = 10758; return TRUE; }
				if (Str::eq(entity, I"&bigstar;")) { if (A) *A = 9733; return TRUE; }
				if (Str::eq(entity, I"&bigtriangledown;")) { if (A) *A = 9661; return TRUE; }
				if (Str::eq(entity, I"&bigtriangleup;")) { if (A) *A = 9651; return TRUE; }
				if (Str::eq(entity, I"&biguplus;")) { if (A) *A = 10756; return TRUE; }
				if (Str::eq(entity, I"&bigvee;")) { if (A) *A = 8897; return TRUE; }
				if (Str::eq(entity, I"&bigwedge;")) { if (A) *A = 8896; return TRUE; }
				if (Str::eq(entity, I"&bkarow;")) { if (A) *A = 10509; return TRUE; }
				if (Str::eq(entity, I"&blacklozenge;")) { if (A) *A = 10731; return TRUE; }
				if (Str::eq(entity, I"&blacksquare;")) { if (A) *A = 9642; return TRUE; }
				if (Str::eq(entity, I"&blacktriangle;")) { if (A) *A = 9652; return TRUE; }
				if (Str::eq(entity, I"&blacktriangledown;")) { if (A) *A = 9662; return TRUE; }
				if (Str::eq(entity, I"&blacktriangleleft;")) { if (A) *A = 9666; return TRUE; }
				if (Str::eq(entity, I"&blacktriangleright;")) { if (A) *A = 9656; return TRUE; }
				if (Str::eq(entity, I"&blank;")) { if (A) *A = 9251; return TRUE; }
				if (Str::eq(entity, I"&blk12;")) { if (A) *A = 9618; return TRUE; }
				if (Str::eq(entity, I"&blk14;")) { if (A) *A = 9617; return TRUE; }
				if (Str::eq(entity, I"&blk34;")) { if (A) *A = 9619; return TRUE; }
				if (Str::eq(entity, I"&block;")) { if (A) *A = 9608; return TRUE; }
				if (Str::eq(entity, I"&bne;")) { if (A) *A = 61; if (B) *B = 8421; return TRUE; }
				if (Str::eq(entity, I"&bnequiv;")) { if (A) *A = 8801; if (B) *B = 8421; return TRUE; }
				if (Str::eq(entity, I"&bnot;")) { if (A) *A = 8976; return TRUE; }
				if (Str::eq(entity, I"&bopf;")) { if (A) *A = 120147; return TRUE; }
				if (Str::eq(entity, I"&bot;")) { if (A) *A = 8869; return TRUE; }
				if (Str::eq(entity, I"&bottom;")) { if (A) *A = 8869; return TRUE; }
				if (Str::eq(entity, I"&bowtie;")) { if (A) *A = 8904; return TRUE; }
				if (Str::eq(entity, I"&boxDL;")) { if (A) *A = 9559; return TRUE; }
				if (Str::eq(entity, I"&boxDR;")) { if (A) *A = 9556; return TRUE; }
				if (Str::eq(entity, I"&boxDl;")) { if (A) *A = 9558; return TRUE; }
				if (Str::eq(entity, I"&boxDr;")) { if (A) *A = 9555; return TRUE; }
				if (Str::eq(entity, I"&boxH;")) { if (A) *A = 9552; return TRUE; }
				if (Str::eq(entity, I"&boxHD;")) { if (A) *A = 9574; return TRUE; }
				if (Str::eq(entity, I"&boxHU;")) { if (A) *A = 9577; return TRUE; }
				if (Str::eq(entity, I"&boxHd;")) { if (A) *A = 9572; return TRUE; }
				if (Str::eq(entity, I"&boxHu;")) { if (A) *A = 9575; return TRUE; }
				if (Str::eq(entity, I"&boxUL;")) { if (A) *A = 9565; return TRUE; }
				if (Str::eq(entity, I"&boxUR;")) { if (A) *A = 9562; return TRUE; }
				if (Str::eq(entity, I"&boxUl;")) { if (A) *A = 9564; return TRUE; }
				if (Str::eq(entity, I"&boxUr;")) { if (A) *A = 9561; return TRUE; }
				if (Str::eq(entity, I"&boxV;")) { if (A) *A = 9553; return TRUE; }
				if (Str::eq(entity, I"&boxVH;")) { if (A) *A = 9580; return TRUE; }
				if (Str::eq(entity, I"&boxVL;")) { if (A) *A = 9571; return TRUE; }
				if (Str::eq(entity, I"&boxVR;")) { if (A) *A = 9568; return TRUE; }
				if (Str::eq(entity, I"&boxVh;")) { if (A) *A = 9579; return TRUE; }
				if (Str::eq(entity, I"&boxVl;")) { if (A) *A = 9570; return TRUE; }
				if (Str::eq(entity, I"&boxVr;")) { if (A) *A = 9567; return TRUE; }
				if (Str::eq(entity, I"&boxbox;")) { if (A) *A = 10697; return TRUE; }
				if (Str::eq(entity, I"&boxdL;")) { if (A) *A = 9557; return TRUE; }
				if (Str::eq(entity, I"&boxdR;")) { if (A) *A = 9554; return TRUE; }
				if (Str::eq(entity, I"&boxdl;")) { if (A) *A = 9488; return TRUE; }
				if (Str::eq(entity, I"&boxdr;")) { if (A) *A = 9484; return TRUE; }
				if (Str::eq(entity, I"&boxh;")) { if (A) *A = 9472; return TRUE; }
				if (Str::eq(entity, I"&boxhD;")) { if (A) *A = 9573; return TRUE; }
				if (Str::eq(entity, I"&boxhU;")) { if (A) *A = 9576; return TRUE; }
				if (Str::eq(entity, I"&boxhd;")) { if (A) *A = 9516; return TRUE; }
				if (Str::eq(entity, I"&boxhu;")) { if (A) *A = 9524; return TRUE; }
				if (Str::eq(entity, I"&boxminus;")) { if (A) *A = 8863; return TRUE; }
				if (Str::eq(entity, I"&boxplus;")) { if (A) *A = 8862; return TRUE; }
				if (Str::eq(entity, I"&boxtimes;")) { if (A) *A = 8864; return TRUE; }
				if (Str::eq(entity, I"&boxuL;")) { if (A) *A = 9563; return TRUE; }
				if (Str::eq(entity, I"&boxuR;")) { if (A) *A = 9560; return TRUE; }
				if (Str::eq(entity, I"&boxul;")) { if (A) *A = 9496; return TRUE; }
				if (Str::eq(entity, I"&boxur;")) { if (A) *A = 9492; return TRUE; }
				if (Str::eq(entity, I"&boxv;")) { if (A) *A = 9474; return TRUE; }
				if (Str::eq(entity, I"&boxvH;")) { if (A) *A = 9578; return TRUE; }
				if (Str::eq(entity, I"&boxvL;")) { if (A) *A = 9569; return TRUE; }
				if (Str::eq(entity, I"&boxvR;")) { if (A) *A = 9566; return TRUE; }
				if (Str::eq(entity, I"&boxvh;")) { if (A) *A = 9532; return TRUE; }
				if (Str::eq(entity, I"&boxvl;")) { if (A) *A = 9508; return TRUE; }
				if (Str::eq(entity, I"&boxvr;")) { if (A) *A = 9500; return TRUE; }
				if (Str::eq(entity, I"&bprime;")) { if (A) *A = 8245; return TRUE; }
				if (Str::eq(entity, I"&breve;")) { if (A) *A = 728; return TRUE; }
				if (Str::eq(entity, I"&brvbar")) { if (A) *A = 166; return TRUE; }
				if (Str::eq(entity, I"&brvbar;")) { if (A) *A = 166; return TRUE; }
				if (Str::eq(entity, I"&bscr;")) { if (A) *A = 119991; return TRUE; }
				if (Str::eq(entity, I"&bsemi;")) { if (A) *A = 8271; return TRUE; }
				if (Str::eq(entity, I"&bsim;")) { if (A) *A = 8765; return TRUE; }
				if (Str::eq(entity, I"&bsime;")) { if (A) *A = 8909; return TRUE; }
				if (Str::eq(entity, I"&bsol;")) { if (A) *A = 92; return TRUE; }
				if (Str::eq(entity, I"&bsolb;")) { if (A) *A = 10693; return TRUE; }
				if (Str::eq(entity, I"&bsolhsub;")) { if (A) *A = 10184; return TRUE; }
				if (Str::eq(entity, I"&bull;")) { if (A) *A = 8226; return TRUE; }
				if (Str::eq(entity, I"&bullet;")) { if (A) *A = 8226; return TRUE; }
				if (Str::eq(entity, I"&bump;")) { if (A) *A = 8782; return TRUE; }
				if (Str::eq(entity, I"&bumpE;")) { if (A) *A = 10926; return TRUE; }
				if (Str::eq(entity, I"&bumpe;")) { if (A) *A = 8783; return TRUE; }
				if (Str::eq(entity, I"&bumpeq;")) { if (A) *A = 8783; return TRUE; }
				break;
			case 'c':
				if (Str::eq(entity, I"&cacute;")) { if (A) *A = 263; return TRUE; }
				if (Str::eq(entity, I"&cap;")) { if (A) *A = 8745; return TRUE; }
				if (Str::eq(entity, I"&capand;")) { if (A) *A = 10820; return TRUE; }
				if (Str::eq(entity, I"&capbrcup;")) { if (A) *A = 10825; return TRUE; }
				if (Str::eq(entity, I"&capcap;")) { if (A) *A = 10827; return TRUE; }
				if (Str::eq(entity, I"&capcup;")) { if (A) *A = 10823; return TRUE; }
				if (Str::eq(entity, I"&capdot;")) { if (A) *A = 10816; return TRUE; }
				if (Str::eq(entity, I"&caps;")) { if (A) *A = 8745; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&caret;")) { if (A) *A = 8257; return TRUE; }
				if (Str::eq(entity, I"&caron;")) { if (A) *A = 711; return TRUE; }
				if (Str::eq(entity, I"&ccaps;")) { if (A) *A = 10829; return TRUE; }
				if (Str::eq(entity, I"&ccaron;")) { if (A) *A = 269; return TRUE; }
				if (Str::eq(entity, I"&ccedil")) { if (A) *A = 231; return TRUE; }
				if (Str::eq(entity, I"&ccedil;")) { if (A) *A = 231; return TRUE; }
				if (Str::eq(entity, I"&ccirc;")) { if (A) *A = 265; return TRUE; }
				if (Str::eq(entity, I"&ccups;")) { if (A) *A = 10828; return TRUE; }
				if (Str::eq(entity, I"&ccupssm;")) { if (A) *A = 10832; return TRUE; }
				if (Str::eq(entity, I"&cdot;")) { if (A) *A = 267; return TRUE; }
				if (Str::eq(entity, I"&cedil")) { if (A) *A = 184; return TRUE; }
				if (Str::eq(entity, I"&cedil;")) { if (A) *A = 184; return TRUE; }
				if (Str::eq(entity, I"&cemptyv;")) { if (A) *A = 10674; return TRUE; }
				if (Str::eq(entity, I"&cent")) { if (A) *A = 162; return TRUE; }
				if (Str::eq(entity, I"&cent;")) { if (A) *A = 162; return TRUE; }
				if (Str::eq(entity, I"&centerdot;")) { if (A) *A = 183; return TRUE; }
				if (Str::eq(entity, I"&cfr;")) { if (A) *A = 120096; return TRUE; }
				if (Str::eq(entity, I"&chcy;")) { if (A) *A = 1095; return TRUE; }
				if (Str::eq(entity, I"&check;")) { if (A) *A = 10003; return TRUE; }
				if (Str::eq(entity, I"&checkmark;")) { if (A) *A = 10003; return TRUE; }
				if (Str::eq(entity, I"&chi;")) { if (A) *A = 967; return TRUE; }
				if (Str::eq(entity, I"&cir;")) { if (A) *A = 9675; return TRUE; }
				if (Str::eq(entity, I"&cirE;")) { if (A) *A = 10691; return TRUE; }
				if (Str::eq(entity, I"&circ;")) { if (A) *A = 710; return TRUE; }
				if (Str::eq(entity, I"&circeq;")) { if (A) *A = 8791; return TRUE; }
				if (Str::eq(entity, I"&circlearrowleft;")) { if (A) *A = 8634; return TRUE; }
				if (Str::eq(entity, I"&circlearrowright;")) { if (A) *A = 8635; return TRUE; }
				if (Str::eq(entity, I"&circledR;")) { if (A) *A = 174; return TRUE; }
				if (Str::eq(entity, I"&circledS;")) { if (A) *A = 9416; return TRUE; }
				if (Str::eq(entity, I"&circledast;")) { if (A) *A = 8859; return TRUE; }
				if (Str::eq(entity, I"&circledcirc;")) { if (A) *A = 8858; return TRUE; }
				if (Str::eq(entity, I"&circleddash;")) { if (A) *A = 8861; return TRUE; }
				if (Str::eq(entity, I"&cire;")) { if (A) *A = 8791; return TRUE; }
				if (Str::eq(entity, I"&cirfnint;")) { if (A) *A = 10768; return TRUE; }
				if (Str::eq(entity, I"&cirmid;")) { if (A) *A = 10991; return TRUE; }
				if (Str::eq(entity, I"&cirscir;")) { if (A) *A = 10690; return TRUE; }
				if (Str::eq(entity, I"&clubs;")) { if (A) *A = 9827; return TRUE; }
				if (Str::eq(entity, I"&clubsuit;")) { if (A) *A = 9827; return TRUE; }
				if (Str::eq(entity, I"&colon;")) { if (A) *A = 58; return TRUE; }
				if (Str::eq(entity, I"&colone;")) { if (A) *A = 8788; return TRUE; }
				if (Str::eq(entity, I"&coloneq;")) { if (A) *A = 8788; return TRUE; }
				if (Str::eq(entity, I"&comma;")) { if (A) *A = 44; return TRUE; }
				if (Str::eq(entity, I"&commat;")) { if (A) *A = 64; return TRUE; }
				if (Str::eq(entity, I"&comp;")) { if (A) *A = 8705; return TRUE; }
				if (Str::eq(entity, I"&compfn;")) { if (A) *A = 8728; return TRUE; }
				if (Str::eq(entity, I"&complement;")) { if (A) *A = 8705; return TRUE; }
				if (Str::eq(entity, I"&complexes;")) { if (A) *A = 8450; return TRUE; }
				if (Str::eq(entity, I"&cong;")) { if (A) *A = 8773; return TRUE; }
				if (Str::eq(entity, I"&congdot;")) { if (A) *A = 10861; return TRUE; }
				if (Str::eq(entity, I"&conint;")) { if (A) *A = 8750; return TRUE; }
				if (Str::eq(entity, I"&copf;")) { if (A) *A = 120148; return TRUE; }
				if (Str::eq(entity, I"&coprod;")) { if (A) *A = 8720; return TRUE; }
				if (Str::eq(entity, I"&copy")) { if (A) *A = 169; return TRUE; }
				if (Str::eq(entity, I"&copy;")) { if (A) *A = 169; return TRUE; }
				if (Str::eq(entity, I"&copysr;")) { if (A) *A = 8471; return TRUE; }
				if (Str::eq(entity, I"&crarr;")) { if (A) *A = 8629; return TRUE; }
				if (Str::eq(entity, I"&cross;")) { if (A) *A = 10007; return TRUE; }
				if (Str::eq(entity, I"&cscr;")) { if (A) *A = 119992; return TRUE; }
				if (Str::eq(entity, I"&csub;")) { if (A) *A = 10959; return TRUE; }
				if (Str::eq(entity, I"&csube;")) { if (A) *A = 10961; return TRUE; }
				if (Str::eq(entity, I"&csup;")) { if (A) *A = 10960; return TRUE; }
				if (Str::eq(entity, I"&csupe;")) { if (A) *A = 10962; return TRUE; }
				if (Str::eq(entity, I"&ctdot;")) { if (A) *A = 8943; return TRUE; }
				if (Str::eq(entity, I"&cudarrl;")) { if (A) *A = 10552; return TRUE; }
				if (Str::eq(entity, I"&cudarrr;")) { if (A) *A = 10549; return TRUE; }
				if (Str::eq(entity, I"&cuepr;")) { if (A) *A = 8926; return TRUE; }
				if (Str::eq(entity, I"&cuesc;")) { if (A) *A = 8927; return TRUE; }
				if (Str::eq(entity, I"&cularr;")) { if (A) *A = 8630; return TRUE; }
				if (Str::eq(entity, I"&cularrp;")) { if (A) *A = 10557; return TRUE; }
				if (Str::eq(entity, I"&cup;")) { if (A) *A = 8746; return TRUE; }
				if (Str::eq(entity, I"&cupbrcap;")) { if (A) *A = 10824; return TRUE; }
				if (Str::eq(entity, I"&cupcap;")) { if (A) *A = 10822; return TRUE; }
				if (Str::eq(entity, I"&cupcup;")) { if (A) *A = 10826; return TRUE; }
				if (Str::eq(entity, I"&cupdot;")) { if (A) *A = 8845; return TRUE; }
				if (Str::eq(entity, I"&cupor;")) { if (A) *A = 10821; return TRUE; }
				if (Str::eq(entity, I"&cups;")) { if (A) *A = 8746; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&curarr;")) { if (A) *A = 8631; return TRUE; }
				if (Str::eq(entity, I"&curarrm;")) { if (A) *A = 10556; return TRUE; }
				if (Str::eq(entity, I"&curlyeqprec;")) { if (A) *A = 8926; return TRUE; }
				if (Str::eq(entity, I"&curlyeqsucc;")) { if (A) *A = 8927; return TRUE; }
				if (Str::eq(entity, I"&curlyvee;")) { if (A) *A = 8910; return TRUE; }
				if (Str::eq(entity, I"&curlywedge;")) { if (A) *A = 8911; return TRUE; }
				if (Str::eq(entity, I"&curren")) { if (A) *A = 164; return TRUE; }
				if (Str::eq(entity, I"&curren;")) { if (A) *A = 164; return TRUE; }
				if (Str::eq(entity, I"&curvearrowleft;")) { if (A) *A = 8630; return TRUE; }
				if (Str::eq(entity, I"&curvearrowright;")) { if (A) *A = 8631; return TRUE; }
				if (Str::eq(entity, I"&cuvee;")) { if (A) *A = 8910; return TRUE; }
				if (Str::eq(entity, I"&cuwed;")) { if (A) *A = 8911; return TRUE; }
				if (Str::eq(entity, I"&cwconint;")) { if (A) *A = 8754; return TRUE; }
				if (Str::eq(entity, I"&cwint;")) { if (A) *A = 8753; return TRUE; }
				if (Str::eq(entity, I"&cylcty;")) { if (A) *A = 9005; return TRUE; }
				break;
			case 'd':
				if (Str::eq(entity, I"&dArr;")) { if (A) *A = 8659; return TRUE; }
				if (Str::eq(entity, I"&dHar;")) { if (A) *A = 10597; return TRUE; }
				if (Str::eq(entity, I"&dagger;")) { if (A) *A = 8224; return TRUE; }
				if (Str::eq(entity, I"&daleth;")) { if (A) *A = 8504; return TRUE; }
				if (Str::eq(entity, I"&darr;")) { if (A) *A = 8595; return TRUE; }
				if (Str::eq(entity, I"&dash;")) { if (A) *A = 8208; return TRUE; }
				if (Str::eq(entity, I"&dashv;")) { if (A) *A = 8867; return TRUE; }
				if (Str::eq(entity, I"&dbkarow;")) { if (A) *A = 10511; return TRUE; }
				if (Str::eq(entity, I"&dblac;")) { if (A) *A = 733; return TRUE; }
				if (Str::eq(entity, I"&dcaron;")) { if (A) *A = 271; return TRUE; }
				if (Str::eq(entity, I"&dcy;")) { if (A) *A = 1076; return TRUE; }
				if (Str::eq(entity, I"&dd;")) { if (A) *A = 8518; return TRUE; }
				if (Str::eq(entity, I"&ddagger;")) { if (A) *A = 8225; return TRUE; }
				if (Str::eq(entity, I"&ddarr;")) { if (A) *A = 8650; return TRUE; }
				if (Str::eq(entity, I"&ddotseq;")) { if (A) *A = 10871; return TRUE; }
				if (Str::eq(entity, I"&deg")) { if (A) *A = 176; return TRUE; }
				if (Str::eq(entity, I"&deg;")) { if (A) *A = 176; return TRUE; }
				if (Str::eq(entity, I"&delta;")) { if (A) *A = 948; return TRUE; }
				if (Str::eq(entity, I"&demptyv;")) { if (A) *A = 10673; return TRUE; }
				if (Str::eq(entity, I"&dfisht;")) { if (A) *A = 10623; return TRUE; }
				if (Str::eq(entity, I"&dfr;")) { if (A) *A = 120097; return TRUE; }
				if (Str::eq(entity, I"&dharl;")) { if (A) *A = 8643; return TRUE; }
				if (Str::eq(entity, I"&dharr;")) { if (A) *A = 8642; return TRUE; }
				if (Str::eq(entity, I"&diam;")) { if (A) *A = 8900; return TRUE; }
				if (Str::eq(entity, I"&diamond;")) { if (A) *A = 8900; return TRUE; }
				if (Str::eq(entity, I"&diamondsuit;")) { if (A) *A = 9830; return TRUE; }
				if (Str::eq(entity, I"&diams;")) { if (A) *A = 9830; return TRUE; }
				if (Str::eq(entity, I"&die;")) { if (A) *A = 168; return TRUE; }
				if (Str::eq(entity, I"&digamma;")) { if (A) *A = 989; return TRUE; }
				if (Str::eq(entity, I"&disin;")) { if (A) *A = 8946; return TRUE; }
				if (Str::eq(entity, I"&div;")) { if (A) *A = 247; return TRUE; }
				if (Str::eq(entity, I"&divide")) { if (A) *A = 247; return TRUE; }
				if (Str::eq(entity, I"&divide;")) { if (A) *A = 247; return TRUE; }
				if (Str::eq(entity, I"&divideontimes;")) { if (A) *A = 8903; return TRUE; }
				if (Str::eq(entity, I"&divonx;")) { if (A) *A = 8903; return TRUE; }
				if (Str::eq(entity, I"&djcy;")) { if (A) *A = 1106; return TRUE; }
				if (Str::eq(entity, I"&dlcorn;")) { if (A) *A = 8990; return TRUE; }
				if (Str::eq(entity, I"&dlcrop;")) { if (A) *A = 8973; return TRUE; }
				if (Str::eq(entity, I"&dollar;")) { if (A) *A = 36; return TRUE; }
				if (Str::eq(entity, I"&dopf;")) { if (A) *A = 120149; return TRUE; }
				if (Str::eq(entity, I"&dot;")) { if (A) *A = 729; return TRUE; }
				if (Str::eq(entity, I"&doteq;")) { if (A) *A = 8784; return TRUE; }
				if (Str::eq(entity, I"&doteqdot;")) { if (A) *A = 8785; return TRUE; }
				if (Str::eq(entity, I"&dotminus;")) { if (A) *A = 8760; return TRUE; }
				if (Str::eq(entity, I"&dotplus;")) { if (A) *A = 8724; return TRUE; }
				if (Str::eq(entity, I"&dotsquare;")) { if (A) *A = 8865; return TRUE; }
				if (Str::eq(entity, I"&doublebarwedge;")) { if (A) *A = 8966; return TRUE; }
				if (Str::eq(entity, I"&downarrow;")) { if (A) *A = 8595; return TRUE; }
				if (Str::eq(entity, I"&downdownarrows;")) { if (A) *A = 8650; return TRUE; }
				if (Str::eq(entity, I"&downharpoonleft;")) { if (A) *A = 8643; return TRUE; }
				if (Str::eq(entity, I"&downharpoonright;")) { if (A) *A = 8642; return TRUE; }
				if (Str::eq(entity, I"&drbkarow;")) { if (A) *A = 10512; return TRUE; }
				if (Str::eq(entity, I"&drcorn;")) { if (A) *A = 8991; return TRUE; }
				if (Str::eq(entity, I"&drcrop;")) { if (A) *A = 8972; return TRUE; }
				if (Str::eq(entity, I"&dscr;")) { if (A) *A = 119993; return TRUE; }
				if (Str::eq(entity, I"&dscy;")) { if (A) *A = 1109; return TRUE; }
				if (Str::eq(entity, I"&dsol;")) { if (A) *A = 10742; return TRUE; }
				if (Str::eq(entity, I"&dstrok;")) { if (A) *A = 273; return TRUE; }
				if (Str::eq(entity, I"&dtdot;")) { if (A) *A = 8945; return TRUE; }
				if (Str::eq(entity, I"&dtri;")) { if (A) *A = 9663; return TRUE; }
				if (Str::eq(entity, I"&dtrif;")) { if (A) *A = 9662; return TRUE; }
				if (Str::eq(entity, I"&duarr;")) { if (A) *A = 8693; return TRUE; }
				if (Str::eq(entity, I"&duhar;")) { if (A) *A = 10607; return TRUE; }
				if (Str::eq(entity, I"&dwangle;")) { if (A) *A = 10662; return TRUE; }
				if (Str::eq(entity, I"&dzcy;")) { if (A) *A = 1119; return TRUE; }
				if (Str::eq(entity, I"&dzigrarr;")) { if (A) *A = 10239; return TRUE; }
				break;
			case 'e':
				if (Str::eq(entity, I"&eDDot;")) { if (A) *A = 10871; return TRUE; }
				if (Str::eq(entity, I"&eDot;")) { if (A) *A = 8785; return TRUE; }
				if (Str::eq(entity, I"&eacute")) { if (A) *A = 233; return TRUE; }
				if (Str::eq(entity, I"&eacute;")) { if (A) *A = 233; return TRUE; }
				if (Str::eq(entity, I"&easter;")) { if (A) *A = 10862; return TRUE; }
				if (Str::eq(entity, I"&ecaron;")) { if (A) *A = 283; return TRUE; }
				if (Str::eq(entity, I"&ecir;")) { if (A) *A = 8790; return TRUE; }
				if (Str::eq(entity, I"&ecirc")) { if (A) *A = 234; return TRUE; }
				if (Str::eq(entity, I"&ecirc;")) { if (A) *A = 234; return TRUE; }
				if (Str::eq(entity, I"&ecolon;")) { if (A) *A = 8789; return TRUE; }
				if (Str::eq(entity, I"&ecy;")) { if (A) *A = 1101; return TRUE; }
				if (Str::eq(entity, I"&edot;")) { if (A) *A = 279; return TRUE; }
				if (Str::eq(entity, I"&ee;")) { if (A) *A = 8519; return TRUE; }
				if (Str::eq(entity, I"&efDot;")) { if (A) *A = 8786; return TRUE; }
				if (Str::eq(entity, I"&efr;")) { if (A) *A = 120098; return TRUE; }
				if (Str::eq(entity, I"&eg;")) { if (A) *A = 10906; return TRUE; }
				if (Str::eq(entity, I"&egrave")) { if (A) *A = 232; return TRUE; }
				if (Str::eq(entity, I"&egrave;")) { if (A) *A = 232; return TRUE; }
				if (Str::eq(entity, I"&egs;")) { if (A) *A = 10902; return TRUE; }
				if (Str::eq(entity, I"&egsdot;")) { if (A) *A = 10904; return TRUE; }
				if (Str::eq(entity, I"&el;")) { if (A) *A = 10905; return TRUE; }
				if (Str::eq(entity, I"&elinters;")) { if (A) *A = 9191; return TRUE; }
				if (Str::eq(entity, I"&ell;")) { if (A) *A = 8467; return TRUE; }
				if (Str::eq(entity, I"&els;")) { if (A) *A = 10901; return TRUE; }
				if (Str::eq(entity, I"&elsdot;")) { if (A) *A = 10903; return TRUE; }
				if (Str::eq(entity, I"&emacr;")) { if (A) *A = 275; return TRUE; }
				if (Str::eq(entity, I"&empty;")) { if (A) *A = 8709; return TRUE; }
				if (Str::eq(entity, I"&emptyset;")) { if (A) *A = 8709; return TRUE; }
				if (Str::eq(entity, I"&emptyv;")) { if (A) *A = 8709; return TRUE; }
				if (Str::eq(entity, I"&emsp13;")) { if (A) *A = 8196; return TRUE; }
				if (Str::eq(entity, I"&emsp14;")) { if (A) *A = 8197; return TRUE; }
				if (Str::eq(entity, I"&emsp;")) { if (A) *A = 8195; return TRUE; }
				if (Str::eq(entity, I"&eng;")) { if (A) *A = 331; return TRUE; }
				if (Str::eq(entity, I"&ensp;")) { if (A) *A = 8194; return TRUE; }
				if (Str::eq(entity, I"&eogon;")) { if (A) *A = 281; return TRUE; }
				if (Str::eq(entity, I"&eopf;")) { if (A) *A = 120150; return TRUE; }
				if (Str::eq(entity, I"&epar;")) { if (A) *A = 8917; return TRUE; }
				if (Str::eq(entity, I"&eparsl;")) { if (A) *A = 10723; return TRUE; }
				if (Str::eq(entity, I"&eplus;")) { if (A) *A = 10865; return TRUE; }
				if (Str::eq(entity, I"&epsi;")) { if (A) *A = 949; return TRUE; }
				if (Str::eq(entity, I"&epsilon;")) { if (A) *A = 949; return TRUE; }
				if (Str::eq(entity, I"&epsiv;")) { if (A) *A = 1013; return TRUE; }
				if (Str::eq(entity, I"&eqcirc;")) { if (A) *A = 8790; return TRUE; }
				if (Str::eq(entity, I"&eqcolon;")) { if (A) *A = 8789; return TRUE; }
				if (Str::eq(entity, I"&eqsim;")) { if (A) *A = 8770; return TRUE; }
				if (Str::eq(entity, I"&eqslantgtr;")) { if (A) *A = 10902; return TRUE; }
				if (Str::eq(entity, I"&eqslantless;")) { if (A) *A = 10901; return TRUE; }
				if (Str::eq(entity, I"&equals;")) { if (A) *A = 61; return TRUE; }
				if (Str::eq(entity, I"&equest;")) { if (A) *A = 8799; return TRUE; }
				if (Str::eq(entity, I"&equiv;")) { if (A) *A = 8801; return TRUE; }
				if (Str::eq(entity, I"&equivDD;")) { if (A) *A = 10872; return TRUE; }
				if (Str::eq(entity, I"&eqvparsl;")) { if (A) *A = 10725; return TRUE; }
				if (Str::eq(entity, I"&erDot;")) { if (A) *A = 8787; return TRUE; }
				if (Str::eq(entity, I"&erarr;")) { if (A) *A = 10609; return TRUE; }
				if (Str::eq(entity, I"&escr;")) { if (A) *A = 8495; return TRUE; }
				if (Str::eq(entity, I"&esdot;")) { if (A) *A = 8784; return TRUE; }
				if (Str::eq(entity, I"&esim;")) { if (A) *A = 8770; return TRUE; }
				if (Str::eq(entity, I"&eta;")) { if (A) *A = 951; return TRUE; }
				if (Str::eq(entity, I"&eth")) { if (A) *A = 240; return TRUE; }
				if (Str::eq(entity, I"&eth;")) { if (A) *A = 240; return TRUE; }
				if (Str::eq(entity, I"&euml")) { if (A) *A = 235; return TRUE; }
				if (Str::eq(entity, I"&euml;")) { if (A) *A = 235; return TRUE; }
				if (Str::eq(entity, I"&euro;")) { if (A) *A = 8364; return TRUE; }
				if (Str::eq(entity, I"&excl;")) { if (A) *A = 33; return TRUE; }
				if (Str::eq(entity, I"&exist;")) { if (A) *A = 8707; return TRUE; }
				if (Str::eq(entity, I"&expectation;")) { if (A) *A = 8496; return TRUE; }
				if (Str::eq(entity, I"&exponentiale;")) { if (A) *A = 8519; return TRUE; }
				break;
			case 'f':
				if (Str::eq(entity, I"&fallingdotseq;")) { if (A) *A = 8786; return TRUE; }
				if (Str::eq(entity, I"&fcy;")) { if (A) *A = 1092; return TRUE; }
				if (Str::eq(entity, I"&female;")) { if (A) *A = 9792; return TRUE; }
				if (Str::eq(entity, I"&ffilig;")) { if (A) *A = 64259; return TRUE; }
				if (Str::eq(entity, I"&fflig;")) { if (A) *A = 64256; return TRUE; }
				if (Str::eq(entity, I"&ffllig;")) { if (A) *A = 64260; return TRUE; }
				if (Str::eq(entity, I"&ffr;")) { if (A) *A = 120099; return TRUE; }
				if (Str::eq(entity, I"&filig;")) { if (A) *A = 64257; return TRUE; }
				if (Str::eq(entity, I"&fjlig;")) { if (A) *A = 102; if (B) *B = 106; return TRUE; }
				if (Str::eq(entity, I"&flat;")) { if (A) *A = 9837; return TRUE; }
				if (Str::eq(entity, I"&fllig;")) { if (A) *A = 64258; return TRUE; }
				if (Str::eq(entity, I"&fltns;")) { if (A) *A = 9649; return TRUE; }
				if (Str::eq(entity, I"&fnof;")) { if (A) *A = 402; return TRUE; }
				if (Str::eq(entity, I"&fopf;")) { if (A) *A = 120151; return TRUE; }
				if (Str::eq(entity, I"&forall;")) { if (A) *A = 8704; return TRUE; }
				if (Str::eq(entity, I"&fork;")) { if (A) *A = 8916; return TRUE; }
				if (Str::eq(entity, I"&forkv;")) { if (A) *A = 10969; return TRUE; }
				if (Str::eq(entity, I"&fpartint;")) { if (A) *A = 10765; return TRUE; }
				if (Str::eq(entity, I"&frac12")) { if (A) *A = 189; return TRUE; }
				if (Str::eq(entity, I"&frac12;")) { if (A) *A = 189; return TRUE; }
				if (Str::eq(entity, I"&frac13;")) { if (A) *A = 8531; return TRUE; }
				if (Str::eq(entity, I"&frac14")) { if (A) *A = 188; return TRUE; }
				if (Str::eq(entity, I"&frac14;")) { if (A) *A = 188; return TRUE; }
				if (Str::eq(entity, I"&frac15;")) { if (A) *A = 8533; return TRUE; }
				if (Str::eq(entity, I"&frac16;")) { if (A) *A = 8537; return TRUE; }
				if (Str::eq(entity, I"&frac18;")) { if (A) *A = 8539; return TRUE; }
				if (Str::eq(entity, I"&frac23;")) { if (A) *A = 8532; return TRUE; }
				if (Str::eq(entity, I"&frac25;")) { if (A) *A = 8534; return TRUE; }
				if (Str::eq(entity, I"&frac34")) { if (A) *A = 190; return TRUE; }
				if (Str::eq(entity, I"&frac34;")) { if (A) *A = 190; return TRUE; }
				if (Str::eq(entity, I"&frac35;")) { if (A) *A = 8535; return TRUE; }
				if (Str::eq(entity, I"&frac38;")) { if (A) *A = 8540; return TRUE; }
				if (Str::eq(entity, I"&frac45;")) { if (A) *A = 8536; return TRUE; }
				if (Str::eq(entity, I"&frac56;")) { if (A) *A = 8538; return TRUE; }
				if (Str::eq(entity, I"&frac58;")) { if (A) *A = 8541; return TRUE; }
				if (Str::eq(entity, I"&frac78;")) { if (A) *A = 8542; return TRUE; }
				if (Str::eq(entity, I"&frasl;")) { if (A) *A = 8260; return TRUE; }
				if (Str::eq(entity, I"&frown;")) { if (A) *A = 8994; return TRUE; }
				if (Str::eq(entity, I"&fscr;")) { if (A) *A = 119995; return TRUE; }
				break;
			case 'g':
				if (Str::eq(entity, I"&gE;")) { if (A) *A = 8807; return TRUE; }
				if (Str::eq(entity, I"&gEl;")) { if (A) *A = 10892; return TRUE; }
				if (Str::eq(entity, I"&gacute;")) { if (A) *A = 501; return TRUE; }
				if (Str::eq(entity, I"&gamma;")) { if (A) *A = 947; return TRUE; }
				if (Str::eq(entity, I"&gammad;")) { if (A) *A = 989; return TRUE; }
				if (Str::eq(entity, I"&gap;")) { if (A) *A = 10886; return TRUE; }
				if (Str::eq(entity, I"&gbreve;")) { if (A) *A = 287; return TRUE; }
				if (Str::eq(entity, I"&gcirc;")) { if (A) *A = 285; return TRUE; }
				if (Str::eq(entity, I"&gcy;")) { if (A) *A = 1075; return TRUE; }
				if (Str::eq(entity, I"&gdot;")) { if (A) *A = 289; return TRUE; }
				if (Str::eq(entity, I"&ge;")) { if (A) *A = 8805; return TRUE; }
				if (Str::eq(entity, I"&gel;")) { if (A) *A = 8923; return TRUE; }
				if (Str::eq(entity, I"&geq;")) { if (A) *A = 8805; return TRUE; }
				if (Str::eq(entity, I"&geqq;")) { if (A) *A = 8807; return TRUE; }
				if (Str::eq(entity, I"&geqslant;")) { if (A) *A = 10878; return TRUE; }
				if (Str::eq(entity, I"&ges;")) { if (A) *A = 10878; return TRUE; }
				if (Str::eq(entity, I"&gescc;")) { if (A) *A = 10921; return TRUE; }
				if (Str::eq(entity, I"&gesdot;")) { if (A) *A = 10880; return TRUE; }
				if (Str::eq(entity, I"&gesdoto;")) { if (A) *A = 10882; return TRUE; }
				if (Str::eq(entity, I"&gesdotol;")) { if (A) *A = 10884; return TRUE; }
				if (Str::eq(entity, I"&gesl;")) { if (A) *A = 8923; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&gesles;")) { if (A) *A = 10900; return TRUE; }
				if (Str::eq(entity, I"&gfr;")) { if (A) *A = 120100; return TRUE; }
				if (Str::eq(entity, I"&gg;")) { if (A) *A = 8811; return TRUE; }
				if (Str::eq(entity, I"&ggg;")) { if (A) *A = 8921; return TRUE; }
				if (Str::eq(entity, I"&gimel;")) { if (A) *A = 8503; return TRUE; }
				if (Str::eq(entity, I"&gjcy;")) { if (A) *A = 1107; return TRUE; }
				if (Str::eq(entity, I"&gl;")) { if (A) *A = 8823; return TRUE; }
				if (Str::eq(entity, I"&glE;")) { if (A) *A = 10898; return TRUE; }
				if (Str::eq(entity, I"&gla;")) { if (A) *A = 10917; return TRUE; }
				if (Str::eq(entity, I"&glj;")) { if (A) *A = 10916; return TRUE; }
				if (Str::eq(entity, I"&gnE;")) { if (A) *A = 8809; return TRUE; }
				if (Str::eq(entity, I"&gnap;")) { if (A) *A = 10890; return TRUE; }
				if (Str::eq(entity, I"&gnapprox;")) { if (A) *A = 10890; return TRUE; }
				if (Str::eq(entity, I"&gne;")) { if (A) *A = 10888; return TRUE; }
				if (Str::eq(entity, I"&gneq;")) { if (A) *A = 10888; return TRUE; }
				if (Str::eq(entity, I"&gneqq;")) { if (A) *A = 8809; return TRUE; }
				if (Str::eq(entity, I"&gnsim;")) { if (A) *A = 8935; return TRUE; }
				if (Str::eq(entity, I"&gopf;")) { if (A) *A = 120152; return TRUE; }
				if (Str::eq(entity, I"&grave;")) { if (A) *A = 96; return TRUE; }
				if (Str::eq(entity, I"&gscr;")) { if (A) *A = 8458; return TRUE; }
				if (Str::eq(entity, I"&gsim;")) { if (A) *A = 8819; return TRUE; }
				if (Str::eq(entity, I"&gsime;")) { if (A) *A = 10894; return TRUE; }
				if (Str::eq(entity, I"&gsiml;")) { if (A) *A = 10896; return TRUE; }
				if (Str::eq(entity, I"&gt")) { if (A) *A = 62; return TRUE; }
				if (Str::eq(entity, I"&gt;")) { if (A) *A = 62; return TRUE; }
				if (Str::eq(entity, I"&gtcc;")) { if (A) *A = 10919; return TRUE; }
				if (Str::eq(entity, I"&gtcir;")) { if (A) *A = 10874; return TRUE; }
				if (Str::eq(entity, I"&gtdot;")) { if (A) *A = 8919; return TRUE; }
				if (Str::eq(entity, I"&gtlPar;")) { if (A) *A = 10645; return TRUE; }
				if (Str::eq(entity, I"&gtquest;")) { if (A) *A = 10876; return TRUE; }
				if (Str::eq(entity, I"&gtrapprox;")) { if (A) *A = 10886; return TRUE; }
				if (Str::eq(entity, I"&gtrarr;")) { if (A) *A = 10616; return TRUE; }
				if (Str::eq(entity, I"&gtrdot;")) { if (A) *A = 8919; return TRUE; }
				if (Str::eq(entity, I"&gtreqless;")) { if (A) *A = 8923; return TRUE; }
				if (Str::eq(entity, I"&gtreqqless;")) { if (A) *A = 10892; return TRUE; }
				if (Str::eq(entity, I"&gtrless;")) { if (A) *A = 8823; return TRUE; }
				if (Str::eq(entity, I"&gtrsim;")) { if (A) *A = 8819; return TRUE; }
				if (Str::eq(entity, I"&gvertneqq;")) { if (A) *A = 8809; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&gvnE;")) { if (A) *A = 8809; if (B) *B = 65024; return TRUE; }
				break;
			case 'h':
				if (Str::eq(entity, I"&hArr;")) { if (A) *A = 8660; return TRUE; }
				if (Str::eq(entity, I"&hairsp;")) { if (A) *A = 8202; return TRUE; }
				if (Str::eq(entity, I"&half;")) { if (A) *A = 189; return TRUE; }
				if (Str::eq(entity, I"&hamilt;")) { if (A) *A = 8459; return TRUE; }
				if (Str::eq(entity, I"&hardcy;")) { if (A) *A = 1098; return TRUE; }
				if (Str::eq(entity, I"&harr;")) { if (A) *A = 8596; return TRUE; }
				if (Str::eq(entity, I"&harrcir;")) { if (A) *A = 10568; return TRUE; }
				if (Str::eq(entity, I"&harrw;")) { if (A) *A = 8621; return TRUE; }
				if (Str::eq(entity, I"&hbar;")) { if (A) *A = 8463; return TRUE; }
				if (Str::eq(entity, I"&hcirc;")) { if (A) *A = 293; return TRUE; }
				if (Str::eq(entity, I"&hearts;")) { if (A) *A = 9829; return TRUE; }
				if (Str::eq(entity, I"&heartsuit;")) { if (A) *A = 9829; return TRUE; }
				if (Str::eq(entity, I"&hellip;")) { if (A) *A = 8230; return TRUE; }
				if (Str::eq(entity, I"&hercon;")) { if (A) *A = 8889; return TRUE; }
				if (Str::eq(entity, I"&hfr;")) { if (A) *A = 120101; return TRUE; }
				if (Str::eq(entity, I"&hksearow;")) { if (A) *A = 10533; return TRUE; }
				if (Str::eq(entity, I"&hkswarow;")) { if (A) *A = 10534; return TRUE; }
				if (Str::eq(entity, I"&hoarr;")) { if (A) *A = 8703; return TRUE; }
				if (Str::eq(entity, I"&homtht;")) { if (A) *A = 8763; return TRUE; }
				if (Str::eq(entity, I"&hookleftarrow;")) { if (A) *A = 8617; return TRUE; }
				if (Str::eq(entity, I"&hookrightarrow;")) { if (A) *A = 8618; return TRUE; }
				if (Str::eq(entity, I"&hopf;")) { if (A) *A = 120153; return TRUE; }
				if (Str::eq(entity, I"&horbar;")) { if (A) *A = 8213; return TRUE; }
				if (Str::eq(entity, I"&hscr;")) { if (A) *A = 119997; return TRUE; }
				if (Str::eq(entity, I"&hslash;")) { if (A) *A = 8463; return TRUE; }
				if (Str::eq(entity, I"&hstrok;")) { if (A) *A = 295; return TRUE; }
				if (Str::eq(entity, I"&hybull;")) { if (A) *A = 8259; return TRUE; }
				if (Str::eq(entity, I"&hyphen;")) { if (A) *A = 8208; return TRUE; }
				break;
			case 'i':
				if (Str::eq(entity, I"&iacute")) { if (A) *A = 237; return TRUE; }
				if (Str::eq(entity, I"&iacute;")) { if (A) *A = 237; return TRUE; }
				if (Str::eq(entity, I"&ic;")) { if (A) *A = 8291; return TRUE; }
				if (Str::eq(entity, I"&icirc")) { if (A) *A = 238; return TRUE; }
				if (Str::eq(entity, I"&icirc;")) { if (A) *A = 238; return TRUE; }
				if (Str::eq(entity, I"&icy;")) { if (A) *A = 1080; return TRUE; }
				if (Str::eq(entity, I"&iecy;")) { if (A) *A = 1077; return TRUE; }
				if (Str::eq(entity, I"&iexcl")) { if (A) *A = 161; return TRUE; }
				if (Str::eq(entity, I"&iexcl;")) { if (A) *A = 161; return TRUE; }
				if (Str::eq(entity, I"&iff;")) { if (A) *A = 8660; return TRUE; }
				if (Str::eq(entity, I"&ifr;")) { if (A) *A = 120102; return TRUE; }
				if (Str::eq(entity, I"&igrave")) { if (A) *A = 236; return TRUE; }
				if (Str::eq(entity, I"&igrave;")) { if (A) *A = 236; return TRUE; }
				if (Str::eq(entity, I"&ii;")) { if (A) *A = 8520; return TRUE; }
				if (Str::eq(entity, I"&iiiint;")) { if (A) *A = 10764; return TRUE; }
				if (Str::eq(entity, I"&iiint;")) { if (A) *A = 8749; return TRUE; }
				if (Str::eq(entity, I"&iinfin;")) { if (A) *A = 10716; return TRUE; }
				if (Str::eq(entity, I"&iiota;")) { if (A) *A = 8489; return TRUE; }
				if (Str::eq(entity, I"&ijlig;")) { if (A) *A = 307; return TRUE; }
				if (Str::eq(entity, I"&imacr;")) { if (A) *A = 299; return TRUE; }
				if (Str::eq(entity, I"&image;")) { if (A) *A = 8465; return TRUE; }
				if (Str::eq(entity, I"&imagline;")) { if (A) *A = 8464; return TRUE; }
				if (Str::eq(entity, I"&imagpart;")) { if (A) *A = 8465; return TRUE; }
				if (Str::eq(entity, I"&imath;")) { if (A) *A = 305; return TRUE; }
				if (Str::eq(entity, I"&imof;")) { if (A) *A = 8887; return TRUE; }
				if (Str::eq(entity, I"&imped;")) { if (A) *A = 437; return TRUE; }
				if (Str::eq(entity, I"&in;")) { if (A) *A = 8712; return TRUE; }
				if (Str::eq(entity, I"&incare;")) { if (A) *A = 8453; return TRUE; }
				if (Str::eq(entity, I"&infin;")) { if (A) *A = 8734; return TRUE; }
				if (Str::eq(entity, I"&infintie;")) { if (A) *A = 10717; return TRUE; }
				if (Str::eq(entity, I"&inodot;")) { if (A) *A = 305; return TRUE; }
				if (Str::eq(entity, I"&int;")) { if (A) *A = 8747; return TRUE; }
				if (Str::eq(entity, I"&intcal;")) { if (A) *A = 8890; return TRUE; }
				if (Str::eq(entity, I"&integers;")) { if (A) *A = 8484; return TRUE; }
				if (Str::eq(entity, I"&intercal;")) { if (A) *A = 8890; return TRUE; }
				if (Str::eq(entity, I"&intlarhk;")) { if (A) *A = 10775; return TRUE; }
				if (Str::eq(entity, I"&intprod;")) { if (A) *A = 10812; return TRUE; }
				if (Str::eq(entity, I"&iocy;")) { if (A) *A = 1105; return TRUE; }
				if (Str::eq(entity, I"&iogon;")) { if (A) *A = 303; return TRUE; }
				if (Str::eq(entity, I"&iopf;")) { if (A) *A = 120154; return TRUE; }
				if (Str::eq(entity, I"&iota;")) { if (A) *A = 953; return TRUE; }
				if (Str::eq(entity, I"&iprod;")) { if (A) *A = 10812; return TRUE; }
				if (Str::eq(entity, I"&iquest")) { if (A) *A = 191; return TRUE; }
				if (Str::eq(entity, I"&iquest;")) { if (A) *A = 191; return TRUE; }
				if (Str::eq(entity, I"&iscr;")) { if (A) *A = 119998; return TRUE; }
				if (Str::eq(entity, I"&isin;")) { if (A) *A = 8712; return TRUE; }
				if (Str::eq(entity, I"&isinE;")) { if (A) *A = 8953; return TRUE; }
				if (Str::eq(entity, I"&isindot;")) { if (A) *A = 8949; return TRUE; }
				if (Str::eq(entity, I"&isins;")) { if (A) *A = 8948; return TRUE; }
				if (Str::eq(entity, I"&isinsv;")) { if (A) *A = 8947; return TRUE; }
				if (Str::eq(entity, I"&isinv;")) { if (A) *A = 8712; return TRUE; }
				if (Str::eq(entity, I"&it;")) { if (A) *A = 8290; return TRUE; }
				if (Str::eq(entity, I"&itilde;")) { if (A) *A = 297; return TRUE; }
				if (Str::eq(entity, I"&iukcy;")) { if (A) *A = 1110; return TRUE; }
				if (Str::eq(entity, I"&iuml")) { if (A) *A = 239; return TRUE; }
				if (Str::eq(entity, I"&iuml;")) { if (A) *A = 239; return TRUE; }
				break;
			case 'j':
				if (Str::eq(entity, I"&jcirc;")) { if (A) *A = 309; return TRUE; }
				if (Str::eq(entity, I"&jcy;")) { if (A) *A = 1081; return TRUE; }
				if (Str::eq(entity, I"&jfr;")) { if (A) *A = 120103; return TRUE; }
				if (Str::eq(entity, I"&jmath;")) { if (A) *A = 567; return TRUE; }
				if (Str::eq(entity, I"&jopf;")) { if (A) *A = 120155; return TRUE; }
				if (Str::eq(entity, I"&jscr;")) { if (A) *A = 119999; return TRUE; }
				if (Str::eq(entity, I"&jsercy;")) { if (A) *A = 1112; return TRUE; }
				if (Str::eq(entity, I"&jukcy;")) { if (A) *A = 1108; return TRUE; }
				break;
			case 'k':
				if (Str::eq(entity, I"&kappa;")) { if (A) *A = 954; return TRUE; }
				if (Str::eq(entity, I"&kappav;")) { if (A) *A = 1008; return TRUE; }
				if (Str::eq(entity, I"&kcedil;")) { if (A) *A = 311; return TRUE; }
				if (Str::eq(entity, I"&kcy;")) { if (A) *A = 1082; return TRUE; }
				if (Str::eq(entity, I"&kfr;")) { if (A) *A = 120104; return TRUE; }
				if (Str::eq(entity, I"&kgreen;")) { if (A) *A = 312; return TRUE; }
				if (Str::eq(entity, I"&khcy;")) { if (A) *A = 1093; return TRUE; }
				if (Str::eq(entity, I"&kjcy;")) { if (A) *A = 1116; return TRUE; }
				if (Str::eq(entity, I"&kopf;")) { if (A) *A = 120156; return TRUE; }
				if (Str::eq(entity, I"&kscr;")) { if (A) *A = 120000; return TRUE; }
				break;
			case 'l':
				if (Str::eq(entity, I"&lAarr;")) { if (A) *A = 8666; return TRUE; }
				if (Str::eq(entity, I"&lArr;")) { if (A) *A = 8656; return TRUE; }
				if (Str::eq(entity, I"&lAtail;")) { if (A) *A = 10523; return TRUE; }
				if (Str::eq(entity, I"&lBarr;")) { if (A) *A = 10510; return TRUE; }
				if (Str::eq(entity, I"&lE;")) { if (A) *A = 8806; return TRUE; }
				if (Str::eq(entity, I"&lEg;")) { if (A) *A = 10891; return TRUE; }
				if (Str::eq(entity, I"&lHar;")) { if (A) *A = 10594; return TRUE; }
				if (Str::eq(entity, I"&lacute;")) { if (A) *A = 314; return TRUE; }
				if (Str::eq(entity, I"&laemptyv;")) { if (A) *A = 10676; return TRUE; }
				if (Str::eq(entity, I"&lagran;")) { if (A) *A = 8466; return TRUE; }
				if (Str::eq(entity, I"&lambda;")) { if (A) *A = 955; return TRUE; }
				if (Str::eq(entity, I"&lang;")) { if (A) *A = 10216; return TRUE; }
				if (Str::eq(entity, I"&langd;")) { if (A) *A = 10641; return TRUE; }
				if (Str::eq(entity, I"&langle;")) { if (A) *A = 10216; return TRUE; }
				if (Str::eq(entity, I"&lap;")) { if (A) *A = 10885; return TRUE; }
				if (Str::eq(entity, I"&laquo")) { if (A) *A = 171; return TRUE; }
				if (Str::eq(entity, I"&laquo;")) { if (A) *A = 171; return TRUE; }
				if (Str::eq(entity, I"&larr;")) { if (A) *A = 8592; return TRUE; }
				if (Str::eq(entity, I"&larrb;")) { if (A) *A = 8676; return TRUE; }
				if (Str::eq(entity, I"&larrbfs;")) { if (A) *A = 10527; return TRUE; }
				if (Str::eq(entity, I"&larrfs;")) { if (A) *A = 10525; return TRUE; }
				if (Str::eq(entity, I"&larrhk;")) { if (A) *A = 8617; return TRUE; }
				if (Str::eq(entity, I"&larrlp;")) { if (A) *A = 8619; return TRUE; }
				if (Str::eq(entity, I"&larrpl;")) { if (A) *A = 10553; return TRUE; }
				if (Str::eq(entity, I"&larrsim;")) { if (A) *A = 10611; return TRUE; }
				if (Str::eq(entity, I"&larrtl;")) { if (A) *A = 8610; return TRUE; }
				if (Str::eq(entity, I"&lat;")) { if (A) *A = 10923; return TRUE; }
				if (Str::eq(entity, I"&latail;")) { if (A) *A = 10521; return TRUE; }
				if (Str::eq(entity, I"&late;")) { if (A) *A = 10925; return TRUE; }
				if (Str::eq(entity, I"&lates;")) { if (A) *A = 10925; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&lbarr;")) { if (A) *A = 10508; return TRUE; }
				if (Str::eq(entity, I"&lbbrk;")) { if (A) *A = 10098; return TRUE; }
				if (Str::eq(entity, I"&lbrace;")) { if (A) *A = 123; return TRUE; }
				if (Str::eq(entity, I"&lbrack;")) { if (A) *A = 91; return TRUE; }
				if (Str::eq(entity, I"&lbrke;")) { if (A) *A = 10635; return TRUE; }
				if (Str::eq(entity, I"&lbrksld;")) { if (A) *A = 10639; return TRUE; }
				if (Str::eq(entity, I"&lbrkslu;")) { if (A) *A = 10637; return TRUE; }
				if (Str::eq(entity, I"&lcaron;")) { if (A) *A = 318; return TRUE; }
				if (Str::eq(entity, I"&lcedil;")) { if (A) *A = 316; return TRUE; }
				if (Str::eq(entity, I"&lceil;")) { if (A) *A = 8968; return TRUE; }
				if (Str::eq(entity, I"&lcub;")) { if (A) *A = 123; return TRUE; }
				if (Str::eq(entity, I"&lcy;")) { if (A) *A = 1083; return TRUE; }
				if (Str::eq(entity, I"&ldca;")) { if (A) *A = 10550; return TRUE; }
				if (Str::eq(entity, I"&ldquo;")) { if (A) *A = 8220; return TRUE; }
				if (Str::eq(entity, I"&ldquor;")) { if (A) *A = 8222; return TRUE; }
				if (Str::eq(entity, I"&ldrdhar;")) { if (A) *A = 10599; return TRUE; }
				if (Str::eq(entity, I"&ldrushar;")) { if (A) *A = 10571; return TRUE; }
				if (Str::eq(entity, I"&ldsh;")) { if (A) *A = 8626; return TRUE; }
				if (Str::eq(entity, I"&le;")) { if (A) *A = 8804; return TRUE; }
				if (Str::eq(entity, I"&leftarrow;")) { if (A) *A = 8592; return TRUE; }
				if (Str::eq(entity, I"&leftarrowtail;")) { if (A) *A = 8610; return TRUE; }
				if (Str::eq(entity, I"&leftharpoondown;")) { if (A) *A = 8637; return TRUE; }
				if (Str::eq(entity, I"&leftharpoonup;")) { if (A) *A = 8636; return TRUE; }
				if (Str::eq(entity, I"&leftleftarrows;")) { if (A) *A = 8647; return TRUE; }
				if (Str::eq(entity, I"&leftrightarrow;")) { if (A) *A = 8596; return TRUE; }
				if (Str::eq(entity, I"&leftrightarrows;")) { if (A) *A = 8646; return TRUE; }
				if (Str::eq(entity, I"&leftrightharpoons;")) { if (A) *A = 8651; return TRUE; }
				if (Str::eq(entity, I"&leftrightsquigarrow;")) { if (A) *A = 8621; return TRUE; }
				if (Str::eq(entity, I"&leftthreetimes;")) { if (A) *A = 8907; return TRUE; }
				if (Str::eq(entity, I"&leg;")) { if (A) *A = 8922; return TRUE; }
				if (Str::eq(entity, I"&leq;")) { if (A) *A = 8804; return TRUE; }
				if (Str::eq(entity, I"&leqq;")) { if (A) *A = 8806; return TRUE; }
				if (Str::eq(entity, I"&leqslant;")) { if (A) *A = 10877; return TRUE; }
				if (Str::eq(entity, I"&les;")) { if (A) *A = 10877; return TRUE; }
				if (Str::eq(entity, I"&lescc;")) { if (A) *A = 10920; return TRUE; }
				if (Str::eq(entity, I"&lesdot;")) { if (A) *A = 10879; return TRUE; }
				if (Str::eq(entity, I"&lesdoto;")) { if (A) *A = 10881; return TRUE; }
				if (Str::eq(entity, I"&lesdotor;")) { if (A) *A = 10883; return TRUE; }
				if (Str::eq(entity, I"&lesg;")) { if (A) *A = 8922; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&lesges;")) { if (A) *A = 10899; return TRUE; }
				if (Str::eq(entity, I"&lessapprox;")) { if (A) *A = 10885; return TRUE; }
				if (Str::eq(entity, I"&lessdot;")) { if (A) *A = 8918; return TRUE; }
				if (Str::eq(entity, I"&lesseqgtr;")) { if (A) *A = 8922; return TRUE; }
				if (Str::eq(entity, I"&lesseqqgtr;")) { if (A) *A = 10891; return TRUE; }
				if (Str::eq(entity, I"&lessgtr;")) { if (A) *A = 8822; return TRUE; }
				if (Str::eq(entity, I"&lesssim;")) { if (A) *A = 8818; return TRUE; }
				if (Str::eq(entity, I"&lfisht;")) { if (A) *A = 10620; return TRUE; }
				if (Str::eq(entity, I"&lfloor;")) { if (A) *A = 8970; return TRUE; }
				if (Str::eq(entity, I"&lfr;")) { if (A) *A = 120105; return TRUE; }
				if (Str::eq(entity, I"&lg;")) { if (A) *A = 8822; return TRUE; }
				if (Str::eq(entity, I"&lgE;")) { if (A) *A = 10897; return TRUE; }
				if (Str::eq(entity, I"&lhard;")) { if (A) *A = 8637; return TRUE; }
				if (Str::eq(entity, I"&lharu;")) { if (A) *A = 8636; return TRUE; }
				if (Str::eq(entity, I"&lharul;")) { if (A) *A = 10602; return TRUE; }
				if (Str::eq(entity, I"&lhblk;")) { if (A) *A = 9604; return TRUE; }
				if (Str::eq(entity, I"&ljcy;")) { if (A) *A = 1113; return TRUE; }
				if (Str::eq(entity, I"&ll;")) { if (A) *A = 8810; return TRUE; }
				if (Str::eq(entity, I"&llarr;")) { if (A) *A = 8647; return TRUE; }
				if (Str::eq(entity, I"&llcorner;")) { if (A) *A = 8990; return TRUE; }
				if (Str::eq(entity, I"&llhard;")) { if (A) *A = 10603; return TRUE; }
				if (Str::eq(entity, I"&lltri;")) { if (A) *A = 9722; return TRUE; }
				if (Str::eq(entity, I"&lmidot;")) { if (A) *A = 320; return TRUE; }
				if (Str::eq(entity, I"&lmoust;")) { if (A) *A = 9136; return TRUE; }
				if (Str::eq(entity, I"&lmoustache;")) { if (A) *A = 9136; return TRUE; }
				if (Str::eq(entity, I"&lnE;")) { if (A) *A = 8808; return TRUE; }
				if (Str::eq(entity, I"&lnap;")) { if (A) *A = 10889; return TRUE; }
				if (Str::eq(entity, I"&lnapprox;")) { if (A) *A = 10889; return TRUE; }
				if (Str::eq(entity, I"&lne;")) { if (A) *A = 10887; return TRUE; }
				if (Str::eq(entity, I"&lneq;")) { if (A) *A = 10887; return TRUE; }
				if (Str::eq(entity, I"&lneqq;")) { if (A) *A = 8808; return TRUE; }
				if (Str::eq(entity, I"&lnsim;")) { if (A) *A = 8934; return TRUE; }
				if (Str::eq(entity, I"&loang;")) { if (A) *A = 10220; return TRUE; }
				if (Str::eq(entity, I"&loarr;")) { if (A) *A = 8701; return TRUE; }
				if (Str::eq(entity, I"&lobrk;")) { if (A) *A = 10214; return TRUE; }
				if (Str::eq(entity, I"&longleftarrow;")) { if (A) *A = 10229; return TRUE; }
				if (Str::eq(entity, I"&longleftrightarrow;")) { if (A) *A = 10231; return TRUE; }
				if (Str::eq(entity, I"&longmapsto;")) { if (A) *A = 10236; return TRUE; }
				if (Str::eq(entity, I"&longrightarrow;")) { if (A) *A = 10230; return TRUE; }
				if (Str::eq(entity, I"&looparrowleft;")) { if (A) *A = 8619; return TRUE; }
				if (Str::eq(entity, I"&looparrowright;")) { if (A) *A = 8620; return TRUE; }
				if (Str::eq(entity, I"&lopar;")) { if (A) *A = 10629; return TRUE; }
				if (Str::eq(entity, I"&lopf;")) { if (A) *A = 120157; return TRUE; }
				if (Str::eq(entity, I"&loplus;")) { if (A) *A = 10797; return TRUE; }
				if (Str::eq(entity, I"&lotimes;")) { if (A) *A = 10804; return TRUE; }
				if (Str::eq(entity, I"&lowast;")) { if (A) *A = 8727; return TRUE; }
				if (Str::eq(entity, I"&lowbar;")) { if (A) *A = 95; return TRUE; }
				if (Str::eq(entity, I"&loz;")) { if (A) *A = 9674; return TRUE; }
				if (Str::eq(entity, I"&lozenge;")) { if (A) *A = 9674; return TRUE; }
				if (Str::eq(entity, I"&lozf;")) { if (A) *A = 10731; return TRUE; }
				if (Str::eq(entity, I"&lpar;")) { if (A) *A = 40; return TRUE; }
				if (Str::eq(entity, I"&lparlt;")) { if (A) *A = 10643; return TRUE; }
				if (Str::eq(entity, I"&lrarr;")) { if (A) *A = 8646; return TRUE; }
				if (Str::eq(entity, I"&lrcorner;")) { if (A) *A = 8991; return TRUE; }
				if (Str::eq(entity, I"&lrhar;")) { if (A) *A = 8651; return TRUE; }
				if (Str::eq(entity, I"&lrhard;")) { if (A) *A = 10605; return TRUE; }
				if (Str::eq(entity, I"&lrm;")) { if (A) *A = 8206; return TRUE; }
				if (Str::eq(entity, I"&lrtri;")) { if (A) *A = 8895; return TRUE; }
				if (Str::eq(entity, I"&lsaquo;")) { if (A) *A = 8249; return TRUE; }
				if (Str::eq(entity, I"&lscr;")) { if (A) *A = 120001; return TRUE; }
				if (Str::eq(entity, I"&lsh;")) { if (A) *A = 8624; return TRUE; }
				if (Str::eq(entity, I"&lsim;")) { if (A) *A = 8818; return TRUE; }
				if (Str::eq(entity, I"&lsime;")) { if (A) *A = 10893; return TRUE; }
				if (Str::eq(entity, I"&lsimg;")) { if (A) *A = 10895; return TRUE; }
				if (Str::eq(entity, I"&lsqb;")) { if (A) *A = 91; return TRUE; }
				if (Str::eq(entity, I"&lsquo;")) { if (A) *A = 8216; return TRUE; }
				if (Str::eq(entity, I"&lsquor;")) { if (A) *A = 8218; return TRUE; }
				if (Str::eq(entity, I"&lstrok;")) { if (A) *A = 322; return TRUE; }
				if (Str::eq(entity, I"&lt")) { if (A) *A = 60; return TRUE; }
				if (Str::eq(entity, I"&lt;")) { if (A) *A = 60; return TRUE; }
				if (Str::eq(entity, I"&ltcc;")) { if (A) *A = 10918; return TRUE; }
				if (Str::eq(entity, I"&ltcir;")) { if (A) *A = 10873; return TRUE; }
				if (Str::eq(entity, I"&ltdot;")) { if (A) *A = 8918; return TRUE; }
				if (Str::eq(entity, I"&lthree;")) { if (A) *A = 8907; return TRUE; }
				if (Str::eq(entity, I"&ltimes;")) { if (A) *A = 8905; return TRUE; }
				if (Str::eq(entity, I"&ltlarr;")) { if (A) *A = 10614; return TRUE; }
				if (Str::eq(entity, I"&ltquest;")) { if (A) *A = 10875; return TRUE; }
				if (Str::eq(entity, I"&ltrPar;")) { if (A) *A = 10646; return TRUE; }
				if (Str::eq(entity, I"&ltri;")) { if (A) *A = 9667; return TRUE; }
				if (Str::eq(entity, I"&ltrie;")) { if (A) *A = 8884; return TRUE; }
				if (Str::eq(entity, I"&ltrif;")) { if (A) *A = 9666; return TRUE; }
				if (Str::eq(entity, I"&lurdshar;")) { if (A) *A = 10570; return TRUE; }
				if (Str::eq(entity, I"&luruhar;")) { if (A) *A = 10598; return TRUE; }
				if (Str::eq(entity, I"&lvertneqq;")) { if (A) *A = 8808; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&lvnE;")) { if (A) *A = 8808; if (B) *B = 65024; return TRUE; }
				break;
			case 'm':
				if (Str::eq(entity, I"&mDDot;")) { if (A) *A = 8762; return TRUE; }
				if (Str::eq(entity, I"&macr")) { if (A) *A = 175; return TRUE; }
				if (Str::eq(entity, I"&macr;")) { if (A) *A = 175; return TRUE; }
				if (Str::eq(entity, I"&male;")) { if (A) *A = 9794; return TRUE; }
				if (Str::eq(entity, I"&malt;")) { if (A) *A = 10016; return TRUE; }
				if (Str::eq(entity, I"&maltese;")) { if (A) *A = 10016; return TRUE; }
				if (Str::eq(entity, I"&map;")) { if (A) *A = 8614; return TRUE; }
				if (Str::eq(entity, I"&mapsto;")) { if (A) *A = 8614; return TRUE; }
				if (Str::eq(entity, I"&mapstodown;")) { if (A) *A = 8615; return TRUE; }
				if (Str::eq(entity, I"&mapstoleft;")) { if (A) *A = 8612; return TRUE; }
				if (Str::eq(entity, I"&mapstoup;")) { if (A) *A = 8613; return TRUE; }
				if (Str::eq(entity, I"&marker;")) { if (A) *A = 9646; return TRUE; }
				if (Str::eq(entity, I"&mcomma;")) { if (A) *A = 10793; return TRUE; }
				if (Str::eq(entity, I"&mcy;")) { if (A) *A = 1084; return TRUE; }
				if (Str::eq(entity, I"&mdash;")) { if (A) *A = 8212; return TRUE; }
				if (Str::eq(entity, I"&measuredangle;")) { if (A) *A = 8737; return TRUE; }
				if (Str::eq(entity, I"&mfr;")) { if (A) *A = 120106; return TRUE; }
				if (Str::eq(entity, I"&mho;")) { if (A) *A = 8487; return TRUE; }
				if (Str::eq(entity, I"&micro")) { if (A) *A = 181; return TRUE; }
				if (Str::eq(entity, I"&micro;")) { if (A) *A = 181; return TRUE; }
				if (Str::eq(entity, I"&mid;")) { if (A) *A = 8739; return TRUE; }
				if (Str::eq(entity, I"&midast;")) { if (A) *A = 42; return TRUE; }
				if (Str::eq(entity, I"&midcir;")) { if (A) *A = 10992; return TRUE; }
				if (Str::eq(entity, I"&middot")) { if (A) *A = 183; return TRUE; }
				if (Str::eq(entity, I"&middot;")) { if (A) *A = 183; return TRUE; }
				if (Str::eq(entity, I"&minus;")) { if (A) *A = 8722; return TRUE; }
				if (Str::eq(entity, I"&minusb;")) { if (A) *A = 8863; return TRUE; }
				if (Str::eq(entity, I"&minusd;")) { if (A) *A = 8760; return TRUE; }
				if (Str::eq(entity, I"&minusdu;")) { if (A) *A = 10794; return TRUE; }
				if (Str::eq(entity, I"&mlcp;")) { if (A) *A = 10971; return TRUE; }
				if (Str::eq(entity, I"&mldr;")) { if (A) *A = 8230; return TRUE; }
				if (Str::eq(entity, I"&mnplus;")) { if (A) *A = 8723; return TRUE; }
				if (Str::eq(entity, I"&models;")) { if (A) *A = 8871; return TRUE; }
				if (Str::eq(entity, I"&mopf;")) { if (A) *A = 120158; return TRUE; }
				if (Str::eq(entity, I"&mp;")) { if (A) *A = 8723; return TRUE; }
				if (Str::eq(entity, I"&mscr;")) { if (A) *A = 120002; return TRUE; }
				if (Str::eq(entity, I"&mstpos;")) { if (A) *A = 8766; return TRUE; }
				if (Str::eq(entity, I"&mu;")) { if (A) *A = 956; return TRUE; }
				if (Str::eq(entity, I"&multimap;")) { if (A) *A = 8888; return TRUE; }
				if (Str::eq(entity, I"&mumap;")) { if (A) *A = 8888; return TRUE; }
				break;
			case 'n':
				if (Str::eq(entity, I"&nGg;")) { if (A) *A = 8921; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nGt;")) { if (A) *A = 8811; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nGtv;")) { if (A) *A = 8811; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nLeftarrow;")) { if (A) *A = 8653; return TRUE; }
				if (Str::eq(entity, I"&nLeftrightarrow;")) { if (A) *A = 8654; return TRUE; }
				if (Str::eq(entity, I"&nLl;")) { if (A) *A = 8920; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nLt;")) { if (A) *A = 8810; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nLtv;")) { if (A) *A = 8810; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nRightarrow;")) { if (A) *A = 8655; return TRUE; }
				if (Str::eq(entity, I"&nVDash;")) { if (A) *A = 8879; return TRUE; }
				if (Str::eq(entity, I"&nVdash;")) { if (A) *A = 8878; return TRUE; }
				if (Str::eq(entity, I"&nabla;")) { if (A) *A = 8711; return TRUE; }
				if (Str::eq(entity, I"&nacute;")) { if (A) *A = 324; return TRUE; }
				if (Str::eq(entity, I"&nang;")) { if (A) *A = 8736; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nap;")) { if (A) *A = 8777; return TRUE; }
				if (Str::eq(entity, I"&napE;")) { if (A) *A = 10864; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&napid;")) { if (A) *A = 8779; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&napos;")) { if (A) *A = 329; return TRUE; }
				if (Str::eq(entity, I"&napprox;")) { if (A) *A = 8777; return TRUE; }
				if (Str::eq(entity, I"&natur;")) { if (A) *A = 9838; return TRUE; }
				if (Str::eq(entity, I"&natural;")) { if (A) *A = 9838; return TRUE; }
				if (Str::eq(entity, I"&naturals;")) { if (A) *A = 8469; return TRUE; }
				if (Str::eq(entity, I"&nbsp")) { if (A) *A = 160; return TRUE; }
				if (Str::eq(entity, I"&nbsp;")) { if (A) *A = 160; return TRUE; }
				if (Str::eq(entity, I"&nbump;")) { if (A) *A = 8782; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nbumpe;")) { if (A) *A = 8783; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&ncap;")) { if (A) *A = 10819; return TRUE; }
				if (Str::eq(entity, I"&ncaron;")) { if (A) *A = 328; return TRUE; }
				if (Str::eq(entity, I"&ncedil;")) { if (A) *A = 326; return TRUE; }
				if (Str::eq(entity, I"&ncong;")) { if (A) *A = 8775; return TRUE; }
				if (Str::eq(entity, I"&ncongdot;")) { if (A) *A = 10861; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&ncup;")) { if (A) *A = 10818; return TRUE; }
				if (Str::eq(entity, I"&ncy;")) { if (A) *A = 1085; return TRUE; }
				if (Str::eq(entity, I"&ndash;")) { if (A) *A = 8211; return TRUE; }
				if (Str::eq(entity, I"&ne;")) { if (A) *A = 8800; return TRUE; }
				if (Str::eq(entity, I"&neArr;")) { if (A) *A = 8663; return TRUE; }
				if (Str::eq(entity, I"&nearhk;")) { if (A) *A = 10532; return TRUE; }
				if (Str::eq(entity, I"&nearr;")) { if (A) *A = 8599; return TRUE; }
				if (Str::eq(entity, I"&nearrow;")) { if (A) *A = 8599; return TRUE; }
				if (Str::eq(entity, I"&nedot;")) { if (A) *A = 8784; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nequiv;")) { if (A) *A = 8802; return TRUE; }
				if (Str::eq(entity, I"&nesear;")) { if (A) *A = 10536; return TRUE; }
				if (Str::eq(entity, I"&nesim;")) { if (A) *A = 8770; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nexist;")) { if (A) *A = 8708; return TRUE; }
				if (Str::eq(entity, I"&nexists;")) { if (A) *A = 8708; return TRUE; }
				if (Str::eq(entity, I"&nfr;")) { if (A) *A = 120107; return TRUE; }
				if (Str::eq(entity, I"&ngE;")) { if (A) *A = 8807; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nge;")) { if (A) *A = 8817; return TRUE; }
				if (Str::eq(entity, I"&ngeq;")) { if (A) *A = 8817; return TRUE; }
				if (Str::eq(entity, I"&ngeqq;")) { if (A) *A = 8807; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&ngeqslant;")) { if (A) *A = 10878; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nges;")) { if (A) *A = 10878; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&ngsim;")) { if (A) *A = 8821; return TRUE; }
				if (Str::eq(entity, I"&ngt;")) { if (A) *A = 8815; return TRUE; }
				if (Str::eq(entity, I"&ngtr;")) { if (A) *A = 8815; return TRUE; }
				if (Str::eq(entity, I"&nhArr;")) { if (A) *A = 8654; return TRUE; }
				if (Str::eq(entity, I"&nharr;")) { if (A) *A = 8622; return TRUE; }
				if (Str::eq(entity, I"&nhpar;")) { if (A) *A = 10994; return TRUE; }
				if (Str::eq(entity, I"&ni;")) { if (A) *A = 8715; return TRUE; }
				if (Str::eq(entity, I"&nis;")) { if (A) *A = 8956; return TRUE; }
				if (Str::eq(entity, I"&nisd;")) { if (A) *A = 8954; return TRUE; }
				if (Str::eq(entity, I"&niv;")) { if (A) *A = 8715; return TRUE; }
				if (Str::eq(entity, I"&njcy;")) { if (A) *A = 1114; return TRUE; }
				if (Str::eq(entity, I"&nlArr;")) { if (A) *A = 8653; return TRUE; }
				if (Str::eq(entity, I"&nlE;")) { if (A) *A = 8806; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nlarr;")) { if (A) *A = 8602; return TRUE; }
				if (Str::eq(entity, I"&nldr;")) { if (A) *A = 8229; return TRUE; }
				if (Str::eq(entity, I"&nle;")) { if (A) *A = 8816; return TRUE; }
				if (Str::eq(entity, I"&nleftarrow;")) { if (A) *A = 8602; return TRUE; }
				if (Str::eq(entity, I"&nleftrightarrow;")) { if (A) *A = 8622; return TRUE; }
				if (Str::eq(entity, I"&nleq;")) { if (A) *A = 8816; return TRUE; }
				if (Str::eq(entity, I"&nleqq;")) { if (A) *A = 8806; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nleqslant;")) { if (A) *A = 10877; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nles;")) { if (A) *A = 10877; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nless;")) { if (A) *A = 8814; return TRUE; }
				if (Str::eq(entity, I"&nlsim;")) { if (A) *A = 8820; return TRUE; }
				if (Str::eq(entity, I"&nlt;")) { if (A) *A = 8814; return TRUE; }
				if (Str::eq(entity, I"&nltri;")) { if (A) *A = 8938; return TRUE; }
				if (Str::eq(entity, I"&nltrie;")) { if (A) *A = 8940; return TRUE; }
				if (Str::eq(entity, I"&nmid;")) { if (A) *A = 8740; return TRUE; }
				if (Str::eq(entity, I"&nopf;")) { if (A) *A = 120159; return TRUE; }
				if (Str::eq(entity, I"&not")) { if (A) *A = 172; return TRUE; }
				if (Str::eq(entity, I"&not;")) { if (A) *A = 172; return TRUE; }
				if (Str::eq(entity, I"&notin;")) { if (A) *A = 8713; return TRUE; }
				if (Str::eq(entity, I"&notinE;")) { if (A) *A = 8953; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&notindot;")) { if (A) *A = 8949; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&notinva;")) { if (A) *A = 8713; return TRUE; }
				if (Str::eq(entity, I"&notinvb;")) { if (A) *A = 8951; return TRUE; }
				if (Str::eq(entity, I"&notinvc;")) { if (A) *A = 8950; return TRUE; }
				if (Str::eq(entity, I"&notni;")) { if (A) *A = 8716; return TRUE; }
				if (Str::eq(entity, I"&notniva;")) { if (A) *A = 8716; return TRUE; }
				if (Str::eq(entity, I"&notnivb;")) { if (A) *A = 8958; return TRUE; }
				if (Str::eq(entity, I"&notnivc;")) { if (A) *A = 8957; return TRUE; }
				if (Str::eq(entity, I"&npar;")) { if (A) *A = 8742; return TRUE; }
				if (Str::eq(entity, I"&nparallel;")) { if (A) *A = 8742; return TRUE; }
				if (Str::eq(entity, I"&nparsl;")) { if (A) *A = 11005; if (B) *B = 8421; return TRUE; }
				if (Str::eq(entity, I"&npart;")) { if (A) *A = 8706; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&npolint;")) { if (A) *A = 10772; return TRUE; }
				if (Str::eq(entity, I"&npr;")) { if (A) *A = 8832; return TRUE; }
				if (Str::eq(entity, I"&nprcue;")) { if (A) *A = 8928; return TRUE; }
				if (Str::eq(entity, I"&npre;")) { if (A) *A = 10927; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nprec;")) { if (A) *A = 8832; return TRUE; }
				if (Str::eq(entity, I"&npreceq;")) { if (A) *A = 10927; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nrArr;")) { if (A) *A = 8655; return TRUE; }
				if (Str::eq(entity, I"&nrarr;")) { if (A) *A = 8603; return TRUE; }
				if (Str::eq(entity, I"&nrarrc;")) { if (A) *A = 10547; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nrarrw;")) { if (A) *A = 8605; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nrightarrow;")) { if (A) *A = 8603; return TRUE; }
				if (Str::eq(entity, I"&nrtri;")) { if (A) *A = 8939; return TRUE; }
				if (Str::eq(entity, I"&nrtrie;")) { if (A) *A = 8941; return TRUE; }
				if (Str::eq(entity, I"&nsc;")) { if (A) *A = 8833; return TRUE; }
				if (Str::eq(entity, I"&nsccue;")) { if (A) *A = 8929; return TRUE; }
				if (Str::eq(entity, I"&nsce;")) { if (A) *A = 10928; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nscr;")) { if (A) *A = 120003; return TRUE; }
				if (Str::eq(entity, I"&nshortmid;")) { if (A) *A = 8740; return TRUE; }
				if (Str::eq(entity, I"&nshortparallel;")) { if (A) *A = 8742; return TRUE; }
				if (Str::eq(entity, I"&nsim;")) { if (A) *A = 8769; return TRUE; }
				if (Str::eq(entity, I"&nsime;")) { if (A) *A = 8772; return TRUE; }
				if (Str::eq(entity, I"&nsimeq;")) { if (A) *A = 8772; return TRUE; }
				if (Str::eq(entity, I"&nsmid;")) { if (A) *A = 8740; return TRUE; }
				if (Str::eq(entity, I"&nspar;")) { if (A) *A = 8742; return TRUE; }
				if (Str::eq(entity, I"&nsqsube;")) { if (A) *A = 8930; return TRUE; }
				if (Str::eq(entity, I"&nsqsupe;")) { if (A) *A = 8931; return TRUE; }
				if (Str::eq(entity, I"&nsub;")) { if (A) *A = 8836; return TRUE; }
				if (Str::eq(entity, I"&nsubE;")) { if (A) *A = 10949; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nsube;")) { if (A) *A = 8840; return TRUE; }
				if (Str::eq(entity, I"&nsubset;")) { if (A) *A = 8834; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nsubseteq;")) { if (A) *A = 8840; return TRUE; }
				if (Str::eq(entity, I"&nsubseteqq;")) { if (A) *A = 10949; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nsucc;")) { if (A) *A = 8833; return TRUE; }
				if (Str::eq(entity, I"&nsucceq;")) { if (A) *A = 10928; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nsup;")) { if (A) *A = 8837; return TRUE; }
				if (Str::eq(entity, I"&nsupE;")) { if (A) *A = 10950; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&nsupe;")) { if (A) *A = 8841; return TRUE; }
				if (Str::eq(entity, I"&nsupset;")) { if (A) *A = 8835; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nsupseteq;")) { if (A) *A = 8841; return TRUE; }
				if (Str::eq(entity, I"&nsupseteqq;")) { if (A) *A = 10950; if (B) *B = 824; return TRUE; }
				if (Str::eq(entity, I"&ntgl;")) { if (A) *A = 8825; return TRUE; }
				if (Str::eq(entity, I"&ntilde")) { if (A) *A = 241; return TRUE; }
				if (Str::eq(entity, I"&ntilde;")) { if (A) *A = 241; return TRUE; }
				if (Str::eq(entity, I"&ntlg;")) { if (A) *A = 8824; return TRUE; }
				if (Str::eq(entity, I"&ntriangleleft;")) { if (A) *A = 8938; return TRUE; }
				if (Str::eq(entity, I"&ntrianglelefteq;")) { if (A) *A = 8940; return TRUE; }
				if (Str::eq(entity, I"&ntriangleright;")) { if (A) *A = 8939; return TRUE; }
				if (Str::eq(entity, I"&ntrianglerighteq;")) { if (A) *A = 8941; return TRUE; }
				if (Str::eq(entity, I"&nu;")) { if (A) *A = 957; return TRUE; }
				if (Str::eq(entity, I"&num;")) { if (A) *A = 35; return TRUE; }
				if (Str::eq(entity, I"&numero;")) { if (A) *A = 8470; return TRUE; }
				if (Str::eq(entity, I"&numsp;")) { if (A) *A = 8199; return TRUE; }
				if (Str::eq(entity, I"&nvDash;")) { if (A) *A = 8877; return TRUE; }
				if (Str::eq(entity, I"&nvHarr;")) { if (A) *A = 10500; return TRUE; }
				if (Str::eq(entity, I"&nvap;")) { if (A) *A = 8781; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nvdash;")) { if (A) *A = 8876; return TRUE; }
				if (Str::eq(entity, I"&nvge;")) { if (A) *A = 8805; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nvgt;")) { if (A) *A = 62; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nvinfin;")) { if (A) *A = 10718; return TRUE; }
				if (Str::eq(entity, I"&nvlArr;")) { if (A) *A = 10498; return TRUE; }
				if (Str::eq(entity, I"&nvle;")) { if (A) *A = 8804; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nvlt;")) { if (A) *A = 60; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nvltrie;")) { if (A) *A = 8884; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nvrArr;")) { if (A) *A = 10499; return TRUE; }
				if (Str::eq(entity, I"&nvrtrie;")) { if (A) *A = 8885; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nvsim;")) { if (A) *A = 8764; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&nwArr;")) { if (A) *A = 8662; return TRUE; }
				if (Str::eq(entity, I"&nwarhk;")) { if (A) *A = 10531; return TRUE; }
				if (Str::eq(entity, I"&nwarr;")) { if (A) *A = 8598; return TRUE; }
				if (Str::eq(entity, I"&nwarrow;")) { if (A) *A = 8598; return TRUE; }
				if (Str::eq(entity, I"&nwnear;")) { if (A) *A = 10535; return TRUE; }
				break;
			case 'o':
				if (Str::eq(entity, I"&oS;")) { if (A) *A = 9416; return TRUE; }
				if (Str::eq(entity, I"&oacute")) { if (A) *A = 243; return TRUE; }
				if (Str::eq(entity, I"&oacute;")) { if (A) *A = 243; return TRUE; }
				if (Str::eq(entity, I"&oast;")) { if (A) *A = 8859; return TRUE; }
				if (Str::eq(entity, I"&ocir;")) { if (A) *A = 8858; return TRUE; }
				if (Str::eq(entity, I"&ocirc")) { if (A) *A = 244; return TRUE; }
				if (Str::eq(entity, I"&ocirc;")) { if (A) *A = 244; return TRUE; }
				if (Str::eq(entity, I"&ocy;")) { if (A) *A = 1086; return TRUE; }
				if (Str::eq(entity, I"&odash;")) { if (A) *A = 8861; return TRUE; }
				if (Str::eq(entity, I"&odblac;")) { if (A) *A = 337; return TRUE; }
				if (Str::eq(entity, I"&odiv;")) { if (A) *A = 10808; return TRUE; }
				if (Str::eq(entity, I"&odot;")) { if (A) *A = 8857; return TRUE; }
				if (Str::eq(entity, I"&odsold;")) { if (A) *A = 10684; return TRUE; }
				if (Str::eq(entity, I"&oelig;")) { if (A) *A = 339; return TRUE; }
				if (Str::eq(entity, I"&ofcir;")) { if (A) *A = 10687; return TRUE; }
				if (Str::eq(entity, I"&ofr;")) { if (A) *A = 120108; return TRUE; }
				if (Str::eq(entity, I"&ogon;")) { if (A) *A = 731; return TRUE; }
				if (Str::eq(entity, I"&ograve")) { if (A) *A = 242; return TRUE; }
				if (Str::eq(entity, I"&ograve;")) { if (A) *A = 242; return TRUE; }
				if (Str::eq(entity, I"&ogt;")) { if (A) *A = 10689; return TRUE; }
				if (Str::eq(entity, I"&ohbar;")) { if (A) *A = 10677; return TRUE; }
				if (Str::eq(entity, I"&ohm;")) { if (A) *A = 937; return TRUE; }
				if (Str::eq(entity, I"&oint;")) { if (A) *A = 8750; return TRUE; }
				if (Str::eq(entity, I"&olarr;")) { if (A) *A = 8634; return TRUE; }
				if (Str::eq(entity, I"&olcir;")) { if (A) *A = 10686; return TRUE; }
				if (Str::eq(entity, I"&olcross;")) { if (A) *A = 10683; return TRUE; }
				if (Str::eq(entity, I"&oline;")) { if (A) *A = 8254; return TRUE; }
				if (Str::eq(entity, I"&olt;")) { if (A) *A = 10688; return TRUE; }
				if (Str::eq(entity, I"&omacr;")) { if (A) *A = 333; return TRUE; }
				if (Str::eq(entity, I"&omega;")) { if (A) *A = 969; return TRUE; }
				if (Str::eq(entity, I"&omicron;")) { if (A) *A = 959; return TRUE; }
				if (Str::eq(entity, I"&omid;")) { if (A) *A = 10678; return TRUE; }
				if (Str::eq(entity, I"&ominus;")) { if (A) *A = 8854; return TRUE; }
				if (Str::eq(entity, I"&oopf;")) { if (A) *A = 120160; return TRUE; }
				if (Str::eq(entity, I"&opar;")) { if (A) *A = 10679; return TRUE; }
				if (Str::eq(entity, I"&operp;")) { if (A) *A = 10681; return TRUE; }
				if (Str::eq(entity, I"&oplus;")) { if (A) *A = 8853; return TRUE; }
				if (Str::eq(entity, I"&or;")) { if (A) *A = 8744; return TRUE; }
				if (Str::eq(entity, I"&orarr;")) { if (A) *A = 8635; return TRUE; }
				if (Str::eq(entity, I"&ord;")) { if (A) *A = 10845; return TRUE; }
				if (Str::eq(entity, I"&order;")) { if (A) *A = 8500; return TRUE; }
				if (Str::eq(entity, I"&orderof;")) { if (A) *A = 8500; return TRUE; }
				if (Str::eq(entity, I"&ordf")) { if (A) *A = 170; return TRUE; }
				if (Str::eq(entity, I"&ordf;")) { if (A) *A = 170; return TRUE; }
				if (Str::eq(entity, I"&ordm")) { if (A) *A = 186; return TRUE; }
				if (Str::eq(entity, I"&ordm;")) { if (A) *A = 186; return TRUE; }
				if (Str::eq(entity, I"&origof;")) { if (A) *A = 8886; return TRUE; }
				if (Str::eq(entity, I"&oror;")) { if (A) *A = 10838; return TRUE; }
				if (Str::eq(entity, I"&orslope;")) { if (A) *A = 10839; return TRUE; }
				if (Str::eq(entity, I"&orv;")) { if (A) *A = 10843; return TRUE; }
				if (Str::eq(entity, I"&oscr;")) { if (A) *A = 8500; return TRUE; }
				if (Str::eq(entity, I"&oslash")) { if (A) *A = 248; return TRUE; }
				if (Str::eq(entity, I"&oslash;")) { if (A) *A = 248; return TRUE; }
				if (Str::eq(entity, I"&osol;")) { if (A) *A = 8856; return TRUE; }
				if (Str::eq(entity, I"&otilde")) { if (A) *A = 245; return TRUE; }
				if (Str::eq(entity, I"&otilde;")) { if (A) *A = 245; return TRUE; }
				if (Str::eq(entity, I"&otimes;")) { if (A) *A = 8855; return TRUE; }
				if (Str::eq(entity, I"&otimesas;")) { if (A) *A = 10806; return TRUE; }
				if (Str::eq(entity, I"&ouml")) { if (A) *A = 246; return TRUE; }
				if (Str::eq(entity, I"&ouml;")) { if (A) *A = 246; return TRUE; }
				if (Str::eq(entity, I"&ovbar;")) { if (A) *A = 9021; return TRUE; }
				break;
			case 'p':
				if (Str::eq(entity, I"&par;")) { if (A) *A = 8741; return TRUE; }
				if (Str::eq(entity, I"&para")) { if (A) *A = 182; return TRUE; }
				if (Str::eq(entity, I"&para;")) { if (A) *A = 182; return TRUE; }
				if (Str::eq(entity, I"&parallel;")) { if (A) *A = 8741; return TRUE; }
				if (Str::eq(entity, I"&parsim;")) { if (A) *A = 10995; return TRUE; }
				if (Str::eq(entity, I"&parsl;")) { if (A) *A = 11005; return TRUE; }
				if (Str::eq(entity, I"&part;")) { if (A) *A = 8706; return TRUE; }
				if (Str::eq(entity, I"&pcy;")) { if (A) *A = 1087; return TRUE; }
				if (Str::eq(entity, I"&percnt;")) { if (A) *A = 37; return TRUE; }
				if (Str::eq(entity, I"&period;")) { if (A) *A = 46; return TRUE; }
				if (Str::eq(entity, I"&permil;")) { if (A) *A = 8240; return TRUE; }
				if (Str::eq(entity, I"&perp;")) { if (A) *A = 8869; return TRUE; }
				if (Str::eq(entity, I"&pertenk;")) { if (A) *A = 8241; return TRUE; }
				if (Str::eq(entity, I"&pfr;")) { if (A) *A = 120109; return TRUE; }
				if (Str::eq(entity, I"&phi;")) { if (A) *A = 966; return TRUE; }
				if (Str::eq(entity, I"&phiv;")) { if (A) *A = 981; return TRUE; }
				if (Str::eq(entity, I"&phmmat;")) { if (A) *A = 8499; return TRUE; }
				if (Str::eq(entity, I"&phone;")) { if (A) *A = 9742; return TRUE; }
				if (Str::eq(entity, I"&pi;")) { if (A) *A = 960; return TRUE; }
				if (Str::eq(entity, I"&pitchfork;")) { if (A) *A = 8916; return TRUE; }
				if (Str::eq(entity, I"&piv;")) { if (A) *A = 982; return TRUE; }
				if (Str::eq(entity, I"&planck;")) { if (A) *A = 8463; return TRUE; }
				if (Str::eq(entity, I"&planckh;")) { if (A) *A = 8462; return TRUE; }
				if (Str::eq(entity, I"&plankv;")) { if (A) *A = 8463; return TRUE; }
				if (Str::eq(entity, I"&plus;")) { if (A) *A = 43; return TRUE; }
				if (Str::eq(entity, I"&plusacir;")) { if (A) *A = 10787; return TRUE; }
				if (Str::eq(entity, I"&plusb;")) { if (A) *A = 8862; return TRUE; }
				if (Str::eq(entity, I"&pluscir;")) { if (A) *A = 10786; return TRUE; }
				if (Str::eq(entity, I"&plusdo;")) { if (A) *A = 8724; return TRUE; }
				if (Str::eq(entity, I"&plusdu;")) { if (A) *A = 10789; return TRUE; }
				if (Str::eq(entity, I"&pluse;")) { if (A) *A = 10866; return TRUE; }
				if (Str::eq(entity, I"&plusmn")) { if (A) *A = 177; return TRUE; }
				if (Str::eq(entity, I"&plusmn;")) { if (A) *A = 177; return TRUE; }
				if (Str::eq(entity, I"&plussim;")) { if (A) *A = 10790; return TRUE; }
				if (Str::eq(entity, I"&plustwo;")) { if (A) *A = 10791; return TRUE; }
				if (Str::eq(entity, I"&pm;")) { if (A) *A = 177; return TRUE; }
				if (Str::eq(entity, I"&pointint;")) { if (A) *A = 10773; return TRUE; }
				if (Str::eq(entity, I"&popf;")) { if (A) *A = 120161; return TRUE; }
				if (Str::eq(entity, I"&pound")) { if (A) *A = 163; return TRUE; }
				if (Str::eq(entity, I"&pound;")) { if (A) *A = 163; return TRUE; }
				if (Str::eq(entity, I"&pr;")) { if (A) *A = 8826; return TRUE; }
				if (Str::eq(entity, I"&prE;")) { if (A) *A = 10931; return TRUE; }
				if (Str::eq(entity, I"&prap;")) { if (A) *A = 10935; return TRUE; }
				if (Str::eq(entity, I"&prcue;")) { if (A) *A = 8828; return TRUE; }
				if (Str::eq(entity, I"&pre;")) { if (A) *A = 10927; return TRUE; }
				if (Str::eq(entity, I"&prec;")) { if (A) *A = 8826; return TRUE; }
				if (Str::eq(entity, I"&precapprox;")) { if (A) *A = 10935; return TRUE; }
				if (Str::eq(entity, I"&preccurlyeq;")) { if (A) *A = 8828; return TRUE; }
				if (Str::eq(entity, I"&preceq;")) { if (A) *A = 10927; return TRUE; }
				if (Str::eq(entity, I"&precnapprox;")) { if (A) *A = 10937; return TRUE; }
				if (Str::eq(entity, I"&precneqq;")) { if (A) *A = 10933; return TRUE; }
				if (Str::eq(entity, I"&precnsim;")) { if (A) *A = 8936; return TRUE; }
				if (Str::eq(entity, I"&precsim;")) { if (A) *A = 8830; return TRUE; }
				if (Str::eq(entity, I"&prime;")) { if (A) *A = 8242; return TRUE; }
				if (Str::eq(entity, I"&primes;")) { if (A) *A = 8473; return TRUE; }
				if (Str::eq(entity, I"&prnE;")) { if (A) *A = 10933; return TRUE; }
				if (Str::eq(entity, I"&prnap;")) { if (A) *A = 10937; return TRUE; }
				if (Str::eq(entity, I"&prnsim;")) { if (A) *A = 8936; return TRUE; }
				if (Str::eq(entity, I"&prod;")) { if (A) *A = 8719; return TRUE; }
				if (Str::eq(entity, I"&profalar;")) { if (A) *A = 9006; return TRUE; }
				if (Str::eq(entity, I"&profline;")) { if (A) *A = 8978; return TRUE; }
				if (Str::eq(entity, I"&profsurf;")) { if (A) *A = 8979; return TRUE; }
				if (Str::eq(entity, I"&prop;")) { if (A) *A = 8733; return TRUE; }
				if (Str::eq(entity, I"&propto;")) { if (A) *A = 8733; return TRUE; }
				if (Str::eq(entity, I"&prsim;")) { if (A) *A = 8830; return TRUE; }
				if (Str::eq(entity, I"&prurel;")) { if (A) *A = 8880; return TRUE; }
				if (Str::eq(entity, I"&pscr;")) { if (A) *A = 120005; return TRUE; }
				if (Str::eq(entity, I"&psi;")) { if (A) *A = 968; return TRUE; }
				if (Str::eq(entity, I"&puncsp;")) { if (A) *A = 8200; return TRUE; }
				break;
			case 'q':
				if (Str::eq(entity, I"&qfr;")) { if (A) *A = 120110; return TRUE; }
				if (Str::eq(entity, I"&qint;")) { if (A) *A = 10764; return TRUE; }
				if (Str::eq(entity, I"&qopf;")) { if (A) *A = 120162; return TRUE; }
				if (Str::eq(entity, I"&qprime;")) { if (A) *A = 8279; return TRUE; }
				if (Str::eq(entity, I"&qscr;")) { if (A) *A = 120006; return TRUE; }
				if (Str::eq(entity, I"&quaternions;")) { if (A) *A = 8461; return TRUE; }
				if (Str::eq(entity, I"&quatint;")) { if (A) *A = 10774; return TRUE; }
				if (Str::eq(entity, I"&quest;")) { if (A) *A = 63; return TRUE; }
				if (Str::eq(entity, I"&questeq;")) { if (A) *A = 8799; return TRUE; }
				if (Str::eq(entity, I"&quot")) { if (A) *A = 34; return TRUE; }
				if (Str::eq(entity, I"&quot;")) { if (A) *A = 34; return TRUE; }
				break;
			case 'r':
				if (Str::eq(entity, I"&rAarr;")) { if (A) *A = 8667; return TRUE; }
				if (Str::eq(entity, I"&rArr;")) { if (A) *A = 8658; return TRUE; }
				if (Str::eq(entity, I"&rAtail;")) { if (A) *A = 10524; return TRUE; }
				if (Str::eq(entity, I"&rBarr;")) { if (A) *A = 10511; return TRUE; }
				if (Str::eq(entity, I"&rHar;")) { if (A) *A = 10596; return TRUE; }
				if (Str::eq(entity, I"&race;")) { if (A) *A = 8765; if (B) *B = 817; return TRUE; }
				if (Str::eq(entity, I"&racute;")) { if (A) *A = 341; return TRUE; }
				if (Str::eq(entity, I"&radic;")) { if (A) *A = 8730; return TRUE; }
				if (Str::eq(entity, I"&raemptyv;")) { if (A) *A = 10675; return TRUE; }
				if (Str::eq(entity, I"&rang;")) { if (A) *A = 10217; return TRUE; }
				if (Str::eq(entity, I"&rangd;")) { if (A) *A = 10642; return TRUE; }
				if (Str::eq(entity, I"&range;")) { if (A) *A = 10661; return TRUE; }
				if (Str::eq(entity, I"&rangle;")) { if (A) *A = 10217; return TRUE; }
				if (Str::eq(entity, I"&raquo")) { if (A) *A = 187; return TRUE; }
				if (Str::eq(entity, I"&raquo;")) { if (A) *A = 187; return TRUE; }
				if (Str::eq(entity, I"&rarr;")) { if (A) *A = 8594; return TRUE; }
				if (Str::eq(entity, I"&rarrap;")) { if (A) *A = 10613; return TRUE; }
				if (Str::eq(entity, I"&rarrb;")) { if (A) *A = 8677; return TRUE; }
				if (Str::eq(entity, I"&rarrbfs;")) { if (A) *A = 10528; return TRUE; }
				if (Str::eq(entity, I"&rarrc;")) { if (A) *A = 10547; return TRUE; }
				if (Str::eq(entity, I"&rarrfs;")) { if (A) *A = 10526; return TRUE; }
				if (Str::eq(entity, I"&rarrhk;")) { if (A) *A = 8618; return TRUE; }
				if (Str::eq(entity, I"&rarrlp;")) { if (A) *A = 8620; return TRUE; }
				if (Str::eq(entity, I"&rarrpl;")) { if (A) *A = 10565; return TRUE; }
				if (Str::eq(entity, I"&rarrsim;")) { if (A) *A = 10612; return TRUE; }
				if (Str::eq(entity, I"&rarrtl;")) { if (A) *A = 8611; return TRUE; }
				if (Str::eq(entity, I"&rarrw;")) { if (A) *A = 8605; return TRUE; }
				if (Str::eq(entity, I"&ratail;")) { if (A) *A = 10522; return TRUE; }
				if (Str::eq(entity, I"&ratio;")) { if (A) *A = 8758; return TRUE; }
				if (Str::eq(entity, I"&rationals;")) { if (A) *A = 8474; return TRUE; }
				if (Str::eq(entity, I"&rbarr;")) { if (A) *A = 10509; return TRUE; }
				if (Str::eq(entity, I"&rbbrk;")) { if (A) *A = 10099; return TRUE; }
				if (Str::eq(entity, I"&rbrace;")) { if (A) *A = 125; return TRUE; }
				if (Str::eq(entity, I"&rbrack;")) { if (A) *A = 93; return TRUE; }
				if (Str::eq(entity, I"&rbrke;")) { if (A) *A = 10636; return TRUE; }
				if (Str::eq(entity, I"&rbrksld;")) { if (A) *A = 10638; return TRUE; }
				if (Str::eq(entity, I"&rbrkslu;")) { if (A) *A = 10640; return TRUE; }
				if (Str::eq(entity, I"&rcaron;")) { if (A) *A = 345; return TRUE; }
				if (Str::eq(entity, I"&rcedil;")) { if (A) *A = 343; return TRUE; }
				if (Str::eq(entity, I"&rceil;")) { if (A) *A = 8969; return TRUE; }
				if (Str::eq(entity, I"&rcub;")) { if (A) *A = 125; return TRUE; }
				if (Str::eq(entity, I"&rcy;")) { if (A) *A = 1088; return TRUE; }
				if (Str::eq(entity, I"&rdca;")) { if (A) *A = 10551; return TRUE; }
				if (Str::eq(entity, I"&rdldhar;")) { if (A) *A = 10601; return TRUE; }
				if (Str::eq(entity, I"&rdquo;")) { if (A) *A = 8221; return TRUE; }
				if (Str::eq(entity, I"&rdquor;")) { if (A) *A = 8221; return TRUE; }
				if (Str::eq(entity, I"&rdsh;")) { if (A) *A = 8627; return TRUE; }
				if (Str::eq(entity, I"&real;")) { if (A) *A = 8476; return TRUE; }
				if (Str::eq(entity, I"&realine;")) { if (A) *A = 8475; return TRUE; }
				if (Str::eq(entity, I"&realpart;")) { if (A) *A = 8476; return TRUE; }
				if (Str::eq(entity, I"&reals;")) { if (A) *A = 8477; return TRUE; }
				if (Str::eq(entity, I"&rect;")) { if (A) *A = 9645; return TRUE; }
				if (Str::eq(entity, I"&reg")) { if (A) *A = 174; return TRUE; }
				if (Str::eq(entity, I"&reg;")) { if (A) *A = 174; return TRUE; }
				if (Str::eq(entity, I"&rfisht;")) { if (A) *A = 10621; return TRUE; }
				if (Str::eq(entity, I"&rfloor;")) { if (A) *A = 8971; return TRUE; }
				if (Str::eq(entity, I"&rfr;")) { if (A) *A = 120111; return TRUE; }
				if (Str::eq(entity, I"&rhard;")) { if (A) *A = 8641; return TRUE; }
				if (Str::eq(entity, I"&rharu;")) { if (A) *A = 8640; return TRUE; }
				if (Str::eq(entity, I"&rharul;")) { if (A) *A = 10604; return TRUE; }
				if (Str::eq(entity, I"&rho;")) { if (A) *A = 961; return TRUE; }
				if (Str::eq(entity, I"&rhov;")) { if (A) *A = 1009; return TRUE; }
				if (Str::eq(entity, I"&rightarrow;")) { if (A) *A = 8594; return TRUE; }
				if (Str::eq(entity, I"&rightarrowtail;")) { if (A) *A = 8611; return TRUE; }
				if (Str::eq(entity, I"&rightharpoondown;")) { if (A) *A = 8641; return TRUE; }
				if (Str::eq(entity, I"&rightharpoonup;")) { if (A) *A = 8640; return TRUE; }
				if (Str::eq(entity, I"&rightleftarrows;")) { if (A) *A = 8644; return TRUE; }
				if (Str::eq(entity, I"&rightleftharpoons;")) { if (A) *A = 8652; return TRUE; }
				if (Str::eq(entity, I"&rightrightarrows;")) { if (A) *A = 8649; return TRUE; }
				if (Str::eq(entity, I"&rightsquigarrow;")) { if (A) *A = 8605; return TRUE; }
				if (Str::eq(entity, I"&rightthreetimes;")) { if (A) *A = 8908; return TRUE; }
				if (Str::eq(entity, I"&ring;")) { if (A) *A = 730; return TRUE; }
				if (Str::eq(entity, I"&risingdotseq;")) { if (A) *A = 8787; return TRUE; }
				if (Str::eq(entity, I"&rlarr;")) { if (A) *A = 8644; return TRUE; }
				if (Str::eq(entity, I"&rlhar;")) { if (A) *A = 8652; return TRUE; }
				if (Str::eq(entity, I"&rlm;")) { if (A) *A = 8207; return TRUE; }
				if (Str::eq(entity, I"&rmoust;")) { if (A) *A = 9137; return TRUE; }
				if (Str::eq(entity, I"&rmoustache;")) { if (A) *A = 9137; return TRUE; }
				if (Str::eq(entity, I"&rnmid;")) { if (A) *A = 10990; return TRUE; }
				if (Str::eq(entity, I"&roang;")) { if (A) *A = 10221; return TRUE; }
				if (Str::eq(entity, I"&roarr;")) { if (A) *A = 8702; return TRUE; }
				if (Str::eq(entity, I"&robrk;")) { if (A) *A = 10215; return TRUE; }
				if (Str::eq(entity, I"&ropar;")) { if (A) *A = 10630; return TRUE; }
				if (Str::eq(entity, I"&ropf;")) { if (A) *A = 120163; return TRUE; }
				if (Str::eq(entity, I"&roplus;")) { if (A) *A = 10798; return TRUE; }
				if (Str::eq(entity, I"&rotimes;")) { if (A) *A = 10805; return TRUE; }
				if (Str::eq(entity, I"&rpar;")) { if (A) *A = 41; return TRUE; }
				if (Str::eq(entity, I"&rpargt;")) { if (A) *A = 10644; return TRUE; }
				if (Str::eq(entity, I"&rppolint;")) { if (A) *A = 10770; return TRUE; }
				if (Str::eq(entity, I"&rrarr;")) { if (A) *A = 8649; return TRUE; }
				if (Str::eq(entity, I"&rsaquo;")) { if (A) *A = 8250; return TRUE; }
				if (Str::eq(entity, I"&rscr;")) { if (A) *A = 120007; return TRUE; }
				if (Str::eq(entity, I"&rsh;")) { if (A) *A = 8625; return TRUE; }
				if (Str::eq(entity, I"&rsqb;")) { if (A) *A = 93; return TRUE; }
				if (Str::eq(entity, I"&rsquo;")) { if (A) *A = 8217; return TRUE; }
				if (Str::eq(entity, I"&rsquor;")) { if (A) *A = 8217; return TRUE; }
				if (Str::eq(entity, I"&rthree;")) { if (A) *A = 8908; return TRUE; }
				if (Str::eq(entity, I"&rtimes;")) { if (A) *A = 8906; return TRUE; }
				if (Str::eq(entity, I"&rtri;")) { if (A) *A = 9657; return TRUE; }
				if (Str::eq(entity, I"&rtrie;")) { if (A) *A = 8885; return TRUE; }
				if (Str::eq(entity, I"&rtrif;")) { if (A) *A = 9656; return TRUE; }
				if (Str::eq(entity, I"&rtriltri;")) { if (A) *A = 10702; return TRUE; }
				if (Str::eq(entity, I"&ruluhar;")) { if (A) *A = 10600; return TRUE; }
				if (Str::eq(entity, I"&rx;")) { if (A) *A = 8478; return TRUE; }
				break;
			case 's':
				if (Str::eq(entity, I"&sacute;")) { if (A) *A = 347; return TRUE; }
				if (Str::eq(entity, I"&sbquo;")) { if (A) *A = 8218; return TRUE; }
				if (Str::eq(entity, I"&sc;")) { if (A) *A = 8827; return TRUE; }
				if (Str::eq(entity, I"&scE;")) { if (A) *A = 10932; return TRUE; }
				if (Str::eq(entity, I"&scap;")) { if (A) *A = 10936; return TRUE; }
				if (Str::eq(entity, I"&scaron;")) { if (A) *A = 353; return TRUE; }
				if (Str::eq(entity, I"&sccue;")) { if (A) *A = 8829; return TRUE; }
				if (Str::eq(entity, I"&sce;")) { if (A) *A = 10928; return TRUE; }
				if (Str::eq(entity, I"&scedil;")) { if (A) *A = 351; return TRUE; }
				if (Str::eq(entity, I"&scirc;")) { if (A) *A = 349; return TRUE; }
				if (Str::eq(entity, I"&scnE;")) { if (A) *A = 10934; return TRUE; }
				if (Str::eq(entity, I"&scnap;")) { if (A) *A = 10938; return TRUE; }
				if (Str::eq(entity, I"&scnsim;")) { if (A) *A = 8937; return TRUE; }
				if (Str::eq(entity, I"&scpolint;")) { if (A) *A = 10771; return TRUE; }
				if (Str::eq(entity, I"&scsim;")) { if (A) *A = 8831; return TRUE; }
				if (Str::eq(entity, I"&scy;")) { if (A) *A = 1089; return TRUE; }
				if (Str::eq(entity, I"&sdot;")) { if (A) *A = 8901; return TRUE; }
				if (Str::eq(entity, I"&sdotb;")) { if (A) *A = 8865; return TRUE; }
				if (Str::eq(entity, I"&sdote;")) { if (A) *A = 10854; return TRUE; }
				if (Str::eq(entity, I"&seArr;")) { if (A) *A = 8664; return TRUE; }
				if (Str::eq(entity, I"&searhk;")) { if (A) *A = 10533; return TRUE; }
				if (Str::eq(entity, I"&searr;")) { if (A) *A = 8600; return TRUE; }
				if (Str::eq(entity, I"&searrow;")) { if (A) *A = 8600; return TRUE; }
				if (Str::eq(entity, I"&sect")) { if (A) *A = 167; return TRUE; }
				if (Str::eq(entity, I"&sect;")) { if (A) *A = 167; return TRUE; }
				if (Str::eq(entity, I"&semi;")) { if (A) *A = 59; return TRUE; }
				if (Str::eq(entity, I"&seswar;")) { if (A) *A = 10537; return TRUE; }
				if (Str::eq(entity, I"&setminus;")) { if (A) *A = 8726; return TRUE; }
				if (Str::eq(entity, I"&setmn;")) { if (A) *A = 8726; return TRUE; }
				if (Str::eq(entity, I"&sext;")) { if (A) *A = 10038; return TRUE; }
				if (Str::eq(entity, I"&sfr;")) { if (A) *A = 120112; return TRUE; }
				if (Str::eq(entity, I"&sfrown;")) { if (A) *A = 8994; return TRUE; }
				if (Str::eq(entity, I"&sharp;")) { if (A) *A = 9839; return TRUE; }
				if (Str::eq(entity, I"&shchcy;")) { if (A) *A = 1097; return TRUE; }
				if (Str::eq(entity, I"&shcy;")) { if (A) *A = 1096; return TRUE; }
				if (Str::eq(entity, I"&shortmid;")) { if (A) *A = 8739; return TRUE; }
				if (Str::eq(entity, I"&shortparallel;")) { if (A) *A = 8741; return TRUE; }
				if (Str::eq(entity, I"&shy")) { if (A) *A = 173; return TRUE; }
				if (Str::eq(entity, I"&shy;")) { if (A) *A = 173; return TRUE; }
				if (Str::eq(entity, I"&sigma;")) { if (A) *A = 963; return TRUE; }
				if (Str::eq(entity, I"&sigmaf;")) { if (A) *A = 962; return TRUE; }
				if (Str::eq(entity, I"&sigmav;")) { if (A) *A = 962; return TRUE; }
				if (Str::eq(entity, I"&sim;")) { if (A) *A = 8764; return TRUE; }
				if (Str::eq(entity, I"&simdot;")) { if (A) *A = 10858; return TRUE; }
				if (Str::eq(entity, I"&sime;")) { if (A) *A = 8771; return TRUE; }
				if (Str::eq(entity, I"&simeq;")) { if (A) *A = 8771; return TRUE; }
				if (Str::eq(entity, I"&simg;")) { if (A) *A = 10910; return TRUE; }
				if (Str::eq(entity, I"&simgE;")) { if (A) *A = 10912; return TRUE; }
				if (Str::eq(entity, I"&siml;")) { if (A) *A = 10909; return TRUE; }
				if (Str::eq(entity, I"&simlE;")) { if (A) *A = 10911; return TRUE; }
				if (Str::eq(entity, I"&simne;")) { if (A) *A = 8774; return TRUE; }
				if (Str::eq(entity, I"&simplus;")) { if (A) *A = 10788; return TRUE; }
				if (Str::eq(entity, I"&simrarr;")) { if (A) *A = 10610; return TRUE; }
				if (Str::eq(entity, I"&slarr;")) { if (A) *A = 8592; return TRUE; }
				if (Str::eq(entity, I"&smallsetminus;")) { if (A) *A = 8726; return TRUE; }
				if (Str::eq(entity, I"&smashp;")) { if (A) *A = 10803; return TRUE; }
				if (Str::eq(entity, I"&smeparsl;")) { if (A) *A = 10724; return TRUE; }
				if (Str::eq(entity, I"&smid;")) { if (A) *A = 8739; return TRUE; }
				if (Str::eq(entity, I"&smile;")) { if (A) *A = 8995; return TRUE; }
				if (Str::eq(entity, I"&smt;")) { if (A) *A = 10922; return TRUE; }
				if (Str::eq(entity, I"&smte;")) { if (A) *A = 10924; return TRUE; }
				if (Str::eq(entity, I"&smtes;")) { if (A) *A = 10924; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&softcy;")) { if (A) *A = 1100; return TRUE; }
				if (Str::eq(entity, I"&sol;")) { if (A) *A = 47; return TRUE; }
				if (Str::eq(entity, I"&solb;")) { if (A) *A = 10692; return TRUE; }
				if (Str::eq(entity, I"&solbar;")) { if (A) *A = 9023; return TRUE; }
				if (Str::eq(entity, I"&sopf;")) { if (A) *A = 120164; return TRUE; }
				if (Str::eq(entity, I"&spades;")) { if (A) *A = 9824; return TRUE; }
				if (Str::eq(entity, I"&spadesuit;")) { if (A) *A = 9824; return TRUE; }
				if (Str::eq(entity, I"&spar;")) { if (A) *A = 8741; return TRUE; }
				if (Str::eq(entity, I"&sqcap;")) { if (A) *A = 8851; return TRUE; }
				if (Str::eq(entity, I"&sqcaps;")) { if (A) *A = 8851; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&sqcup;")) { if (A) *A = 8852; return TRUE; }
				if (Str::eq(entity, I"&sqcups;")) { if (A) *A = 8852; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&sqsub;")) { if (A) *A = 8847; return TRUE; }
				if (Str::eq(entity, I"&sqsube;")) { if (A) *A = 8849; return TRUE; }
				if (Str::eq(entity, I"&sqsubset;")) { if (A) *A = 8847; return TRUE; }
				if (Str::eq(entity, I"&sqsubseteq;")) { if (A) *A = 8849; return TRUE; }
				if (Str::eq(entity, I"&sqsup;")) { if (A) *A = 8848; return TRUE; }
				if (Str::eq(entity, I"&sqsupe;")) { if (A) *A = 8850; return TRUE; }
				if (Str::eq(entity, I"&sqsupset;")) { if (A) *A = 8848; return TRUE; }
				if (Str::eq(entity, I"&sqsupseteq;")) { if (A) *A = 8850; return TRUE; }
				if (Str::eq(entity, I"&squ;")) { if (A) *A = 9633; return TRUE; }
				if (Str::eq(entity, I"&square;")) { if (A) *A = 9633; return TRUE; }
				if (Str::eq(entity, I"&squarf;")) { if (A) *A = 9642; return TRUE; }
				if (Str::eq(entity, I"&squf;")) { if (A) *A = 9642; return TRUE; }
				if (Str::eq(entity, I"&srarr;")) { if (A) *A = 8594; return TRUE; }
				if (Str::eq(entity, I"&sscr;")) { if (A) *A = 120008; return TRUE; }
				if (Str::eq(entity, I"&ssetmn;")) { if (A) *A = 8726; return TRUE; }
				if (Str::eq(entity, I"&ssmile;")) { if (A) *A = 8995; return TRUE; }
				if (Str::eq(entity, I"&sstarf;")) { if (A) *A = 8902; return TRUE; }
				if (Str::eq(entity, I"&star;")) { if (A) *A = 9734; return TRUE; }
				if (Str::eq(entity, I"&starf;")) { if (A) *A = 9733; return TRUE; }
				if (Str::eq(entity, I"&straightepsilon;")) { if (A) *A = 1013; return TRUE; }
				if (Str::eq(entity, I"&straightphi;")) { if (A) *A = 981; return TRUE; }
				if (Str::eq(entity, I"&strns;")) { if (A) *A = 175; return TRUE; }
				if (Str::eq(entity, I"&sub;")) { if (A) *A = 8834; return TRUE; }
				if (Str::eq(entity, I"&subE;")) { if (A) *A = 10949; return TRUE; }
				if (Str::eq(entity, I"&subdot;")) { if (A) *A = 10941; return TRUE; }
				if (Str::eq(entity, I"&sube;")) { if (A) *A = 8838; return TRUE; }
				if (Str::eq(entity, I"&subedot;")) { if (A) *A = 10947; return TRUE; }
				if (Str::eq(entity, I"&submult;")) { if (A) *A = 10945; return TRUE; }
				if (Str::eq(entity, I"&subnE;")) { if (A) *A = 10955; return TRUE; }
				if (Str::eq(entity, I"&subne;")) { if (A) *A = 8842; return TRUE; }
				if (Str::eq(entity, I"&subplus;")) { if (A) *A = 10943; return TRUE; }
				if (Str::eq(entity, I"&subrarr;")) { if (A) *A = 10617; return TRUE; }
				if (Str::eq(entity, I"&subset;")) { if (A) *A = 8834; return TRUE; }
				if (Str::eq(entity, I"&subseteq;")) { if (A) *A = 8838; return TRUE; }
				if (Str::eq(entity, I"&subseteqq;")) { if (A) *A = 10949; return TRUE; }
				if (Str::eq(entity, I"&subsetneq;")) { if (A) *A = 8842; return TRUE; }
				if (Str::eq(entity, I"&subsetneqq;")) { if (A) *A = 10955; return TRUE; }
				if (Str::eq(entity, I"&subsim;")) { if (A) *A = 10951; return TRUE; }
				if (Str::eq(entity, I"&subsub;")) { if (A) *A = 10965; return TRUE; }
				if (Str::eq(entity, I"&subsup;")) { if (A) *A = 10963; return TRUE; }
				if (Str::eq(entity, I"&succ;")) { if (A) *A = 8827; return TRUE; }
				if (Str::eq(entity, I"&succapprox;")) { if (A) *A = 10936; return TRUE; }
				if (Str::eq(entity, I"&succcurlyeq;")) { if (A) *A = 8829; return TRUE; }
				if (Str::eq(entity, I"&succeq;")) { if (A) *A = 10928; return TRUE; }
				if (Str::eq(entity, I"&succnapprox;")) { if (A) *A = 10938; return TRUE; }
				if (Str::eq(entity, I"&succneqq;")) { if (A) *A = 10934; return TRUE; }
				if (Str::eq(entity, I"&succnsim;")) { if (A) *A = 8937; return TRUE; }
				if (Str::eq(entity, I"&succsim;")) { if (A) *A = 8831; return TRUE; }
				if (Str::eq(entity, I"&sum;")) { if (A) *A = 8721; return TRUE; }
				if (Str::eq(entity, I"&sung;")) { if (A) *A = 9834; return TRUE; }
				if (Str::eq(entity, I"&sup1")) { if (A) *A = 185; return TRUE; }
				if (Str::eq(entity, I"&sup1;")) { if (A) *A = 185; return TRUE; }
				if (Str::eq(entity, I"&sup2")) { if (A) *A = 178; return TRUE; }
				if (Str::eq(entity, I"&sup2;")) { if (A) *A = 178; return TRUE; }
				if (Str::eq(entity, I"&sup3")) { if (A) *A = 179; return TRUE; }
				if (Str::eq(entity, I"&sup3;")) { if (A) *A = 179; return TRUE; }
				if (Str::eq(entity, I"&sup;")) { if (A) *A = 8835; return TRUE; }
				if (Str::eq(entity, I"&supE;")) { if (A) *A = 10950; return TRUE; }
				if (Str::eq(entity, I"&supdot;")) { if (A) *A = 10942; return TRUE; }
				if (Str::eq(entity, I"&supdsub;")) { if (A) *A = 10968; return TRUE; }
				if (Str::eq(entity, I"&supe;")) { if (A) *A = 8839; return TRUE; }
				if (Str::eq(entity, I"&supedot;")) { if (A) *A = 10948; return TRUE; }
				if (Str::eq(entity, I"&suphsol;")) { if (A) *A = 10185; return TRUE; }
				if (Str::eq(entity, I"&suphsub;")) { if (A) *A = 10967; return TRUE; }
				if (Str::eq(entity, I"&suplarr;")) { if (A) *A = 10619; return TRUE; }
				if (Str::eq(entity, I"&supmult;")) { if (A) *A = 10946; return TRUE; }
				if (Str::eq(entity, I"&supnE;")) { if (A) *A = 10956; return TRUE; }
				if (Str::eq(entity, I"&supne;")) { if (A) *A = 8843; return TRUE; }
				if (Str::eq(entity, I"&supplus;")) { if (A) *A = 10944; return TRUE; }
				if (Str::eq(entity, I"&supset;")) { if (A) *A = 8835; return TRUE; }
				if (Str::eq(entity, I"&supseteq;")) { if (A) *A = 8839; return TRUE; }
				if (Str::eq(entity, I"&supseteqq;")) { if (A) *A = 10950; return TRUE; }
				if (Str::eq(entity, I"&supsetneq;")) { if (A) *A = 8843; return TRUE; }
				if (Str::eq(entity, I"&supsetneqq;")) { if (A) *A = 10956; return TRUE; }
				if (Str::eq(entity, I"&supsim;")) { if (A) *A = 10952; return TRUE; }
				if (Str::eq(entity, I"&supsub;")) { if (A) *A = 10964; return TRUE; }
				if (Str::eq(entity, I"&supsup;")) { if (A) *A = 10966; return TRUE; }
				if (Str::eq(entity, I"&swArr;")) { if (A) *A = 8665; return TRUE; }
				if (Str::eq(entity, I"&swarhk;")) { if (A) *A = 10534; return TRUE; }
				if (Str::eq(entity, I"&swarr;")) { if (A) *A = 8601; return TRUE; }
				if (Str::eq(entity, I"&swarrow;")) { if (A) *A = 8601; return TRUE; }
				if (Str::eq(entity, I"&swnwar;")) { if (A) *A = 10538; return TRUE; }
				if (Str::eq(entity, I"&szlig")) { if (A) *A = 223; return TRUE; }
				if (Str::eq(entity, I"&szlig;")) { if (A) *A = 223; return TRUE; }
				break;
			case 't':
				if (Str::eq(entity, I"&target;")) { if (A) *A = 8982; return TRUE; }
				if (Str::eq(entity, I"&tau;")) { if (A) *A = 964; return TRUE; }
				if (Str::eq(entity, I"&tbrk;")) { if (A) *A = 9140; return TRUE; }
				if (Str::eq(entity, I"&tcaron;")) { if (A) *A = 357; return TRUE; }
				if (Str::eq(entity, I"&tcedil;")) { if (A) *A = 355; return TRUE; }
				if (Str::eq(entity, I"&tcy;")) { if (A) *A = 1090; return TRUE; }
				if (Str::eq(entity, I"&tdot;")) { if (A) *A = 8411; return TRUE; }
				if (Str::eq(entity, I"&telrec;")) { if (A) *A = 8981; return TRUE; }
				if (Str::eq(entity, I"&tfr;")) { if (A) *A = 120113; return TRUE; }
				if (Str::eq(entity, I"&there4;")) { if (A) *A = 8756; return TRUE; }
				if (Str::eq(entity, I"&therefore;")) { if (A) *A = 8756; return TRUE; }
				if (Str::eq(entity, I"&theta;")) { if (A) *A = 952; return TRUE; }
				if (Str::eq(entity, I"&thetasym;")) { if (A) *A = 977; return TRUE; }
				if (Str::eq(entity, I"&thetav;")) { if (A) *A = 977; return TRUE; }
				if (Str::eq(entity, I"&thickapprox;")) { if (A) *A = 8776; return TRUE; }
				if (Str::eq(entity, I"&thicksim;")) { if (A) *A = 8764; return TRUE; }
				if (Str::eq(entity, I"&thinsp;")) { if (A) *A = 8201; return TRUE; }
				if (Str::eq(entity, I"&thkap;")) { if (A) *A = 8776; return TRUE; }
				if (Str::eq(entity, I"&thksim;")) { if (A) *A = 8764; return TRUE; }
				if (Str::eq(entity, I"&thorn")) { if (A) *A = 254; return TRUE; }
				if (Str::eq(entity, I"&thorn;")) { if (A) *A = 254; return TRUE; }
				if (Str::eq(entity, I"&tilde;")) { if (A) *A = 732; return TRUE; }
				if (Str::eq(entity, I"&times")) { if (A) *A = 215; return TRUE; }
				if (Str::eq(entity, I"&times;")) { if (A) *A = 215; return TRUE; }
				if (Str::eq(entity, I"&timesb;")) { if (A) *A = 8864; return TRUE; }
				if (Str::eq(entity, I"&timesbar;")) { if (A) *A = 10801; return TRUE; }
				if (Str::eq(entity, I"&timesd;")) { if (A) *A = 10800; return TRUE; }
				if (Str::eq(entity, I"&tint;")) { if (A) *A = 8749; return TRUE; }
				if (Str::eq(entity, I"&toea;")) { if (A) *A = 10536; return TRUE; }
				if (Str::eq(entity, I"&top;")) { if (A) *A = 8868; return TRUE; }
				if (Str::eq(entity, I"&topbot;")) { if (A) *A = 9014; return TRUE; }
				if (Str::eq(entity, I"&topcir;")) { if (A) *A = 10993; return TRUE; }
				if (Str::eq(entity, I"&topf;")) { if (A) *A = 120165; return TRUE; }
				if (Str::eq(entity, I"&topfork;")) { if (A) *A = 10970; return TRUE; }
				if (Str::eq(entity, I"&tosa;")) { if (A) *A = 10537; return TRUE; }
				if (Str::eq(entity, I"&tprime;")) { if (A) *A = 8244; return TRUE; }
				if (Str::eq(entity, I"&trade;")) { if (A) *A = 8482; return TRUE; }
				if (Str::eq(entity, I"&triangle;")) { if (A) *A = 9653; return TRUE; }
				if (Str::eq(entity, I"&triangledown;")) { if (A) *A = 9663; return TRUE; }
				if (Str::eq(entity, I"&triangleleft;")) { if (A) *A = 9667; return TRUE; }
				if (Str::eq(entity, I"&trianglelefteq;")) { if (A) *A = 8884; return TRUE; }
				if (Str::eq(entity, I"&triangleq;")) { if (A) *A = 8796; return TRUE; }
				if (Str::eq(entity, I"&triangleright;")) { if (A) *A = 9657; return TRUE; }
				if (Str::eq(entity, I"&trianglerighteq;")) { if (A) *A = 8885; return TRUE; }
				if (Str::eq(entity, I"&tridot;")) { if (A) *A = 9708; return TRUE; }
				if (Str::eq(entity, I"&trie;")) { if (A) *A = 8796; return TRUE; }
				if (Str::eq(entity, I"&triminus;")) { if (A) *A = 10810; return TRUE; }
				if (Str::eq(entity, I"&triplus;")) { if (A) *A = 10809; return TRUE; }
				if (Str::eq(entity, I"&trisb;")) { if (A) *A = 10701; return TRUE; }
				if (Str::eq(entity, I"&tritime;")) { if (A) *A = 10811; return TRUE; }
				if (Str::eq(entity, I"&trpezium;")) { if (A) *A = 9186; return TRUE; }
				if (Str::eq(entity, I"&tscr;")) { if (A) *A = 120009; return TRUE; }
				if (Str::eq(entity, I"&tscy;")) { if (A) *A = 1094; return TRUE; }
				if (Str::eq(entity, I"&tshcy;")) { if (A) *A = 1115; return TRUE; }
				if (Str::eq(entity, I"&tstrok;")) { if (A) *A = 359; return TRUE; }
				if (Str::eq(entity, I"&twixt;")) { if (A) *A = 8812; return TRUE; }
				if (Str::eq(entity, I"&twoheadleftarrow;")) { if (A) *A = 8606; return TRUE; }
				if (Str::eq(entity, I"&twoheadrightarrow;")) { if (A) *A = 8608; return TRUE; }
				break;
			case 'u':
				if (Str::eq(entity, I"&uArr;")) { if (A) *A = 8657; return TRUE; }
				if (Str::eq(entity, I"&uHar;")) { if (A) *A = 10595; return TRUE; }
				if (Str::eq(entity, I"&uacute")) { if (A) *A = 250; return TRUE; }
				if (Str::eq(entity, I"&uacute;")) { if (A) *A = 250; return TRUE; }
				if (Str::eq(entity, I"&uarr;")) { if (A) *A = 8593; return TRUE; }
				if (Str::eq(entity, I"&ubrcy;")) { if (A) *A = 1118; return TRUE; }
				if (Str::eq(entity, I"&ubreve;")) { if (A) *A = 365; return TRUE; }
				if (Str::eq(entity, I"&ucirc")) { if (A) *A = 251; return TRUE; }
				if (Str::eq(entity, I"&ucirc;")) { if (A) *A = 251; return TRUE; }
				if (Str::eq(entity, I"&ucy;")) { if (A) *A = 1091; return TRUE; }
				if (Str::eq(entity, I"&udarr;")) { if (A) *A = 8645; return TRUE; }
				if (Str::eq(entity, I"&udblac;")) { if (A) *A = 369; return TRUE; }
				if (Str::eq(entity, I"&udhar;")) { if (A) *A = 10606; return TRUE; }
				if (Str::eq(entity, I"&ufisht;")) { if (A) *A = 10622; return TRUE; }
				if (Str::eq(entity, I"&ufr;")) { if (A) *A = 120114; return TRUE; }
				if (Str::eq(entity, I"&ugrave")) { if (A) *A = 249; return TRUE; }
				if (Str::eq(entity, I"&ugrave;")) { if (A) *A = 249; return TRUE; }
				if (Str::eq(entity, I"&uharl;")) { if (A) *A = 8639; return TRUE; }
				if (Str::eq(entity, I"&uharr;")) { if (A) *A = 8638; return TRUE; }
				if (Str::eq(entity, I"&uhblk;")) { if (A) *A = 9600; return TRUE; }
				if (Str::eq(entity, I"&ulcorn;")) { if (A) *A = 8988; return TRUE; }
				if (Str::eq(entity, I"&ulcorner;")) { if (A) *A = 8988; return TRUE; }
				if (Str::eq(entity, I"&ulcrop;")) { if (A) *A = 8975; return TRUE; }
				if (Str::eq(entity, I"&ultri;")) { if (A) *A = 9720; return TRUE; }
				if (Str::eq(entity, I"&umacr;")) { if (A) *A = 363; return TRUE; }
				if (Str::eq(entity, I"&uml")) { if (A) *A = 168; return TRUE; }
				if (Str::eq(entity, I"&uml;")) { if (A) *A = 168; return TRUE; }
				if (Str::eq(entity, I"&uogon;")) { if (A) *A = 371; return TRUE; }
				if (Str::eq(entity, I"&uopf;")) { if (A) *A = 120166; return TRUE; }
				if (Str::eq(entity, I"&uparrow;")) { if (A) *A = 8593; return TRUE; }
				if (Str::eq(entity, I"&updownarrow;")) { if (A) *A = 8597; return TRUE; }
				if (Str::eq(entity, I"&upharpoonleft;")) { if (A) *A = 8639; return TRUE; }
				if (Str::eq(entity, I"&upharpoonright;")) { if (A) *A = 8638; return TRUE; }
				if (Str::eq(entity, I"&uplus;")) { if (A) *A = 8846; return TRUE; }
				if (Str::eq(entity, I"&upsi;")) { if (A) *A = 965; return TRUE; }
				if (Str::eq(entity, I"&upsih;")) { if (A) *A = 978; return TRUE; }
				if (Str::eq(entity, I"&upsilon;")) { if (A) *A = 965; return TRUE; }
				if (Str::eq(entity, I"&upuparrows;")) { if (A) *A = 8648; return TRUE; }
				if (Str::eq(entity, I"&urcorn;")) { if (A) *A = 8989; return TRUE; }
				if (Str::eq(entity, I"&urcorner;")) { if (A) *A = 8989; return TRUE; }
				if (Str::eq(entity, I"&urcrop;")) { if (A) *A = 8974; return TRUE; }
				if (Str::eq(entity, I"&uring;")) { if (A) *A = 367; return TRUE; }
				if (Str::eq(entity, I"&urtri;")) { if (A) *A = 9721; return TRUE; }
				if (Str::eq(entity, I"&uscr;")) { if (A) *A = 120010; return TRUE; }
				if (Str::eq(entity, I"&utdot;")) { if (A) *A = 8944; return TRUE; }
				if (Str::eq(entity, I"&utilde;")) { if (A) *A = 361; return TRUE; }
				if (Str::eq(entity, I"&utri;")) { if (A) *A = 9653; return TRUE; }
				if (Str::eq(entity, I"&utrif;")) { if (A) *A = 9652; return TRUE; }
				if (Str::eq(entity, I"&uuarr;")) { if (A) *A = 8648; return TRUE; }
				if (Str::eq(entity, I"&uuml")) { if (A) *A = 252; return TRUE; }
				if (Str::eq(entity, I"&uuml;")) { if (A) *A = 252; return TRUE; }
				if (Str::eq(entity, I"&uwangle;")) { if (A) *A = 10663; return TRUE; }
				break;
			case 'v':
				if (Str::eq(entity, I"&vArr;")) { if (A) *A = 8661; return TRUE; }
				if (Str::eq(entity, I"&vBar;")) { if (A) *A = 10984; return TRUE; }
				if (Str::eq(entity, I"&vBarv;")) { if (A) *A = 10985; return TRUE; }
				if (Str::eq(entity, I"&vDash;")) { if (A) *A = 8872; return TRUE; }
				if (Str::eq(entity, I"&vangrt;")) { if (A) *A = 10652; return TRUE; }
				if (Str::eq(entity, I"&varepsilon;")) { if (A) *A = 1013; return TRUE; }
				if (Str::eq(entity, I"&varkappa;")) { if (A) *A = 1008; return TRUE; }
				if (Str::eq(entity, I"&varnothing;")) { if (A) *A = 8709; return TRUE; }
				if (Str::eq(entity, I"&varphi;")) { if (A) *A = 981; return TRUE; }
				if (Str::eq(entity, I"&varpi;")) { if (A) *A = 982; return TRUE; }
				if (Str::eq(entity, I"&varpropto;")) { if (A) *A = 8733; return TRUE; }
				if (Str::eq(entity, I"&varr;")) { if (A) *A = 8597; return TRUE; }
				if (Str::eq(entity, I"&varrho;")) { if (A) *A = 1009; return TRUE; }
				if (Str::eq(entity, I"&varsigma;")) { if (A) *A = 962; return TRUE; }
				if (Str::eq(entity, I"&varsubsetneq;")) { if (A) *A = 8842; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&varsubsetneqq;")) { if (A) *A = 10955; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&varsupsetneq;")) { if (A) *A = 8843; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&varsupsetneqq;")) { if (A) *A = 10956; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&vartheta;")) { if (A) *A = 977; return TRUE; }
				if (Str::eq(entity, I"&vartriangleleft;")) { if (A) *A = 8882; return TRUE; }
				if (Str::eq(entity, I"&vartriangleright;")) { if (A) *A = 8883; return TRUE; }
				if (Str::eq(entity, I"&vcy;")) { if (A) *A = 1074; return TRUE; }
				if (Str::eq(entity, I"&vdash;")) { if (A) *A = 8866; return TRUE; }
				if (Str::eq(entity, I"&vee;")) { if (A) *A = 8744; return TRUE; }
				if (Str::eq(entity, I"&veebar;")) { if (A) *A = 8891; return TRUE; }
				if (Str::eq(entity, I"&veeeq;")) { if (A) *A = 8794; return TRUE; }
				if (Str::eq(entity, I"&vellip;")) { if (A) *A = 8942; return TRUE; }
				if (Str::eq(entity, I"&verbar;")) { if (A) *A = 124; return TRUE; }
				if (Str::eq(entity, I"&vert;")) { if (A) *A = 124; return TRUE; }
				if (Str::eq(entity, I"&vfr;")) { if (A) *A = 120115; return TRUE; }
				if (Str::eq(entity, I"&vltri;")) { if (A) *A = 8882; return TRUE; }
				if (Str::eq(entity, I"&vnsub;")) { if (A) *A = 8834; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&vnsup;")) { if (A) *A = 8835; if (B) *B = 8402; return TRUE; }
				if (Str::eq(entity, I"&vopf;")) { if (A) *A = 120167; return TRUE; }
				if (Str::eq(entity, I"&vprop;")) { if (A) *A = 8733; return TRUE; }
				if (Str::eq(entity, I"&vrtri;")) { if (A) *A = 8883; return TRUE; }
				if (Str::eq(entity, I"&vscr;")) { if (A) *A = 120011; return TRUE; }
				if (Str::eq(entity, I"&vsubnE;")) { if (A) *A = 10955; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&vsubne;")) { if (A) *A = 8842; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&vsupnE;")) { if (A) *A = 10956; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&vsupne;")) { if (A) *A = 8843; if (B) *B = 65024; return TRUE; }
				if (Str::eq(entity, I"&vzigzag;")) { if (A) *A = 10650; return TRUE; }
				break;
			case 'w':
				if (Str::eq(entity, I"&wcirc;")) { if (A) *A = 373; return TRUE; }
				if (Str::eq(entity, I"&wedbar;")) { if (A) *A = 10847; return TRUE; }
				if (Str::eq(entity, I"&wedge;")) { if (A) *A = 8743; return TRUE; }
				if (Str::eq(entity, I"&wedgeq;")) { if (A) *A = 8793; return TRUE; }
				if (Str::eq(entity, I"&weierp;")) { if (A) *A = 8472; return TRUE; }
				if (Str::eq(entity, I"&wfr;")) { if (A) *A = 120116; return TRUE; }
				if (Str::eq(entity, I"&wopf;")) { if (A) *A = 120168; return TRUE; }
				if (Str::eq(entity, I"&wp;")) { if (A) *A = 8472; return TRUE; }
				if (Str::eq(entity, I"&wr;")) { if (A) *A = 8768; return TRUE; }
				if (Str::eq(entity, I"&wreath;")) { if (A) *A = 8768; return TRUE; }
				if (Str::eq(entity, I"&wscr;")) { if (A) *A = 120012; return TRUE; }
				break;
			case 'x':
				if (Str::eq(entity, I"&xcap;")) { if (A) *A = 8898; return TRUE; }
				if (Str::eq(entity, I"&xcirc;")) { if (A) *A = 9711; return TRUE; }
				if (Str::eq(entity, I"&xcup;")) { if (A) *A = 8899; return TRUE; }
				if (Str::eq(entity, I"&xdtri;")) { if (A) *A = 9661; return TRUE; }
				if (Str::eq(entity, I"&xfr;")) { if (A) *A = 120117; return TRUE; }
				if (Str::eq(entity, I"&xhArr;")) { if (A) *A = 10234; return TRUE; }
				if (Str::eq(entity, I"&xharr;")) { if (A) *A = 10231; return TRUE; }
				if (Str::eq(entity, I"&xi;")) { if (A) *A = 958; return TRUE; }
				if (Str::eq(entity, I"&xlArr;")) { if (A) *A = 10232; return TRUE; }
				if (Str::eq(entity, I"&xlarr;")) { if (A) *A = 10229; return TRUE; }
				if (Str::eq(entity, I"&xmap;")) { if (A) *A = 10236; return TRUE; }
				if (Str::eq(entity, I"&xnis;")) { if (A) *A = 8955; return TRUE; }
				if (Str::eq(entity, I"&xodot;")) { if (A) *A = 10752; return TRUE; }
				if (Str::eq(entity, I"&xopf;")) { if (A) *A = 120169; return TRUE; }
				if (Str::eq(entity, I"&xoplus;")) { if (A) *A = 10753; return TRUE; }
				if (Str::eq(entity, I"&xotime;")) { if (A) *A = 10754; return TRUE; }
				if (Str::eq(entity, I"&xrArr;")) { if (A) *A = 10233; return TRUE; }
				if (Str::eq(entity, I"&xrarr;")) { if (A) *A = 10230; return TRUE; }
				if (Str::eq(entity, I"&xscr;")) { if (A) *A = 120013; return TRUE; }
				if (Str::eq(entity, I"&xsqcup;")) { if (A) *A = 10758; return TRUE; }
				if (Str::eq(entity, I"&xuplus;")) { if (A) *A = 10756; return TRUE; }
				if (Str::eq(entity, I"&xutri;")) { if (A) *A = 9651; return TRUE; }
				if (Str::eq(entity, I"&xvee;")) { if (A) *A = 8897; return TRUE; }
				if (Str::eq(entity, I"&xwedge;")) { if (A) *A = 8896; return TRUE; }
				break;
			case 'y':
				if (Str::eq(entity, I"&yacute")) { if (A) *A = 253; return TRUE; }
				if (Str::eq(entity, I"&yacute;")) { if (A) *A = 253; return TRUE; }
				if (Str::eq(entity, I"&yacy;")) { if (A) *A = 1103; return TRUE; }
				if (Str::eq(entity, I"&ycirc;")) { if (A) *A = 375; return TRUE; }
				if (Str::eq(entity, I"&ycy;")) { if (A) *A = 1099; return TRUE; }
				if (Str::eq(entity, I"&yen")) { if (A) *A = 165; return TRUE; }
				if (Str::eq(entity, I"&yen;")) { if (A) *A = 165; return TRUE; }
				if (Str::eq(entity, I"&yfr;")) { if (A) *A = 120118; return TRUE; }
				if (Str::eq(entity, I"&yicy;")) { if (A) *A = 1111; return TRUE; }
				if (Str::eq(entity, I"&yopf;")) { if (A) *A = 120170; return TRUE; }
				if (Str::eq(entity, I"&yscr;")) { if (A) *A = 120014; return TRUE; }
				if (Str::eq(entity, I"&yucy;")) { if (A) *A = 1102; return TRUE; }
				if (Str::eq(entity, I"&yuml")) { if (A) *A = 255; return TRUE; }
				if (Str::eq(entity, I"&yuml;")) { if (A) *A = 255; return TRUE; }
				break;
			case 'z':
				if (Str::eq(entity, I"&zacute;")) { if (A) *A = 378; return TRUE; }
				if (Str::eq(entity, I"&zcaron;")) { if (A) *A = 382; return TRUE; }
				if (Str::eq(entity, I"&zcy;")) { if (A) *A = 1079; return TRUE; }
				if (Str::eq(entity, I"&zdot;")) { if (A) *A = 380; return TRUE; }
				if (Str::eq(entity, I"&zeetrf;")) { if (A) *A = 8488; return TRUE; }
				if (Str::eq(entity, I"&zeta;")) { if (A) *A = 950; return TRUE; }
				if (Str::eq(entity, I"&zfr;")) { if (A) *A = 120119; return TRUE; }
				if (Str::eq(entity, I"&zhcy;")) { if (A) *A = 1078; return TRUE; }
				if (Str::eq(entity, I"&zigrarr;")) { if (A) *A = 8669; return TRUE; }
				if (Str::eq(entity, I"&zopf;")) { if (A) *A = 120171; return TRUE; }
				if (Str::eq(entity, I"&zscr;")) { if (A) *A = 120015; return TRUE; }
				if (Str::eq(entity, I"&zwj;")) { if (A) *A = 8205; return TRUE; }
				if (Str::eq(entity, I"&zwnj;")) { if (A) *A = 8204; return TRUE; }
				break;
		}
		return FALSE;
	}
}
