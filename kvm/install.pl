#!/usr/bin/perl -w
use v5.16;
require("../.header/perl.pl");

## funktions deklaration 
sub existShm{
    (my $file = shift @_) or die "existShm benoetigt Dateipfad";
    
    if( -r $file ){
        open (my $fh, " < ", $file);
    
        foreach (<$fh>){
            return 1 if /\s*none\s*\/dev\/shm\s*tmpfs\s*.*/; 
        }
    }
}


## variablen deklaration
my $fstab = "/etc/fstab";


## programm

## ist qemu-kvm installiert
if (progInstall("qemu-kvm")){
    say "qemu-kvm ist installiert.";
}else{
    die "qemu-kvm wurde nicht erfolgreich installiert.";
}


## schreibe fstab eintrag fuer gast-ram falls nicht vorhanden
if(existShm($fstab)){
    say "fstab passt";
}else{
    if( -w $fstab ){
        print "gewünschte größe des Gast-Arbeitsspeichers (MB): ";
        chomp(my $size = <STDIN>);
        open (my $fh, ">> ", $fstab) or die "konnte $fstab nicht beschreiben";
        print $fh "\nnone /dev/shm tmpfs default,size=". $size ."M 0 0\n";
        close $fh;
        print ">>fstab :\n";
        print "\nnone /dev/shm tmpfs default,size=". $size ."M 0 0\n";
    }else{
        die "keine schreibrechte fuer $fstab \n";
    }
}


## /dev/shm remounten um die aenderungen wirksam zu machen
`mount -o remount /dev/shm`;
