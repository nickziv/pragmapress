BEGIN {
	in_para = 0;
}

{
	if ($1 == "<p>") {
		in_para = 1;
	}
	if ($1 == "</p>") {
		in_para = 0;
	}
	if (in_para != 1 || $1 == "<p>") {
		print $0;
	}
	if ($1 != "<p>" && $1 != "</p>" && in_para == 1) {
		printf "%s ", $0;
	}
}
