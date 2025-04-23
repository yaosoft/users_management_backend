<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

#[ORM\Table(name: "message")]
#[ORM\Entity]
class Message
{
    #[ORM\Column(name: "id", type: "integer", nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "IDENTITY")]
    public $id;

    #[ORM\Column(type: "text", length: 60000, nullable: false)]
    public $message;

    #[ORM\Column(type: "boolean", nullable: false)]
    public $viewed;

    #[ORM\Column(type: "datetime")]
    public $dateCreated;

    /** Many Messages has One User. */
	#[ORM\ManyToOne(targetEntity: User::class, inversedBy: "userMessage")]
	#[ORM\JoinColumn(name:"user_id", referencedColumnName:"id", nullable: false)]
	public $user;

    /** Many Messages has One User. */
	#[ORM\ManyToOne(targetEntity: User::class, inversedBy: "userMessage")]
	#[ORM\JoinColumn(name:"receiver_id", referencedColumnName:"id", nullable: false)]
	public $receiver;

    /** Many Messages has One Project. */
	#[ORM\ManyToOne(targetEntity: Project::class, inversedBy: "projectMessage")]
	#[ORM\JoinColumn(name: "project_id", referencedColumnName: "id", nullable: false)]
	public $project;

    public function __construct()
    {
        // parent::__construct();
        // your own logic
		$this->dateCreated = new \DateTime(); 
    }
	
	/**
     * Set user
     *
     * @param App\Entity\User $user
     *
     * @return Ads
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
     * Set receiver
     *
     * @param App\Entity\User $receiver
     *
     * @return Message
     */
    public function setReceiver($receiver = null)
    {
        $this->receiver = $receiver;

        return $this;
    }

    /**
     * Get receiver
     *
     * @return App\Entity\User
     */
    public function getReceiver()
    {
        return $this->receiver;
    }

	/**
     * Set project
     *
     * @param App\Entity\Project $project
     *
     * @return Ads
     */
    public function setProject($project = null)
    {
        $this->project = $project;

        return $this;
    }

    /**
     * Get project
     *
     * @return App\Entity\project
     */
    public function getProject()
    {
        return $this->project;
    }
	
    /**
     * Set dateCreated
     *
     * @param string $dateCreated
     * @return string
     */
    public function setDateCreated($dateCreated)
    {
        $this->dateCreated = $dateCreated;

        return $this;
    }

    /**
     * Get dateCreated
     *
     * @return string 
     */
    public function getDateCreated()
    {
        return $this->dateCreated;
    }
	
	/**
     * Set viewed
     *
     * @param string $viewed
     * @return string
     */
    public function setViewed($viewed)
    {
        $this->viewed = $viewed;

        return $this;
    }

    /**
     * Get viewed
     *
     * @return string 
     */
    public function getViewed()
    {
        return $this->viewed;
    }

	/**
     * Set message
     *
     * @param string $message
     * @return string
     */
    public function setMessage($message)
    {
        $this->message = $message;

        return $this;
    }

    /**
     * Get message
     *
     * @return string 
     */
    public function getMessage()
    {
        return $this->message;
    }
}