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

/**
 * Trouver le nombre de mot possible
 */
function motsPossible($mots, $lettres) {
  $mots_trouves = 0;
  
  foreach ($lettres[0] as $l0) {
    foreach ($lettres[1] as $l1) {
      foreach ($lettres[2] as $l2) {
        foreach ($lettres[3] as $l3) {
          foreach ($lettres[4] as $l4) {
            $mot_tmp = "$l0$l1$l2$l3$l4";
            if (in_array($mot_tmp, $mots)) {
              $mots_trouves++;
            }
          }
        }
      }
    }
  }
  
  return $mots_trouves;
}

/**
 * Générateur de module mot de passe (5 pos, 6 lettres, 1 seul mot de passe)
 */
function generateurMots($mots) {
  $mot_secret = str_split($mots[array_rand($mots)]);
  $lettres    = array(
    0 => array($mot_secret[0]),
    1 => array($mot_secret[1]),
    2 => array($mot_secret[2]),
    3 => array($mot_secret[3]),
    4 => array($mot_secret[4]),
  );
  
  for ($i = 0; $i < 5; $i++) {
    while (count($lettres[$i]) < 6) {
      $lettre_trouve = false;
      while (!$lettre_trouve) {
        $lettre_hasard       = substr(str_shuffle('abcdefghijklmnopqrstuvwxyz'), 0, 1);
        $lettres_copie       = $lettres;
        $lettres_copie[$i][] = $lettre_hasard;
        $lettre_trouve       = !in_array($lettre_hasard, $lettres[$i]) && motsPossible($mots, $lettres_copie) === 1;
      }
      $lettres[$i][] = $lettre_hasard;
    }
  }
  
  return $lettres;
}

print_r(generateurMots($mots));