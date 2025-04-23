<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

#[ORM\Table(name: "contactsList")]
#[ORM\Entity]
class ContactsList
{
    #[ORM\Column(name: "id", type: "integer", nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "IDENTITY")]
    public $id;

    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: "userContactsList")]
	#[ORM\JoinColumn(name: "user_id", referencedColumnName: "id", nullable: false)]
	public $user;

    #[ORM\Column(type: "text", length: 150, nullable: false)]
    public $title;

    #[ORM\Column(type: "text", length: 500, nullable: false)]
    public $description;

    #[ORM\Column(type: "datetime")]
    public $dateCreated;

	#[OneToMany(targetEntity: Contact::class, mappedBy: "contactsList")]
	private $contactsListContact;

    public function __construct()
    {
		$this->dateCreated 			= new \DateTime();
		$this->contactsListContact 	= new ArrayCollection();
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
     * Set title
     *
     * @param string $title
     * @return string
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string 
     */
    public function getTitle()
    {
        return $this->title;
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
     * Set user
     *
     * @param App\Entity\User $user
     *
     * @return Project
     */
    public function setUser($user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return App\Entity\user
     */
    public function getUser()
    {
        return $this->user;
    }


	/**
     * Add contactsListContact
     *
     * @param App\Entity\Contact $contactsListContact
     *
     * @return contactsListContact
     */
    public function contactsListContact($contactsListContact)
    {
        $this->contactsListContact = $contactsListContact;

        return $this;
    }

    /**
     * Remove contactsListContact
     *
     * @param App\Entity\Contact $contactsListContact
     */
    public function removeContactsListContact($contactsListContact)
    {
        $this->contactsListContact->removeElement($contactsListContact);
    }

    /**
     * Get contactsListContact
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getContactsListContact()
    {
        return $this->contactsListContact;
    }

}