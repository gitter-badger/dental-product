use strict;
use warnings;
use utf8;
use feature ':5.10';
use Mojo::Util 'secure_compare';
use DBI;
use DBD::mysql;
use Database; 

#declaring a class called product to hold details of prduct
package Product;

sub new
{
	my $category = shift;
    	my $unitPrice = shift;
    	my $unitMeasure = shift;
    	my $brand = shift;
    	my $productName = shift; 
    	my $description = shift;
    	my $quantity = shift;
    	my $stock = shift; 

	my $self = {
	   _category => $category if defined($category) else undef,
	   _unitPrice => $unitPrice if defined($unitPrice) else undef,
	   _unitMeasure => $unitMeasure if defined($unitMeasure) else undef,
	   _brand => $brand if defined($brand) else undef,
	   _productName => $productName if defined($productName) else undef,
	   _description => $description if defined($description) else undef,
	   _quantity => $quantity if defined($quantity) else undef,
	   _stock => $stock if defined($stock) else undef

	};
	bless $self, 'Product';
	return $self;
}

#Accessors of class Product 
sub getCategory{
    my($self, $category) = @_;
    $self->{_category} = $category if defined($category);
    return $self->{_category}
}
sub getUnitPrice{
    my($self, $unitPrice) = @_;
    $self->{_unitPrice} = $unitPrice if defined($unitPrice);
    return $self->{_unitPrice}
}
sub getUnitMeasure{
    my($self, $unitMeasure) = @_;
    $self->{_unitMeasure} = $unitMeasure if defined($unitMeasure);
    return $self->{_unitMeasure}
}
sub getBrand{
    my($self, $brand) = @_;
    $self->{_brand} = $brand if defined($brand);
    return $self->{_brand}
}
sub getDescription{
    my($self, $description) = @_;
    $self->{_description} = $description if defined($description);
    return $self->{_description}
}
sub getProductName{
    my($self, $name) = @_;
    $self->{_productName} = $name if defined($name);
    return $self->{_productName}
}
sub getQuantity{
    my($self, $quantity) = @_;
    $self->{_quantity} = $quantity if defined($quantity);
    return $self->{_quantity}
}
sub getStock{
    my($self, $stock) = @_;
    $self->{_stock} = $stock if defined($stock);
    return $self->{_stock}
}

#global array that will act as the chart
our @cart = ();

sub add_to_cart {
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
    my $sth=$dbh->prepare('Select category, unitprice, unitmeasure, brand, productname, description, quantity, stock from product');
    die "Prepare statement failed" , $dbh->errstr unless($sth);
    $sth->execute();
    $sth->bind_col(1,
        
}

sub display_cart{

}

sub remove_item{


}

sub clear_cart{


}




