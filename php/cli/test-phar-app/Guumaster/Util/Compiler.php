<?php

/*
 * This file is part of the PHP CS utility.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * This source file is subject to the MIT license that is bundled
 * with this source code in the file LICENSE.
 */

namespace Guumaster\Util;

use Symfony\Component\Finder\Finder;

/**
 * The Compiler class compiles the Symfony CS Fixer utility.
 *
 * @author Fabien Potencier <fabien@symfony.com>
 */
class Compiler
{
    public function compile($pharFile = 'myapp.phar')
    {
        if (file_exists($pharFile)) {
            unlink($pharFile);
        }

        $phar = new \Phar($pharFile, 0, 'myapp.phar');
        $phar->setSignatureAlgorithm(\Phar::SHA1);

        $phar->startBuffering();

        // CLI Component files
        foreach ($this->getFiles() as $file) {
            $path = str_replace(__DIR__.'/', '', $file);
            $phar->addFromString($path, file_get_contents($file));
        }
        $this->addPhpCsFixer($phar);

        // Stubs
        $phar->setStub($this->getStub());

        $phar->stopBuffering();

        $phar->compressFiles(\Phar::GZ);

        unset($phar);

        chmod($pharFile, 0777);
    }

    /**
     * Remove the shebang from the file before add it to the PHAR file.
     *
     * @param \Phar $phar PHAR instance
     */
    protected function addPhpCsFixer(\Phar $phar)
    {
        $content = file_get_contents(__DIR__ . '/../../myapp');
        $content = preg_replace('{^#!/usr/bin/env php\s*}', '', $content);

        $phar->addFromString('myapp', $content);
    }

    protected function getStub()
    {
        return "#!/usr/bin/env php\n<?php Phar::mapPhar('myapp.phar'); require 'phar://myapp.phar/myapp'; __HALT_COMPILER();";
    }

    protected function getLicense()
    {
        return '
    /*
     * This file is part of the PHP CS utility.
     *
     * (c) Fabien Potencier <fabien@symfony.com>
     *
     * This source file is subject to the MIT license that is bundled
     * with this source code in the file LICENSE.
     */';
    }

    protected function getFiles()
    {
        $iterator = Finder::create()->files()->exclude('Tests')->name('*.php')->in(array('vendor', 'Guumaster'));

        //return array_merge(array('LICENSE'), iterator_to_array($iterator));
        return array_merge(iterator_to_array($iterator));
    }
}
