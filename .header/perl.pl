#!/usr/bin/perl
use v5.16;

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

sub fstabCheckArgs{
    my %fstabargs;
    
    $fstabargs{"file"}   = (-T $_[0]) ? shift @_ : "/etc/fstab";
    $fstabargs{"fs"}     = shift @_ or die "zu wenig argumente (fs)";
    $fstabargs{"dir"}    = shift @_ or die "zu wenig argumente (dir)";
        unless( -e $fstabargs{"dir"} or $fstabargs{"dir"} eq "none"){
            die "kein passender parameter für dir angegeben"; 
        }
    $fstabargs{"type"}   = shift @_ or die "type fehlt";
    $fstabargs{"options"}= $_[0] ? shift @_ : "defaults";
    $fstabargs{"dump"}   = ($_[0]=~/[0-2]/) ? shift @_ : 0;
    $fstabargs{"pass"}   = ($_[0]=~/[0-2]/) ? shift @_ : 0;
    
    return \%fstabargs;
}

sub fstabParseArgs{
    my $hash = shift @_;
    my $entry = "";
    
    $entry .= "${$hash}{'fs'} ";
    $entry .= "${$hash}{'dir'} ";
    $entry .= "${$hash}{'type'} ";
    $entry .= "${$hash}{'options'} ";
    $entry .= "${$hash}{'dump'} ";
    $entry .= "${$hash}{'pass'}";
    
    return $entry;
}

sub fstabAddEntry{
    my $hash    = fstabCheckArgs(@_) or die "Argumente stimmen nicht";
    my $entry   = fstabParseArgs($hash) or die "Error beim Parser";
    
    if(-w ${$hash}{"file"}){
        open(my $fh, " >> ", ${$hash}{"file"}) or die "Dateioperationsfehler";
        
        print $fh "$entry \n";
        
        close ($fh) or die "Datei konnte nicht geschlossen werden";
        
        return 1;
    }
    
    return 0;
}

1;
