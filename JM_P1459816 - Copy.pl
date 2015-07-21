#!/usr/bin/perl -w
use strict;
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
		print "Type message you want to encrypt:";
		chomp (my $msg = <STDIN>);
		#print $msg;
		print "Type output file:";
		chomp(my $file =<STDIN>);
		#print $file;	
		open my $file, '>', $file ;
		print {$file} $msg . "\n";
	} elseif ($userInput eq 'd') {
		print "Type the file you want to decrypt: ";

	} else {
		print "You have key in the invalid input.";
	}

}