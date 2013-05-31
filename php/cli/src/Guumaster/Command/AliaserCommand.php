<?php

namespace Guumaster\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
#use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputOption;

/**
 * Command to generate shell aliases from the commands registered in the Symfony application
 * @author Pablo Godel <pgodel@gmail.com>

 */
class AliaserCommand extends Command #extends ContainerAwareCommand
{
    /**
     * @see Command
     */
    protected function configure()
    {
        parent::configure();

        $this->setName('generate:aliases')
                ->setDescription('Generates list of shell aliases for the commands included in the Symfony application')
                ->addOption('php', null, InputOption::VALUE_OPTIONAL, 'Path to php binary', 'php')
                ->addOption('command', null, InputOption::VALUE_OPTIONAL, 'Command name', 'console')
                ->addOption('absolute', null, InputOption::VALUE_OPTIONAL, 'Include absolute path to application directory')
                ->addOption('prefix', null, InputOption::VALUE_OPTIONAL, 'Prefix name to include in command names', 'console');
    }

    /**
     * @see Command
     */
    public function execute(InputInterface $input, OutputInterface $output)
    {
        $prefix = $input->getOption('prefix');
        $phpPath = $input->getOption('php');
        $absolute = $input->getOption('absolute');
        $finalName = $input->getOption('command');

        if (strlen($prefix) > 0) {
            $prefix .= '-';
        }

        $commands = $this->getApplication()->all();
        //$dir = $absolute ? $this->getContainer()->get('kernel')->getRootDir() : 'app';
        $dir = $absolute ? $absolute : getcwd();

        $result = '';

        //$ignoreCmds = array('help', 'list', 'generate:shell:aliases');
        $ignoreCmds = array('help', 'list');

        foreach ($commands as $cmd) {
            $cmdName = $cmd->getName();
            if ( in_array($cmdName, $ignoreCmds ) ) {
                continue;
            }

            $name = $prefix . str_replace(':', '-', $cmdName);
            $content = $phpPath . ' ' . $dir . '/'. $finalName .' ' . $cmdName;

            $line = sprintf('alias %s="%s"', $name, $content);
            $result .= $line . "\n";
        }

        $output->writeln($result);
    }
}
