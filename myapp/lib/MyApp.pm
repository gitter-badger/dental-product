use strict;
use warnings;

package MyApp;
use Mojo::Base 'Mojolicious';

use MyApp::Model::Database;
use MyApp::Model::Users;

sub startup {

    my $self = shift;

    $self->secrets(['Mojolicious rocks']);
    $self->helper(users => sub { state $users = MyApp::Model::Users->new });
    $self->helper(database => sub { state $database = MyApp::Model::Database->new });

    my $r = $self->routes;
    $r->any('/')->to('layouts#index')->name('mainpage');

    my $logged_in = $r->under('/')->to('login#logged_in');
    $logged_in->get('/protected')->to('login#protected');

    $r->get('/logout')->to('login#logout');
    $r->get('/login')->to('login#index');
    $r->post('/login')->name('do_login')->to('Login#logged_in');
    $r->get('/register')->to('register#register');
    $r->get('/brush')->to('layouts#toothbrush');
    $r->get('/paste')->to('layouts#toothpaste');
    $r->get('/floss')->to('layouts#floss');
    $r->get('/wash')->to('layouts#mouthwash');
    $r->get('/cart')->to('layouts#cart');

}
1;
