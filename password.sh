#!/usr/bin/php
<?php
$mots = array(
  'about', 'after', 'again', 'below', 'could',
  'every', 'first', 'found', 'great', 'house',
  'large', 'learn', 'never', 'other', 'place',
  'plant', 'point', 'right', 'small', 'sound',
  'spell', 'still', 'study', 'their', 'there',
  'these', 'thing', 'think', 'three', 'water',
  'where', 'which', 'world', 'would', 'write'
);

$nb_characters = strlen($mots[0]);

$solutions = array();

for($i = 0; $i < $nb_characters; $i ++) {
  for($j = $i+1; $j < $nb_characters; $j ++) {
    if ($i !== $j) {
      $combinaisons = array();
      foreach($mots as $key_mot => $mot1) {
        $chars = "{$mot1[$i]}{$mot1[$j]}";
        if (isset($combinaisons[$chars])) {
          $combinaisons[$chars] ++;
        }else {
          $combinaisons[$chars] = 1;
        }
      }
      
      arsort($combinaisons);
      
      $solutions[] = array(
        'Char1' => $i + 1,
        'Char2' => $j + 1,
        'nb_combinaisons' => count($combinaisons),
        'combinaisons' => $combinaisons,
      );
    }
  }
}

$lowest = 0;
foreach ($solutions as $key => $solution) {
  if ($solution['nb_combinaisons'] < $solutions[$lowest]['nb_combinaisons']) {
    $lowest = $key;
  }
  //$nb = str_pad($key+1, 2, " ", STR_PAD_LEFT);
  //echo "{$nb} - {$solution['Char1']} et {$solution['Char2']} : {$solution['nb_combinaisons']} combinaisons.\n";
  print_solution($solution);
}

//echo "Lowest number of combinations\n";
//print_solution($solutions[$lowest]);
//var_dump($solutions[$lowest]['combinaisons']);

function print_solution($solution) {
  echo "{$solution['Char1']} et {$solution['Char2']} : {$solution['nb_combinaisons']} combinaisons.\n";
  
  $max_combinaisons = 5;
  foreach($solution['combinaisons'] as $key => $nb_combinaison){
    if ($max_combinaisons === 0) {
      break;
    }
    echo "  {$key} {$nb_combinaison}    ";
    $max_combinaisons --;
  }
  echo "\n\n";
}
?>
