#!/usr/bin/perl -w

#  $|++;
# use strict;
# use XML::Parser;
#use XML::Simple;
# use Data::Dumper;

use LWP::UserAgent;
use HTTP::Status;
use HTTP::Request;
use warnings;
use LWP;
use HTTP::Request::Common;
use DBI();
use Switch;

my $ua; #  = LWP::UserAgent->new;
# my $xml; # = new XML::Simple;
# my $ua = LWP::UserAgent->new;
# my $xml = new XML::Simple;
# my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime time;
# if(($wday+1)==7) {
#	exit 1;
# }
my $user = 'root';
my $password = 'adminadmin';
my $database = 'stockwatch';
my $dsn = "DBI:mysql:database=$database;host=localhost;port=3306";
my $dbh = DBI->connect($dsn, $user, $password);

#    open IN, "< $infile" or die "Can't open $infile : $!";
#   open OUT, "> $outfile" or die "Can't open $outfile : $!";
#    print OUT <IN>;
#    close IN;
#    close OUT;

my %month_lookup = (
	Jan => '1',
	Feb => '2',
	Mar => '3',
	Apr => '4',
	May => '5', 
	Jun => '6' ,
	Jul => '7',
	Aug => '8',
	Sep => '9',
	Oct => '10',
	Nov => '11',
	Dec => '12');
	
sub commaSepParser() {
	my $infile = $_[0];
	my $severity = $_[1];

	my @day_month_date = ();
	open FILE, "< $infile" or die "Can't open $infile : $!";
	
	#
	# RIGHT HERE : IF FILE ENDS WITH _Off.cvs then set $bankClosed = 1;
	#

	while (my $line = <FILE>) {
		# print $line;
	
		my @substrings = split(',', $line); 
				
		my $day_date = "";
		my $type_of_event = "";
		
		#print "Array Size: $#substrings \n";	
				
		if($substrings[0] ne "") {
			$day_date = $substrings[0];	
			$day_date =~ s/\"//g;  
			# print $day_date;
			@day_month_date = split(" ", $day_date);
			
		} 
		
		# print "----> $day_month_date[0] $day_month_date[1] $day_month_date[2]\n";
		
		if($substrings[4] ne "") {
			$type_of_event = $substrings[4];	
			$type_of_event=~ s/\"//g;  
		} 
		
		my $day_of_week = $day_month_date[0];  
		
		my $month_of_year = $day_month_date[1];  
		my $day = $day_month_date[2];			 
		my $currency =  $substrings[2];
		my $time = $substrings[1];
		my $severness = $severity;

		if($currency eq "" || $time eq "" || $severness eq "" ) {
	
		} else {	
			
			my $month_num = $month_lookup{$day_month_date[1]};
			
			if ($time eq 'Tentative' ) {
				# print "Equals Tentative\n";
				$time = "00:00:00";
			}
			
			my $dateTime = 	"2009-" . $month_num . "-" . $day_month_date[2] . " " . $time;

			# RIGHT HERE : pass bank closed
			# if bank closed mark as severity 0 meaning this is unrelated to event drama severity
			&importRowToDatabase($currency, $severness, $dateTime);
				
		}

	}	
	
	close(FILE);
}

sub importRowToDatabase() {
	
	# print $_[0] . " " . $_[1] . " " . $_[2] . "\n";	
	my $currency_sql = 
	 	qq{ INSERT INTO IMPACT_ANALYSIS (CROSS_NAME,SEVERITY,EVENT_TIME) VALUES('$_[0]', $_[1], '$_[2]') };
	
	$dbh->do( $currency_sql );		
	
}

&commaSepParser("input/Sep20_Sep26_High.csv", 1);
&commaSepParser("input/Sep20_Sep26_Med.csv", 2);
&commaSepParser("input/Sep20_Sep26_Low.csv", 3);


$dbh->disconnect();




