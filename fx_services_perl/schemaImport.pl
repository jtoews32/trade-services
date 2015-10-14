#!/usr/local/bin/perl -w

# Get rows from many Excel spreadsheets in a directory
###################################

use strict;
use Spreadsheet::ParseExcel::Simple;

my $excel_directory = 'Budget';
my $out_directory = 'xxxout';

opendir(EXCELDIR, $excel_directory) || die ("no excel directory");

my @excelfiles = readdir(EXCELDIR);
closedir(EXCELDIR);

chdir($excel_directory);
my $LPHname;    					# String to hold Local Public Health Name.
my @sheetarray; 					# Array to hold the row.
my $sheetcount; 					# Array element in the row.
my $sheetname; 						# Name of the Excel spreadsheet.
my $sheettemp;  					# Temporary string to hold row for join.
my $cellnumber;  					# Cell number in the row.
my $cellwanted;  					# Cell number in the row.
my $rowwanted;  					# Row number wanted.
my $county_namecell;  				# Cell for county name.
my $county_namerow;  				# Row for county name.

foreach my $exxfilename (@excelfiles) {
    if ($exxfilename =~ /^\.+.*/) { 
    	next; 
  	}
  	
    my $xls = Spreadsheet::ParseExcel::Simple->read($exxfilename);
    
    foreach my $sheet ($xls->sheets) {
       	$sheetname= $sheet->{sheet}->{Name}; # Sheet Name

       	if ($sheetname !~ '2007 Budget') { 
       		next; 
  		}
  		
       	$sheetcount=0;
       	$county_namecell=11;
       	$county_namerow=1;
#       $cellwanted=4;
       	$rowwanted=11;

       	while ($sheet->has_data) {
          	my @data = $sheet->next_row;
            $sheetcount++;
            
         	if ($sheetcount==$county_namerow){
            	$cellnumber=0;
            	foreach my $ttcell (@data) {
                	$cellnumber++;
                	if ($cellnumber != $county_namecell ){next;};
                 	$sheettemp=$sheetarray[$sheetcount];
#                 	$sheetarray[$sheetcount]=join("\t",$sheettemp,$ttcell);
                 	$LPHname=$ttcell;
          	}
          	
   		} # Get the name of the Local Health

#     	if (($sheetcount < ($rowwanted-1)) || ($sheetcount > ($rowwanted+7))){next;}

       	if ($sheetcount != $rowwanted) {
       		next;
       	};
       	
      	$cellnumber=0;
     	$sheetarray[$sheetcount]=join("\t",$sheettemp,$LPHname);
       
       	foreach my $ttcell (@data) {
                $cellnumber++;
#                if ($cellnumber != $cellwanted ){next;};
                 $sheettemp=$sheetarray[$sheetcount];
                 $sheetarray[$sheetcount]=join("\t",$sheettemp,$ttcell);
            }
       }
    }
    foreach my $sheetline (@sheetarray){
        print $sheetline,"\n";
    }
}
#    foreach my $sheetline (@sheetarray){
#        print $sheetline,"\n";
#    }
exit


###############################################################
# Column extract.
# Get columns from many Excel spreadsheets in a directory
###############################################################

#! /usr/local/bin/perl -w
    use strict;
    use Spreadsheet::ParseExcel::Simple;


my $excel_directory = 'TEST';
opendir(EXCELDIR, $excel_directory) || die ("no excel directory");
my @excelfiles = readdir(EXCELDIR);
closedir(EXCELDIR);

chdir($excel_directory);
       my @sheetarray; # Array to hold the row.
       my $sheetcount; # Array element in the row.
       my $sheetname; # Name of the Excel spreadsheet.
       my $sheettemp;  # Temporary string to hold row for join.
       my $cellnumber;  # cell number in the row.
       my $cellwanted;  # cell number in the row.
       my $rowwanted;  # row number wanted.
       my $county_namecell;  # cell for county name.
       my $county_namerow;  # row for county name.
foreach my $exxfilename (@excelfiles){
    if ($exxfilename =~ /^\.+.*/) { next; }
    my $xls = Spreadsheet::ParseExcel::Simple->read($exxfilename);
    foreach my $sheet ($xls->sheets) {
       $sheetname= $sheet->{sheet}->{Name};


# name the sheet to take stuff out of.
       if ($sheetname !~ '2007 Budget') { next; }
       $sheetcount=0;
$county_namecell=11;
$county_namerow=1;
       $cellwanted=2;
       $rowwanted=5;

       while ($sheet->has_data) {
            my @data = $sheet->next_row;
            $sheetcount++;
if ($sheetcount==$county_namerow){
            $cellnumber=0;
            foreach my $ttcell (@data) {
                $cellnumber++;
                if ($cellnumber != $county_namecell ){next;};
                 $sheettemp=$sheetarray[$sheetcount];
                 $sheetarray[$sheetcount]=join("\t",$sheettemp,$ttcell);
            }
}
     if (($sheetcount < ($rowwanted)) || ($sheetcount > ($rowwanted+5))){next;}
#column boundary starting from rowwanted and getting cellwanted column.
#            if ($sheetcount != $rowwanted){next;};
            $cellnumber=0;
            foreach my $ttcell (@data) {
                $cellnumber++;
                if ($cellnumber != $cellwanted ){next;};
                 $sheettemp=$sheetarray[$sheetcount];
                 $sheetarray[$sheetcount]=join("\t",$sheettemp,$ttcell);
            }
       }
    }
}
    foreach my $sheetline (@sheetarray){
        print $sheetline,"\n";
    }
exit
