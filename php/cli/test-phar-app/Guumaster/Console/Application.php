<?php

/*
 * This file is part of the PHP CS utility.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * This source file is subject to the MIT license that is bundled
 * with this source code in the file LICENSE.
 */

namespace Guumaster\Console;

use Symfony\Component\Console\Application as BaseApplication;
use Guumaster\Console\Command\CompileCommand;
use Guumaster\Console\Command\ReadmeCommand;

/**
 * @author Fabien Potencier <fabien@symfony.com>
 */
class Application extends BaseApplication
{

    const VERSION = '0.1';

    private $compiled = false;

    /**
     * Constructor.
     */
    public function __construct()
    {
        error_reporting(-1);

        parent::__construct('Test app', static::VERSION);

        $this->compiled = preg_match('#^phar#', \Phar::running() );

        if( !$this->compiled ) {
            $this->add(new CompileCommand());
        }

        $this->add(new ReadmeCommand());
    }

    public function getLongVersion()
    {
        return parent::getLongVersion().' by <comment>Gus</comment>';
    }
}
