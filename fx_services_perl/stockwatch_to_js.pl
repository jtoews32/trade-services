#!/usr/bin/perl

use strict;
use DBI();
use File::Copy;


# /usr/bin/perl /home/jtoews/workspace/jaxbServices/resources/MYSQL_TO_JS.PL /home/jtoews/workspace/jaxbServices/resources/

unlink($ARGV[0]."stockwatch_marshal.js"); 
open TEXT, ">".$ARGV[0]."stockwatch_marshal.js" or die $!;

my $user = 'root';
my $password = 'adminadmin';
my $database = 'stockwatch';
my $dsn = "DBI:mysql:database=$database;host=localhost;port=3306";
my $dbh = DBI->connect($dsn, $user, $password);
my $sth = $dbh->prepare("SELECT * FROM SW_TABLE");

$sth->execute();

printf TEXT "var restUrl=\"http://localhost:8081/stockwatch/resources/\";\n\n";

my %selects;

while (my $ref = $sth->fetchrow_hashref()) { 
	# printf TEXT "var lst".$ref->{'TABLE_NAME'}." = new Array(); // ".$ref->{'TABLE_NAME'}."\n";
	
my $restXMLParser = <<END;
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
END

	## print $heredoc; 	
	
	print "function call".$ref->{'TABLE_NAME'}."() {\n";
	printf TEXT "function call".$ref->{'TABLE_NAME'}."() {\n";
	printf TEXT "\tvar baseElementName = \'$ref->{'TABLE_NAME'}\';\n";
	printf TEXT $restXMLParser;
	#printf TEXT "\n";
	#printf TEXT "\n";
	printf TEXT "}\n";		
	
	$selects{"SELECT SW.COLUMN_NAME FROM SW_TABLE_NAME SW WHERE SW.TABLE_NAME = \'$ref->{'TABLE_NAME'}\'"} = $ref->{'TABLE_NAME'};
}

$sth->finish();

printf TEXT "\n";

while (my ($key, $value) = each(%selects)){
	my $sth1 = $dbh->prepare($key);
	$sth1->execute();

	my $paramList = "";
	my $paramDecl = "";

	while (my $ref1 = $sth1->fetchrow_hashref()) {
		if($paramList ne "") {
			$paramList .= ",$ref1->{'COLUMN_NAME'}";
			$paramDecl .= "\tthis.";
                        $paramDecl .= $ref1->{'COLUMN_NAME'};
                        $paramDecl .= "=";
                        $paramDecl .= $ref1->{'COLUMN_NAME'};
                       	$paramDecl .= ";\n";

		} else {
			$paramList .="$ref1->{'COLUMN_NAME'}";
			$paramDecl .="\tthis.";
			$paramDecl .="$ref1->{'COLUMN_NAME'}";
			$paramDecl .="=";
			$paramDecl .="$ref1->{'COLUMN_NAME'}";
			$paramDecl .=";\n";
		}
  	}
		
	printf TEXT "\nfunction ".$value."(".$paramList.") {\n"; 
	printf TEXT $paramDecl;
	printf TEXT "}\n";

	$sth1->finish();
}

close(TEXT);

$dbh->disconnect();


#my $filetobecopied = "/home/jtoews/workspace/jaxbServices/resources/softXML.js";
#my $newfile = "/home/jtoews/workspace/jaxbServices/resources/stockwatch_marshal.js";
#copy($filetobecopied, ">>$newfile") or die "File cannot be copied.";

my $data_file="/home/jtoews/workspace/jaxbServices/resources/softXML.js";
open(DAT, $data_file) || die("Could not open file!");
my @raw_data=<DAT>;
close(DAT);

my $sitedata="/home/jtoews/workspace/jaxbServices/resources/stockwatch_marshal.js";
open(STOCKWATCH,">>$sitedata") || die("Cannot Open File");
foreach my $rowOfData (@raw_data) {
 	printf STOCKWATCH $rowOfData;	
}
close(STOCKWATCH);  













