<?php

namespace Guumaster\Command;

use Symfony\Component\Console as Console;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class HelloWorldCommand extends Command
{
    public function __construct($name)
    {
        parent::__construct($name);
        $this->setDescription('Imprime "Hello World" por pantalla');
        $this->setHelp('Ayuda extendida. Imprime "Hello World" por pantalla');
        $this->addArgument('name', Console\Input\InputArgument::OPTIONAL, 'Nombre a saludar', 'World');
        $this->addOption('more', 'm', Console\Input\InputOption::VALUE_NONE, 'Mas datos');
    }

    protected function execute(InputInterface $input, OutputInterface $output )
    {
        $name = $input->getArgument('name');
        $output->writeln("Hello {$name}");

        if( $input->getOption('more') ){
            $output->writeln("\tAnd here you have more data after the salutation");
        }
    }

}
