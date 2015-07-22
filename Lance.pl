#!/usr/bin/perl -w
use warnings;
use Cwd;

print "******************************************************************\n";
print " ST2614 PPC Assignment Two done by Fu Dai Fa p1400531 class 2A/02 \n";
print "******************************************************************\n";

do {
	print "Indicate Encryption(e) or Decryption(d) : ";
	chomp($choice = <STDIN>);

	if ($choice eq 'e'){
		encrypt();
	}elsif($choice eq 'd'){
		decrypt();
	}elsif($choice eq 'exit'){
		exit 0;
	}else{
		print "Invalid input\n"
	}
}while ($choice ne 'e' or $choice ne 'd');



sub encrypt {
	print "\nType message you want to encrypt:\n";
	chomp(my $e_input = <STDIN>);
	my @raw_array = split / /, $e_input;

	
	my $encrypted_msg = '';

	foreach $raw_array(@raw_array){
		#print "$raw_array\n";
		my $ttl_wrd_length = length($raw_array); #To check wordlength for loop

		my $aph_wrd_length = ($raw_array =~ tr/[A-Za-z]//); #To check alphabetical character length for shift. 

		#print "$aph_wrd_length";
		my $encrypted_word = '';
		for ($i=0;$i<$ttl_wrd_length;$i++){

			my $working_letter = substr($raw_array, $i, 1);

			if ($working_letter =~ m/[A-Za-z]/){ #Check if working_letter is an alphabetic character
				$working_letter = ord($working_letter);
				$encrypted_letter = $working_letter+$aph_wrd_length;

				if ((($working_letter>=64 and $working_letter<=90) and $encrypted_letter>90) or (($working_letter>=97 and $working_letter<= 122) and $encrypted_letter>122)){ #To make an roundabout 
					$encrypted_letter = $encrypted_letter - 26;
				}


				$encrypted_letter = chr($encrypted_letter);
				$encrypted_word = $encrypted_word.$encrypted_letter;
			} else { #Handle symbols
				$encrypted_word = $encrypted_word.$working_letter;
			}
		}

		if ($encrypted_msg eq ''){
			$encrypted_msg = $encrypted_msg.$encrypted_word;
		} else {
		$encrypted_msg = $encrypted_msg.' '.$encrypted_word;
		}
	}

	print "\nType output file: ";
	$out_filename = <STDIN>;

	open(FILEHANDLE, ">$out_filename");
	print FILEHANDLE "$encrypted_msg\n";
	close FILEHANDLE;
	exit 0;
}

sub decrypt {
	print "Type file you want to decrypt: ";
	chomp($d_input = <STDIN>);

	if(-e $d_input) {
		open(FILEHANDLE, "$d_input");
	} else {
		die "Unable to open file";
	}

	my @file_array = split / /, <FILEHANDLE>;
	my $decrypted_msg = '';

	foreach $file_array(@file_array){
		my $ttl_wrd_length = length($file_array); #To check wordlength for loop
		my $aph_wrd_length = ($file_array =~ tr/[A-Za-z]//); #To check alphabetical character length for shift. 

		#print "$aph_wrd_length";
		my $decrypted_word = '';
		for ($i=0;$i<$ttl_wrd_length;$i++){

			my $working_letter = substr($file_array, $i, 1);

			if ($working_letter =~ m/[A-Za-z]/){ #Check if working_letter is an alphabetic character
				$working_letter = ord($working_letter);
				$decrypted_letter = $working_letter-$aph_wrd_length;

				if ((($working_letter>=64 and $working_letter<=90) and $decrypted_letter<64) or (($working_letter>=97 and $working_letter<= 122) and $decrypted_letter<97)){ #To make an roundabout 
					$decrypted_letter = $decrypted_letter + 26;
				}


				$decrypted_letter = chr($decrypted_letter);
				$decrypted_word = $decrypted_word.$decrypted_letter;
			} else { #Handle symbols
				$decrypted_word = $decrypted_word.$working_letter;
			}
		}

		if ($decrypted_msg eq ''){
			$decrypted_msg = $decrypted_msg.$decrypted_word;
		} else {
		$decrypted_msg = $decrypted_msg.' '.$decrypted_word;
		}
	}

	print "\nDecrypted Message is: \n";
	print "$decrypted_msg";
	exit 0;
}