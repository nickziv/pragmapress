{
	if (FNR == 9) {
		print $0;
	} else if (FNR > 12 && FNR < (ln - 6)) {
		print $0 >> out;
	}
}
