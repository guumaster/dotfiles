<?php

namespace Pruebas\PrimerBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function nameAction($name)
    {
        return $this->render('PruebasPrimerBundle:Default:index.html.twig', array('name' => $name));
    }

    public function indexAction()
    {
        return $this->render('PruebasPrimerBundle:Default:index.html.twig', array('name' => null));
    }

    public function aboutAction()
    {
        return $this->render('PruebasPrimerBundle:Default:about.html.twig');
    }
}
