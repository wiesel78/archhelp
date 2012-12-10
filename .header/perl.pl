sub progSearch{
    my $program = shift @_;
    my $_ = shift @_;
    
    foreach ($_){
        if(/\/$program\s/ or /\($program\)/){
            return 1;
        }
    }
    
    return 0;
}

sub progIsInstall{
    my $program = shift @_;
    my $_ = `pacman -Qs $program`;
    
    return progSearch($program, $_);
}

sub progExist{
    my $program = shift @_;
    my $_ = `pacman -Ss $program`;
    
    return progSearch($program, $_);
}

sub isRoot{
    chomp( my $user = `id -nu` );
    
    return 1 if $user eq "root";
    return 0 unless $user eq "root";
}

sub progInstall{
    my $program = shift @_ or die "pacman need a programname";
    
    if(progIsInstall($program)){
        return 1;
    }elsif(progExist($program)){
        if(isRoot){
            my $_ = system("pacman -S $program --noconfirm");
            return 1;
        }elsif(progIsInstall("sudo")){
            my $_ = system("sudo pacman -S $program --noconfirm");
            return 1;
        }
    }
    
    return 0;
}

sub progRemove{
    my $program = shift @_ or die "pacman need a programname";
    
    if(progIsInstall($program)){
        if(isRoot){
            my $_ = system("pacman -R $program --noconfirm");
            return 1;
        }elsif(progIsInstall("sudo")){
            my $_ = system("sudo pacman -R $program --noconfirm");
            return 1;
        }
    }
    
    return 0;
}

1;
