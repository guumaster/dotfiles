<?php

namespace Pruebas\PrimerBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;

class DefaultController extends Controller
{

    public function indexAction($name='')
    {
        if( empty($name) ) {
            throw $this->createNotFoundException('Falta el nombre');
        }
        $req = $this->getRequest();
        // envia el dump al profiler
        $this->get('ladybug')->log($req);

        $res= $this->render('PruebasPrimerBundle:Default:index.html.twig', array('name' => $name));
        $this->get('ladybug')->log($res);
        return $res;
    }

    public function aboutAction()
    {
        return $this->render('PruebasPrimerBundle:Default:about.html.twig');
    }

    public function requestAction()
    {
        $request = $this->get('request');
        $res = array();
        foreach( $request as $name => $obj ) {
            $res[$name] = $obj->all();
        }
        return new JsonResponse($res);
    }

    public function sessionAction()
    {
        $ses = $this->get('session');
        $bar = $ses->get('bar');
        $ses->set('bar', ++$bar);
        return new JsonResponse(array('bar' => $bar ) );
    }
}
