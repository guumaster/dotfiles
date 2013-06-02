#!/usr/bin/env php
<?php

require_once(__DIR__.'/../vendor/autoload.php');
require_once(__DIR__.'/../sh/vendor/autoload.php');

use Symfony\Component\Console as Console;

use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;

$app = new Console\Application('Auto register command', '0.1');

$app->register('test')
    ->setDefinition(array(
            new InputArgument('dir', InputArgument::REQUIRED, 'Directory name')
        ))
    ->setDescription('Test command')
    ->setCode(function(InputInterface $input, OutputInterface $output) {
          $dir = $input->getArgument('dir');

          $output->writeln(sprintf('Dir listing for <info>%s</info>', $dir));
    })
    ->ignoreValidationErrors();

$app->run();
