package MyApp::Controller::Login;
use Mojo::Base 'Mojolicious::Controller';

# Mocked function to check the correctness
# of a username/password combination.
sub user_exists {
  my ($username, $password) = @_;

  return ($username eq 'foo' && $password eq 'bar');
}

sub logged_in {
    #my $self = shift;
    #return 1 if $self->session('user');
    #$self->redirect_to('layouts#floss');
    #return undef;
    my $self = shift;

  # Grab the request parameters
  my $username = $self->param('username');
  my $password = $self->param('password');

  if (user_exists($username, $password)){
		return $self->render(text => 'Logged in!')
}else{
  return $self->render(text => 'Wrong username/password', status => 403);
   }
}


sub logout {
    my $self = shift;
    $self->session(expires => 1);
    $self->redirect_to('index');
}

1;
