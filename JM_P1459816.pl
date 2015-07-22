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
		#print "Type output file:";
		#chomp(my $file =<STDIN>);
		#print $file;	
		#open my $file, '>', $file ;
		#print {$file} $msg . "\n";
		#close $file;
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

		foreach $emsg_array(@emsg_array){
			#print "$emsg_array";
			my $chck_word_length = length($emsg_array);

			my $
		}

}