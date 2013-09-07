#!/usr/bin/perl -w
use v5.16;
require "../.header/perl.pl";

sub existRepoCK{
    my $file = shift @_;
    
    if(-r $file){
        open (my $fh, " < ", $file);
        foreach(<$fh>){
            return 1 if /\[repo-ck\]/ ;
        }
        close $fh;
    }else{
        die "keine berechtigung zum lesen von $file";
    }
    
    return 0;
}

sub existPacmanKey{
    my $pacman_key = shift @_;
    
    my $output = `pacman-key --list-sigs $pacman_key`;
    
    foreach ($output){
        return 1 if /sig\s*$pacman_key\s*.*graysky.*/;
    }
    
    return 0;
}

sub addPacmanKey{
    $pacman_key = shift @_;
    
    unless(existPacmanKey($pacman_key)){
        if( isRoot() ){
            system("pacman-key -r $pacman_key");
            system("pacman-key --lsign-key $pacman_key");
            return 1;
        }elsif(progIsInstall("sudo")){
            system("sudo pacman-key -r $pacman_key --noconfirm");
            system("sudo pacman-key --lsign-key $pacman_key --noconfirm");
            return 1;
        }
        
        return 0;
    }
    
    return 1;
}

## variables
my $i           = 1;
my $conf        = "/etc/pacman.conf";
my @pacman_keys = ("6176ED4B", "5EE46C4C");
my @kernels     = qw(
                linux-ck 
                linux-ck-atom 
                linux-ck-core2 
                linux-ck-kx 
                linux-ck-p4 
                linux-ck-pentm);


if(existRepoCK($conf)){
    say "[repo-ck] ist in $conf eingetragen";
}elsif(-w $conf){
    open(my $fh, " >> ", $conf);
    print $fh "[repo-ck]\n";
    print $fh "SigLevel = PackageRequired\n";
    print $fh "Server = http://repo-ck.com/\$arch\n";
    close $fh;
    say "[repo-ck] wurde in $conf geschrieben";
}else{
    die "no permission to write $conf";
}


foreach (@pacman_keys){
    addPacmanKey($_) or die "konnte key ( $_ ) nicht hinzufuegen.";
    say "key $_ in trustdb";
}


if( isRoot() ){
    system("pacman -Syy");
}elsif(progIsInstall("sudo")){
    system("sudo pacman -Syy");
}else{
    die "root was needed : pacman -Syy";
}


say "bitte wählen sie den passenden ck-kernel";
foreach (@kernels){
    say "$i : $_";
    $i = $i + 1;
}

do{
    print "Voreinstellung (1) : ";
}while(chomp( $i = <STDIN>) and $i =~ /{[^1-6],}/);
$i = 1 unless $i;
$i = $i - 1;

unless(progIsInstall("$kernels[$i]") and progIsInstall("$kernels[$i]-headers")){
    if( isRoot() ){
        system("pacman -S $kernels[$i] $kernels[$i]-headers");
    }elsif(progIsInstall("sudo")){
        system("sudo pacman -S $kernels[$i] $kernels[$i]-headers");
    }else{
        die "root was needed : pacman -S irgendwas";
    }
    
    say "$kernels[$i] und $kernels[$i]-headers sind installiert";
}
