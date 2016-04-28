use strict;

use Mojolicious::Lite;

### MODEL ###
use lib 'lib';
use MyApp::Model::Database;

# Lazy connection to the model.
helper database => sub { state $database = MyApp::Model::Database->new };

### CONTROLLER ###
get '/' => sub { shift->render(template => 'register_form', error=>'') } => 'register_form';
get '/register' => sub { shift->render(template => 'register_form', error=>'') } => 'register_form';
post '/register' => sub { 
    my $c=shift;

    my $customerid=$c->param('customerid');
    my $username=$c->param('username');
    my $password=$c->param('password');
    my $email=$c->param('email');
    my $shipaddress=$c->param('shipaddress');
    
    
    my $registration=$c->database->register($customerid,$username,$password,$email,$shipaddress);

    if($password)
    { 
      $c->stash(customerid=>$customerid);
      $c->stash(username=>$username);
      $c->stash(password=>$password);
      $c->stash(email=>$email);
      $c->stash(shipaddress=>$shipaddress);
      $c->render(template => "register_done");
    } else
    { $c->stash(error=>"Error registering login.");
      $c->render(template => "register_form");
    }
} => 'do_register';


app->start;

### VIEWS ###
__DATA__

@@ register_form.html.ep
<%= $error %>

%= form_for 'do_register' => (method => 'POST') => begin
        %= label_for username => 'Username'
        %= text_field 'username'
        <br>
        %= label_for password => 'Password'
        %= password_field 'password'
        <br>
        %= label_for email => 'Email'
        %= text_field 'email'
        <br>
        %= label_for shipaddress => 'Shipping Address'
        %= text_field 'shipaddress'
        <br>
        %= submit_button 'Register MySQL Login', class => 'btn'
% end

@@ register_done.html.ep
You successfully registered login '<%= $username %>.

The password is: <%= $password %>
