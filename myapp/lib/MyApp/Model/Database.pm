package MyApp::Model::Database;

use strict;
use warnings;
use utf8;
use feature ':5.10';

use DBI;
use DBD::mysql;

sub new
{ my $class=shift;
  my $dbh=DBI->connect("dbi:mysql:dfan001","dfan001_dbo",'CbQx5yuBqb',{AutoCommit => 1});
  die "database connect error:", $DBI::errstr unless($dbh);
  my $self=\$dbh;
  bless $self, $class;
  return $self; 
}

sub getHandle($)
{ my $self=shift;

  unless($$self->ping())
  { $$self=$$self->clone() or die "cannot connect to db";
  }

  return $$self;
}

#Users registers
sub register($$$$$$)
{ my $self=shift;
  my $customerid=shift;
  my $username=shift;
  my $password=shift;
  my $email=shift;
  my $shipaddress=shift;
  my $dbh=$self->getHandle();

  my $sth=$dbh->prepare('INSERT into customer(customerid, username, password, email, shipaddress) values(?,?,?,?,?)');
  die "Prepare statement failed", $dbh->errstr unless($sth);

  my $rv=$sth->execute($customerid,$username, $password, $email, $shipaddress);
  die "Execute failed", $sth->errstr unless($rv);
  die "Execute failed", $sth->errstr if($sth->err);
 
  $sth->finish;
  return undef;
}

#Shows all the products
sub showresults() {
    my $self = shift;
    my $category = shift;
    my $unitprice = shift;
    my $unitmeasure = shift;
    my $brand = shift;
    my $productname = shift; 
    my $description = shift;
    my $quantity = shift;
    my $stock = shift; 
    my $dbh=$self->getHandle();

    my $sth=$dbh->prepare('Select category, unitprice, unitmeasure, brand, productname, description, quantity, instock from product');
    die "Prepare statement failed" , $dbh->errstr unless($sth);

    my $rv=$sth->execute();
    while (my @row = $sth->fetchrow_array) {
    }
    die "Execute failed", $sth->errstr unless($rv);
    die "Execute failed", $sth->errstr if($sth->err);
}


1;
