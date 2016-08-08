<?php
/**
 * Doctrine entity
 */
namespace MyApplication\Entity;

use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity(repositoryClass="MyApplication\EntityRepository\PageRepository")
 * @ORM\Table(name="pages")
 * @ORM\HasLifecycleCallbacks
 */
class Page
{

    /**
     * Entity id
     * @var int
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * Page title
     * @var string
     * @ORM\Column(type="string", nullable=false)
     */
    private $title;


}