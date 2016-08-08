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

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     * @return Page
     */
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param mixed $title
     * @return Page
     */
    public function setTitle($title)
    {
        $this->title = $title;
        return $this;
    }


}