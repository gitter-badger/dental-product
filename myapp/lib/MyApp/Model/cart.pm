use strict;
use warnings;
use utf8;
use feature ':5.10';
use Mojo::Util 'secure_compare';
use DBI;
use DBD::mysql;
use Database; 

#declaring a class called product to hold details of a product
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
	   _category => $category,
	   _unitPrice => $unitPrice,
	   _unitMeasure => $unitMeasure,
	   _brand => $brand,
	   _productName => $productName,
	   _description => $description,
	   _quantity => $quantity,
	   _stock => $stock

	};
	bless $self, 'Product';
	return $self;
}

#Accessors of class Product
sub getCategory{
    my($self) = shift;
    return $self->{_category}
}
sub getUnitPrice{
    my($self) = shift;
    return $self->{_unitPrice}
}
sub getUnitMeasure{
    my($self) = shift;
    return $self->{_unitMeasure}
}
sub getBrand{
    my($self) = shift;
    return $self->{_brand}
}
sub getDescription{
    my($self) = shift;
    return $self->{_description}
}
sub getProductName{
    my($self) = shift;
    return $self->{_productName}
}
sub getQuantity{
    my($self) = shift;
    return $self->{_quantity}
}
sub getStock{
    my($self) = shift;
    return $self->{_stock}
}

#Mutators of class Product 
sub setCategory{
    my $self = shift;
    my $category = shift;
    $self->{_category} = $category if defined($category);
    return $self->{_category}
}
sub setUnitPrice{
    my $self = shift;
    my $unitPrice = shift;
    $self->{_unitPrice} = $unitPrice if defined($unitPrice);
    return $self->{_unitPrice}
}
sub setUnitMeasure{
    my $self = shift;
    my $unitMeasure = shift;
    $self->{_unitMeasure} = $unitMeasure if defined($unitMeasure);
    return $self->{_unitMeasure}
}
sub setBrand{
    my $self = shift;
    my $brand = shift;
    $self->{_brand} = $brand if defined($brand);
    return $self->{_brand}
}
sub setDescription{
    my $self = shift;
    my $description = shift;
    $self->{_description} = $description if defined($description);
    return $self->{_description}
}
sub setProductName{
    my $self = shift;
    my $name = shift;
    $self->{_productName} = $name if defined($name);
    return $self->{_productName}
}
sub setQuantity{
    my $self = shift;
    my $quantity = shift;
    $self->{_quantity} = $quantity if defined($quantity);
    return $self->{_quantity}
}
sub setStock{
    my $self = shift;
    my $stock = shift;
    $self->{_stock} = $stock if defined($stock);
    return $self->{_stock}
}

#global array that will act as the chart
our @cart = ();

sub add_to_cart {
    #retrieve information about the product
    my $category = shift;
    my $unitprice = shift;
    my $unitmeasure = shift;
    my $brand = shift;
    my $productname = shift; 
    my $description = shift;
    my $quantity = shift;
    my $stock = shift;
    my $product = new Product();

    #connect to the data base and get the information 
    my $dbh=$self->getHandle();
    my $sth=$dbh->prepare('Select category, unitprice, unitmeasure, brand, productname, description, quantity, stock from product where category = 	$category, unitprice = $unitprice, unitmeasure = $unitmeasure, brand = 		$brand, productname = $productname, description = $description');
    die "Prepare statement failed" , $dbh->errstr unless($sth);
    $sth->execute();
    my($category, $unitprice, $unitmeasure, $brand, $productname, $description) = $dbh->fetchrow_array();

    #set information to the product object and add it to the cart
    $product->setCategory($category);
    $product->setUnitPrice($unitprice);
    $product->setUnitMeasure($unitmeasure);
    $product->setBrand($brand);
    $product->setProductName($productname);
    $product->setDescription($description);
    push(@cart, $product);
}

sub display_cart{

	foreach my $products(@cart){
		if(defined($products)){
			print $products->getProductName();
			print "\t";
			print $products->getUnitPrice();
			print "\n";
		}
	}

}

sub remove_item{
	
	my $reference = shift;
	my $length = @cart;
	for(my $i = 0; $i < $length; $i++){
		if($cart[$i]->getProductName() eq $reference){
			delete $cart[$i];
		}
	}
	
}

sub clear_cart{

	my $length = @cart;
	for(my $i = 0; $i < $length; $i++){
		delete $cart[$i];
	}

}

sub total
{
	my $total = 0;
	foreach my $products(@cart){
		$total += $products->getUnitPrice();
	}
	return $total;
}




