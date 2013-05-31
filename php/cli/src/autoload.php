<?php

require_once(__DIR__.'/../vendor/autoload.php');

/*
 * NOTA: El codigo de registerNamespaces no es necesario 
 * si el composer.json contiene la opcion autoload: 
 *
 *   "autoload": {
 *       "psr-0": {
 *           "Guumaster": "src/"
 *       }
 *   }
 *
 */
use Symfony\Component\ClassLoader\UniversalClassLoader;

$loader = new UniversalClassLoader();

$loader->registerNamespaces(array(
    'Guumaster' => __DIR__
));

$loader->register();

