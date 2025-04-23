<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

#[ORM\Table(name: "contact")]
#[ORM\Entity]
class Contact
{
    #[ORM\Column(name: "id", type: "integer", nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "IDENTITY")]
    public $id;

    #[ORM\Column(type: "text", nullable: false)]
    public $name;

    #[ORM\Column(type: "text", nullable: false)]
    public $email;

    #[ORM\Column(type: "text", nullable: true)]
    public $description;

    /** Many contacts have One Contact list. */
	#[ORM\ManyToOne(targetEntity: ContactsList::class, inversedBy: "contactsListContact")]
	#[ORM\JoinColumn(name: "contactsList_id", referencedColumnName: "id", nullable: false)]
	public $contactsList;

    public function __construct()
    {
    }
	
	/**
     * Get id
     *
     * @return string 
     */
    public function getId()
    {
        return $this->id;
    }

	/**
     * Set name
     *
     * @param string $name
     * @return string
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }	

	/**
     * Set email
     *
     * @param string $email
     * @return string
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string 
     */
    public function getEmail()
    {
        return $this->email;
    }	

	/**
     * Set description
     *
     * @param string $description
     * @return string
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }

	/**
     * Set contactsList
     *
     * @param App\Entity\ContactsList $contactsList
     *
     * @return Contact
     */
    public function setContactsList($contactsList = null)
    {
        $this->contactsList = $contactsList;

        return $this;
    }

    /**
     * Get contactsList
     *
     * @return App\Entity\contactsList
     */
    public function getContactsList()
    {
        return $this->contactsList;
    }

}