package MyApp;
use Mojo::Base 'Mojolicious';

use MyApp::Model::Database;
use MyApp::Model::Users;

sub startup {

    my $self = shift;

    $self->secrets(['Mojolicious rocks']);
    $self->helper(users => sub { state $users = MyApp::Model::Users->new });

    my $r = $self->routes;
    $r->any('/')->to('layouts#index')->name('index');

    my $logged_in = $r->under('/')->to('login#logged_in');
    $logged_in->get('/protected')->to('login#protected');

    $r->get('/logout')->to('login#logout');
    $r->get('/login')->to('login#index');
    $r->get('/register')->to('register#register');

}
1;
