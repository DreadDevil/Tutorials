GNU nano 2.7.4                                                                                                 Файл: operator2.php

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ru">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="content-type">
<title>Отчет по операторам контактного центра для юридических лиц</title>
</head>
<body style="color: rgb(0, 0, 0); background-color: rgb(240, 240, 240);" alink="#000" link="#000" vlink="#000">

<?php
function my_calendar($fill=array()) {
        $month_names=array("январь","февраль","март","апрель","май","июнь",
                  "июль","август","сентябрь","октябрь","ноябрь","декабрь");
          if (isset($_GET['y'])) $y=$_GET['y'];
          if (isset($_GET['m'])) $m=$_GET['m'];
            if (isset($_GET['date']) AND strstr($_GET['date'],"-")) list($y,$m)=explode("-",$_GET['date']);
            if (!isset($y) OR $y < 1970 OR $y > 2037) $y=date("Y");
              if (!isset($m) OR $m < 1 OR $m > 12) $m=date("m");

              $month_stamp=mktime(0,0,0,$m,1,$y);
                $day_count=date("t",$month_stamp);
                $weekday=date("w",$month_stamp);
                  if ($weekday==0) $weekday=7;
                  $start=-($weekday-2);
                    $last=($day_count+$weekday-1) % 7;
                    if ($last==0) $end=$day_count; else $end=$day_count+7-$last;
                      $today=date("Y-m-d");
                      $prev=date('?\m=m&\y=Y',mktime (0,0,0,$m-1,1,$y));
                        $next=date('?\m=m&\y=Y',mktime (0,0,0,$m+1,1,$y));
                        $i=0;

?>
<table border=1 cellspacing=0 cellpadding=2>
<tr>
<td colspan=7>
 <table width="100%" border=0 cellspacing=0 cellpadding=0>
  <tr>
   <td align="left"><a href="<?php echo $prev; ?>">&lt;&lt;&lt;</a></td>
   <td align="center"><?php echo $month_names[$m-1]," ",$y ?></td>
   <td align="right"><a href="<?php echo $next; ?>">&gt;&gt;&gt;</a></td>
  </tr>
 </table>
</td>
</tr>
<tr><td>Пн</td><td>Вт</td><td>Ср</td><td>Чт</td><td>Пт</td><td>Сб</td><td>Вс</td><tr>
<?php
                          for($d=$start;$d<=$end;$d++) {
                                      if (!($i++ % 7)) echo " <tr>\n";
                                          echo '  <td align="center">';
                                          if ($d < 1 OR $d > $day_count) {
                                                        echo "&nbsp";
                                                            } else {
                                                                          $now="$y-$m-".sprintf("%02d",$d);
                                                                          echo '<b><a href="'.$_SERVER['PHP_SELF'].'?date='.$now.'">'.$d.'</a></b>';
                                                                       }
                                       echo "</td>\n";
                                       if (!($i % 7))  echo " </tr>\n";
                                         }
?>
</table>
<?php } ?>
<?php my_calendar(array(date("Y-m-d"))); ?>
<table style="text-align: left;" border="1" cellpadding="2" cellspacing="2">
<tbody>
<tr>
<td>Телефон</td>
<td>Кол-во звонков</td>
</tr>
<?php
                 $zvon = 0;
                 if (isset($_GET['date']))
                         $mydate=$_GET['date'];
                 else
                         $mydate=date("Y-m-d");

                 $hostname = "localhost";
                 $username = "report";
                 $password = "report";
                 $dbName = "cdr";
                 $userstable = "cdr";
                 $link = mysqli_connect($hostname, $username, $password, $dbName);

                 echo "<p>";
                 echo "<h1>".$mydate."</h1>";
                 echo "<hr>";

                 $cc_array = array("1245", "1246", "1247", "1248", "1249", "1250", "1251", "1252", "1253", "1254", "1256", "1257", "1258", "1259", "1260", "1261", "1262", "1263", "1264", "1265", "1267", "1281", "1282", "1266", "$

$cctotalcount=0;
$cctotalcount_01=0;
$cctotalcount_02=0;
$cctotalcount_03=0;
$cctotalcount_04=0;
$cctotalcount_05=0;
$cctotalcount_06=0;
$cctotalcount_07=0;
$cctotalcount_08=0;
$cctotalcount_09=0;
$cctotalcount_10=0;
$cctotalcount_11=0;
$cctotalcount_12=0;
$cctotalcount_13=0;
$cctotalcount_14=0;
$prop=0;
$prop1=0;
$prop2=0;
$prop3=0;
$prop6=0;
$prop7=0;
$prop8=0;
$prop9=0;
$prop10=0;
$prop11=0;
$prop12=0;
foreach ($cc_array as $i => $ph)
{

?>

<tr>
<td><?php echo $ph." ";?></td>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 10:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 10:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP1'];
?>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 11:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 11:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP2'];

                <?php
                        $sqlz = "SELECT count(DISTINCT uniqueid) as 'ZVON' FROM cdr WHERE dstchannel LIKE 'PJSIP/$ph-%' and disposition = 'ANSWERED' and calldate between STR_TO_DATE('$mydate 10:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 21:59$
                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $zvon = $call['ZVON'];
                $cctotalcount = $cctotalcount + $zvon;
                ?>
                        <td><?php echo $zvon." ";?></td>
                        </tr>
                <?php

                }



                ?>



                <?php

                echo "<b>Статистика Покровка, отчет по сотрудниками</b>";
                echo "<br>";
                echo "<br>";
                echo "Принято звонков <b>10:00-11:00: </b> ".$cctotalcount_01;
                echo "<br>";
                echo "<br>";
                echo "Принято звонков <b>11:00-12:00: </b> ".$cctotalcount_02;
                echo "<br>";
                echo "<br>";
                echo "Принято звонков <b>12:00-13:00: </b> ".$cctotalcount_03;
                echo "<br>";
                echo "<br>";
                echo "Принято звонков <b>13:00-14:00: </b> ".$cctotalcount_04;
                echo "<br>";
                echo "<br>";
                echo "Принято звонков <b>14:00-15:00: </b> ".$cctotalcount_05;
                echo "<br>";
                echo "<br>";
                echo "Принято звонков <b>15:00-16:00: </b> ".$cctotalcount_06;
                echo "<br>";
                echo "<br>";
                echo "Принято звонков <b>16:00-17:00: </b> ".$cctotalcount_07;
                echo "<br>";
                echo "<br>";
                echo "<br>";
                echo "Пропущенно звонков <b>14:00-15:00: </b> ".$prop5;
                echo "<br>";
                echo "<br>";
                echo "Пропущенно звонков <b>15:00-16:00: </b> ".$prop6;
                echo "<br>";
                echo "<br>";
                echo "Пропущенно звонков <b>16:00-17:00: </b> ".$prop7;
                echo "<br>";
                echo "<br>";
                echo "Пропущенно звонков <b>17:00-18:00: </b> ".$prop8;
                echo "<br>";
                echo "<br>";
                echo "Пропущенно звонков <b>18:00-19:00: </b> ".$prop9;
                echo "<br>";
                echo "<br>";
                echo "Пропущенно звонков <b>19:00-20:00 </b> ".$prop10;
                echo "<br>";
                echo "<br>";
                echo "Пропущенно звонков <b>20:00-21:00: </b> ".$prop11;
                echo "<br>";
                echo "<br>";
                echo "Пропущенно звонков <b>21:00-22:00: </b> ".$prop12;
                echo "<br>";
                echo "<br>";
                echo "Всего пропущенно звонков операторами <b>10:00-22:00: </b> ".$prop;
                echo "<br>";
                echo "<br>";

                ?>


                </tbody>
                </table>
                </body>
                </html>




^G Помощь         ^O Записать       ^W Поиск          ^K Вырезать       ^J Выровнять      ^C ТекПозиц       ^Y ПредCтр        M-\ ПервСтрока    M-W Найти далее   ^^ Отметить       M-} Отступ        M-U Отмена        ^B Назад
^X Выход          ^R ЧитФайл        ^\ Замена         ^U Отмен. вырезку ^T Словарь        ^_ К строке       ^V СледCтр        M-/ ПослСтрока    M-] На скобку     M-^ Копировать    M-{ ОтмОтступа    M-E Повтор        ^F Вперёд
