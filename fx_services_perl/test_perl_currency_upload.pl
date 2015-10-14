#!/usr/bin/perl -w

use warnings;
use strict;
use XML::Simple;
use Data::Dumper;
use LWP;
use HTTP::Request::Common;
use DBI();

my $ua = LWP::UserAgent->new;
my $xml = new XML::Simple;

my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime time;

# if(($wday+1)==7) {
#	exit 1;
# }

my $user = 'root';
my $password = 'adminadmin';
my $database = 'stockwatch';
my $dsn = "DBI:mysql:database=$database;host=localhost;port=3306";
my $dbh = DBI->connect($dsn, $user, $password);

my %crosses = (); 

sub getUSDCounter {
	my $response = $ua->request(GET "$_[0]");
	my $content = $xml->XMLin($response->content);
	my $data = $content->{channel}->{item}->{description};
	my @ar0 = split('\n', $data);
	my @ar1 = split('<br',  $ar0[3]);
	my @ar2 = split('= ', $ar1[0]);
	my @ar3 = split(' ', $ar2[1]);
	my $keyv = $ar3[1] . '-' . $ar3[0];
	$crosses{$keyv} = "$ar3[0]";
}
# http://themoneyconverter.com/USD/rss.xml
sub getCurrencyRead() {
	&getUSDCounter("http://coinmill.com/rss/AUD_USD.xml");
	&getUSDCounter("http://coinmill.com/rss/CAD_USD.xml");
	&getUSDCounter("http://coinmill.com/rss/EUR_USD.xml");
	&getUSDCounter("http://coinmill.com/rss/JPY_USD.xml");
	&getUSDCounter("http://coinmill.com/rss/GBP_USD.xml");
	&getUSDCounter("http://coinmill.com/rss/CHF_USD.xml");
}

my $count = 0;
while ( (scalar keys %crosses) != 6) {
	&getCurrencyRead();
		
	if((scalar keys %crosses) != 6) {
		%crosses = (); 
	}		
	if($count == 6) {
		exit 1;
	}
	$count = $count + 1;
} 


# http://www.quoterss.com/quote.php?symbol=YHOO&frmt=0&Freq=0

# DROP TABLE IF EXISTS STOCK_PRICE;
# DROP VIEW IF EXISTS SW_TABLE;
# DROP VIEW IF EXISTS SW_TABLE_NAME;
# DROP TABLE IF EXISTS GRAPH_NAME;
# DROP TABLE IF EXISTS GRAPH_XY;
# DROP TABLE IF EXISTS CURRENCY_PRICE;
# DROP TABLE IF EXISTS NAME_MAPPING;

# CREATE TABLE CURRENCY_PRICE (
#    ID integer not null,
# 	 READ_COUNT integer not null,
#    USD_VALUE DOUBLE,
#    CROSS_VALUE DOUBLE,
#    CROSS_NAME varchar(16), 
#    CREATED timestamp,
#    PRIMARY KEY (ID)
# );

my $count_sql = $dbh->prepare("SELECT MAX(ID) AS MX FROM CURRENCY_PRICE");
$count_sql->execute();

my $dataCount = -1;
my $strCount = 'str';
while (my $ref = $count_sql->fetchrow_hashref()) { 
	$strCount = $ref->{'MX'};
}
if($strCount) {
	$dataCount = int($strCount);	
}
$count_sql->finish();

while (my ($key, $value) = each(%crosses)){	
	$dataCount = $dataCount + 1;
	
	my $readCount = ( $dataCount - ( $dataCount % 6 ) ) / 6;

	my @currency = split('-', $key);
	my $currency_sql = 
		qq{ INSERT INTO CURRENCY_PRICE (ID, READ_COUNT, USD_VALUE, CROSS_VALUE, CROSS_NAME, CREATED) VALUES($dataCount, $readCount, '1.00', '$value', '$currency[0]', NOW()) };
		
	$dbh->do( $currency_sql );
}
	
$dbh->disconnect();
