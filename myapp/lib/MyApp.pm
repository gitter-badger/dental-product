package MyApp;
use Mojo::Base 'Mojolicious';

use MyApp::Model::Database;
use MyApp::Model::Users;

sub startup {

    my $self = shift;

    $self->secrets(['Mojolicious rocks']);
    $self->helper(users => sub { state $users = MyApp::Model::Users->new });

    my $r = $self->routes;
    $r->any('/')->to('login#index')->name('index');

    my $logged_in = $r->under('/')->to('login#logged_in');
    $logged_in->get('/protected')->to('login#protected');

    $r->get('/logout')->to('login#logout');

# Lazy connection to the model.
    helper database => sub { state $database = MyApp::Model::Database->new };

### CONTROLLER ###
    get '/' => sub { shift->render(template => 'register', error=>'') } => 'register';
    get '/register' => sub { shift->render(template => 'registered', error=>'') } => 'register';
    post '/register' => sub { 
	my $c=shift;
	my $username=$c->param('username');
	my $password=$c->param('password');
	my $email=$c->param('email');
	my $shipaddress=$c->param('shipaddress');
}
}
1;
