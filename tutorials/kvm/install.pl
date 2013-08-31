#!/usr/bin/perl -w
use v5.16;
use FindBin;
require($FindBin::RealBin."/../.header/perl.pl");

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

## ist qemu installiert
if (progInstall("qemu")){
    say "qemu ist installiert.";
}else{
    die "qemu wurde nicht erfolgreich installiert.";
}


## schreibe fstab eintrag fuer gast-ram falls nicht vorhanden
if(existShm($fstab)){
    say "fstab passt";
}else{
    if( -w $fstab ){
        print "gewünschte größe des Gast-Arbeitsspeichers (MB): ";
        chomp(my $size = <STDIN>);
        
        fstabAddEntry(  $fstab, 
                        "none", 
                        "/dev/shm", 
                        "tmpfs", 
                        "defaults,size=". $size ."M",
                        0, 0 ) or die "irgendwas ist schief gelaufen";
        
        print ">>fstab :\n";
        print "none /dev/shm tmpfs defaults,size=". $size ."M 0 0\n";
    }else{
        die "keine schreibrechte fuer $fstab \n";
    }
}


## /dev/shm remounten um die aenderungen wirksam zu machen
system("mount -o remount /dev/shm");
