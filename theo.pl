##############################################################################
# ST2614 PPC Assignment Two done by Theodoric Keith Lim p1431223 class 2B/02 #
##############################################################################


#!/usr/bin/perl -w
use strict;
use warnings;
use Cwd;




################
# MAIN PROGRAM #
################
print("Indicate Encryption(e) or Decryption(d) : ");

my $option = <STDIN>; # Take in option
chomp $option;

	if($option eq"e" || $option eq"E"){

		print("\nType Message You Want To Encrypt:\n");
		my $message = <STDIN>;

		print("\nType output file: ");
		my $filename = <STDIN>; # Scan the filename
		chomp $filename;
		#ENCRYPTION
		encryption("$message", "$filename");
		

	}elsif($option eq"d" || $option eq"D") {
		print("\nType File You Want To Decrypt:\n");
		my $filename = <STDIN>;
		chomp $filename;

		#DECRYPTION
		decryption("$filename");

	}else{
		print("\nInvalid Input");
	}




##############
# Encryption #
##############
sub encryption{
	my ($message, $filename) = @_;

	open (my $file, '>', "$filename.txt"); #Opening a new file

	my @word = split( /\s+/, $message); #Assign the words into arrays

	for(my $j = 0; $j < @word; $j++){ #Outer FOR LOOP to go through each words with the usage 
   									  #of a space as the identifier that it is the next word

		my @letters = split(//, $word[$j]); #Assign the letters from the words into arrays

		my $offset = 0; # For the calculation of the words with numerics or special characters

		for(my $i = 0; $i < length($word[$j]); $i++){ #1st FOR LOOP for $offset calculation

			my $num = ord("$letters[$i]");

			if(ord("$num" >= 33) && ord("$num" <= 64)){
				$offset++;
			}
		}

		for(my $i = 0; $i < length($word[$j]); $i++){ #2nd FOR LOOP for ENCRYPTION(shifting) and PRINTING
			
			my $num = ord("$letters[$i]"); # Assigns the number of the letter into a holding scalar

			if(ord("$num" <= 90) && ord("$num" >= 65)  || ord("$num" <= 122) && ord("$num" >= 97)){	
			   # Character is from a - z || A - Z

				my $num2 = $num; # For verfication purposes
				$num += length($word[$j]) - $offset; # Calculation for new encrypted character


				if($num > 90 && $num2 <= 90 && $num2 >= 65 || 
				   $num > 122 && $num2 <= 122 && $num2 >= 97){ 
					#Check if character has reached z || Z after above additions
					$num = $num - 26; # 26 is the total number of characters in the Latin Alphabet
				}
			}
			print $file chr($num); # Prints to file
		}
		print $file (" "); # Adds spacing between words
	}
	close $file;
}




##############
# DECRYPTION #
##############
sub decryption{
	my ($filename) = @_;
	my @contain;
	my $num;
	my @word;

	open my $file, '<', "$filename" or die "\nCould not open $filename";

	while(<$file>) { # Insert contents of file into @contain array
    	chomp; 
    	push @contain, $_; 
	}


	for(my $i = 0; $i < @contain; $i++){
		@word = split( /\s+/, $contain[$i]);
	}


	for(my $j = 0; $j < @word; $j++){ 

		my @letters = split(//, $word[$j]); 

		my $offset = 0; # For the calculation of the words with numerics or special characters

		for(my $i = 0; $i < length($word[$j]); $i++){ #1st FOR LOOP for $offset calculation

			my $num = ord("$letters[$i]");
			if(ord("$num" >= 33) && ord("$num" <= 64)){
				$offset++;
			}
		}

		for(my $i = 0; $i < length($word[$j]); $i++){ #2nd FOR LOOP for DECRYPTION and PRINTING
			
			my $num = ord("$letters[$i]"); # Assigns the number of the letter into a holding scalar

			if(ord("$num" <= 90) && ord("$num" >= 65)  || ord("$num" <= 122) && ord("$num" >= 97)){	# Character is from a - z || A - Z

				my $num2 = $num; # For verfication purposes
				$num +=  $offset - length($word[$j]); # Calculation for new decrypted character


				if($num < 65 && $num2 >= 65 && $num2 <= 90||  
				   $num < 97 && $num2 >= 97 && $num2 <= 122){ 
				   # Check if character has reached a || A after above additions
					$num = $num + 26; # 26 is the total number of characters in the Latin Alphabet
				}
			}
			print chr($num); # Prints decrypted message
		}
		print (" "); # Adds spacing between words
	}
	close $file;
}