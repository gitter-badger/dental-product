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
    $r->get('/brush')->to('layouts#toothbrush');
    $r->get('/paste')->to('layouts#toothpaste');
    $r->get('/floss')->to('layouts#floss');
    $r->get('/wash')->to('layouts#mouthwash');
    $r->get('/cart')->to('layouts#cart');
    $r->get('/search')->to('layouts#search');
}
1;
