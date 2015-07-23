#!/usr/bin/perl -w
#use strict;
use warnings;
use Cwd;



print Header();
print Cipher();




#***********************************************#
#Sub for the header
#***********************************************#
sub Header{
print "******************************************************************\n";
print "ST2614 PPC Assignment Two done by John Sim p1459816 class 2A/02\n";
print "******************************************************************\n\n";
}

sub Cipher{
	print "Indicate Encryption(e) or Decryption(d) :";
	chomp (my $userInput = <STDIN>);
	#print $userInput; // test user input 

	if($userInput eq 'e'){
		encrypt();

	} elsif ($userInput eq 'd') {
		print "Type the file you want to decrypt: ";
	

	} else {
		print "You have key in the invalid input.\n";
	}

}

sub encrypt{
		print "\nType message you want to encrypt:\n";
		chomp (my $msg = <STDIN>);
		my @emsg_array = split / /, $msg; #split the message by spaces
		my $emsg =''; #Encrypted message will store in here
		

		for $emsg_array(@emsg_array){ #start of loop
			#print "$emsg_array";
			my $count_msg = length($emsg_array); #This is to count the length of the $emsg_array
			#print "$count_msg";
			my $countAlphaMsg =($emsg_array =~ tr/[A-Za-z]//); #Count only alphabets in $emsg_array
			print "$countAlphaMsg";

			
			my $encrypt_word ='';
			for($i=0; $i<$count_msg; $i++){
				my $convert_Msg = substr($emsg_array, $i, 1);

				if($convert_Msg =~ m/[A-Za-z]/){ #check if letter is an aplhabet char or not
					$convert_Msg = ord($convert_Msg); #Convert all letters into decimal
					$encrypt_Msg = $convert_Msg+$countAlphaMsg;

					
				if ((($convert_Msg>=64 and $convert_Msg<=90) and $encrypt_Msg>90) or (($convert_Msg>=97 and $convert_Msg<= 122) and $encrypt_Msg>122)){ #To make an roundabout 
					$encrypt_Msg = $encrypt_Msg - 26;
				}

				$encrypt_Msg =chr($encrypt_Msg);
				$encrypt_word = $encrypt_word.$encrypt_Msg;
				}else{
					$encrypt_word = $encrypt_word.$convert_Msg;
				}

			}
			if ($emsg eq ''){
				$emsg = $emsg.$encrypt_word;

			}else {
				$emsg = $emsg. ' '.$encrypt_word;
			}
		}
			
				print "\nType output file: ";
	$output = <STDIN>;

	open(FILEHANDLE, ">$output");
	print FILEHANDLE "$emsg\n";
	close FILEHANDLE;
	exit 0;
		
	}

