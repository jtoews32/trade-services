


## 

#!/usr/bin/perl -w
#  $|++;
# use strict;
# use XML::Parser;
use LWP::UserAgent;
use HTTP::Status;
use HTTP::Request;
use warnings;
#use XML::Simple;
# use Data::Dumper;
use LWP;
use HTTP::Request::Common;
use DBI();
use Switch;
use XML::RSS;


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

my %crosses = (); 


# <rss>
#   <channel>
#	<item>
#		<title>AED/USD</title>
#		<link>http://themoneyconverter.com/USD/AED.aspx</link>
#		<guid>3fb467f2-adc0-4995-8b7a-d5b0176dcb3c</guid>
#		<pubDate>Sun, 30 Aug 2009 23:14:18 GMT</pubDate>
#		<description>1 US Dollar = 3.6725 United Arab Emirates Dirham</description>
#		<category>Middle East</category>
#	</item>



sub getUSDCounter {

 	my $rss = new XML::RSS;

	 
 	$request = HTTP::Request->new(GET => $_[0]);	
	$ua = LWP::UserAgent->new;
	$response = $ua->request($request);
	
 	$rss->parse($response->content);

	 # print the title and link of each RSS item
 	foreach my $item (@{$rss->{'items'}}) {
 		
 		my $search_val = $item->{'title'}; 		
 		# print $search_val . "\n";

    	switch ($search_val) {
			case 'AUD/USD'	{ 
				my $data = $item->{'description'};
				my @valueline = split(' ', $data);
				$crosses{'AUD'} = "$valueline[4]";

			}
			case 'CAD/USD'	{ 
				my $data = $item->{'description'};
				my @valueline= split(' ', $data);
				$crosses{'CAD'} = "$valueline[4]";

			}
			case 'EUR/USD'	{ 
				my $data = $item->{'description'};
				my @valueline = split(' ', $data);
				$crosses{'EUR'} = "$valueline[4]"; 

			}
			case 'JPY/USD'	{ 
				my $data = $item->{'description'};
				my @valueline = split(' ', $data);
				$crosses{'JPY'} = "$valueline[4]"; 

			}
			case 'GBP/USD'	{ 
				my $data = $item->{'description'};
				my @valueline = split(' ', $data);
				$crosses{'GBP'} = "$valueline[4]"; 

			}
			case 'CHF/USD'	{ 
				my $data = $item->{'description'};
				my @valueline = split(' ', $data);
				$crosses{'CHF'} = "$valueline[4]";
				 
			}
			else { 
				
			}
		}
 	}
}

# http://themoneyconverter.com/USD/rss.xml
sub getCurrencyRead() {
	&getUSDCounter("http://www.eia.doe.gov/cneaf/electricity/epm/epmxlfile5_6_b.xls");
}
