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
?>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 12:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 12:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP3'];
?>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 13:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 13:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP4'];
?>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 14:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 14:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP5'];
?>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 15:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 15:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP6'];
?>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 16:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 16:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP7'];
?>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 17:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 17:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP8'];
?>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 18:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 18:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP9'];
?>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 19:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 19:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP10'];
?>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 20:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 20:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP11'];
?>

<?php
              $sqlz = "SELECT count(DISTINCT uniqueid) as 'PROP' FROM cdr WHERE disposition = 'ANSWERED' and dstchannel is NULL and calldate between STR_TO_DATE('$mydate 21:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('$mydate 21:59:59', '%Y-%m-%d %H:%i:%s')";

                $resz = mysqli_query($link, $sqlz);
                $call = mysqli_fetch_array($resz);
                $prop = $call['PROP12'];
?>
