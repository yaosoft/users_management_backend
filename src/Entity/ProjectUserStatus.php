<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

#[ORM\Table(name: "project_user_status")]
#[ORM\Entity]
class ProjectUserStatus
{

    #[ORM\Column(name: "id", type: "integer", nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "IDENTITY")]
    public $id;


    #[ORM\Column(type: "datetime")]
    public $dateCreated;

    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: "userProjectUserStatus")]
	#[ORM\JoinColumn(name: "user_id", referencedColumnName: "id", nullable: true)]
	public $user;


	#[ORM\Column(type: "text", length: 60000, nullable: false)]
	public $email;

    #[ORM\ManyToOne(targetEntity: ProjectStatus::class, inversedBy: "projectProjectUserStatus")]
	#[ORM\JoinColumn(name: "status_id", referencedColumnName: "id", nullable: true)]
	private $projectStatus;

    #[ORM\ManyToOne(targetEntity: Project::class, inversedBy: "projectProjectUserStatus")]
	#[ORM\JoinColumn(name: "project_id", referencedColumnName: "id", nullable: true)]
	public $project;

    public function __construct()
    {
		$this->dateCreated 	= new \DateTime();
    }


	/**
     * Set user
     *
     * @param string $user
     * @return string
     */
    public function setUser($user)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return string 
     */
    public function getUser()
    {
        return $this->user;
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
     * Set projectStatus
     *
     * @param string $projectStatus
     * @return string
     */
    public function setProjectStatus($projectStatus)
    {
        $this->projectStatus = $projectStatus;

        return $this;
    }

    /**
     * Get projectStatus
     *
     * @return string 
     */
    public function getProjectStatus()
    {
        return $this->projectStatus;
    }

	/**
     * Set project
     *
     * @param string $project
     * @return string
     */
    public function setProject($project)
    {
        $this->project = $project;

        return $this;
    }

    /**
     * Get project
     *
     * @return string 
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
	
}