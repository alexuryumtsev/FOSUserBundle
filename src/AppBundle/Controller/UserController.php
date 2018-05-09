<?php

namespace AppBundle\Controller;
use AppBundle\Entity\Users;
use AppBundle\Form\EditFormType;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserController extends Controller
{
    /**
     * @Route("admin/user/{id}/edit", name="user_edit")
     */
    public function editAction(Request $request, Users $users, UserPasswordEncoderInterface $passwordEncoder, EntityManagerInterface $em)
    {
        $form = $this->createForm(EditFormType::class, $users);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            /** @var Users $user */


            $user = $form->getData();

            //  var_dump($user);die;

            $em = $this->getDoctrine()->getManager();
            $password = $passwordEncoder->encodePassword($user, $user->getPlainPassword());
            $user->setPassword($password);
            $em->persist($user);
            $em->flush();

            $this->addFlash('success','Update user!');

            return $this->redirectToRoute('users_list');
        }

        return $this->render('user/edit.html.twig', [
            'editForm' => $form->createView()
        ]);
    }


//    /**
//     * @Route("admin/user", name="users_list")
//     */
//    public function showAction(){
//        $em = $this->getDoctrine()->getManager();
//        $user = $em->getRepository('AppBundle\Entity\Users')
//            ->findAll();
//        return $this->render('user/list.html.twig',[
//            'users'=>$user,
//
//        ]);
//    }


    /**
     * @Route("admin/user", name="users_list")
     */
    public function listAction(Request $request)
    {
        $em    = $this->get('doctrine.orm.entity_manager');
        $dql   = "SELECT a FROM AppBundle:Users a";
        $query = $em->createQuery($dql);

        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            5/*limit per page*/
        );

        // parameters to template
        return $this->render('user/list.html.twig',
            ['pagination' => $pagination]);
    }


    /**
     * @Route("admin/user/{id}/delete", name="users_delete")
     */
    public function deleteAction($id){

        $em = $this->getDoctrine()->getManager();
        $user = $em->getRepository('AppBundle\Entity\Users')
            ->find($id);
      // var_dump($user); die;
        $em->remove($user);
        $em->flush();
        $this->addFlash('success','Delete user!');
        return $this->redirectToRoute('users_list');
    }


}