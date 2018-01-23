<?php
if(!isset($gsFnS2l)) $gsFnS2l = 'log/s2l.log';

function s2l($_str,$_m=0)
{
  global $gsFnS2l;
//echo '$gsFnS2l='.$gsFnS2l."\n<br>";
  if($fh = fopen($gsFnS2l, 'a'))
  {
		if($_m==0)				fwrite($fh, $_str);
		else if($_m==1)		fwrite($fh, date('Y-m-d H:i:s').$_str);
		else							fwrite($fh, strftime('%H:%M:%S').' '.$_str);
    fclose($fh);
  }
	else{echo "Error open $gsFnS2l !!!";}
}
?>