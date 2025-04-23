<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

#[ORM\Table(name: "project")]
#[ORM\Entity]
class Project
{
    #[ORM\Column(name: "id", type: "integer", nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "IDENTITY")]
    public $id;

    #[ORM\Column(type: "string", length: 250, nullable: false)]
    public $title;

    #[ORM\Column(type: "datetime")]
    public $dateCreated;

    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: "userProject")]
	#[ORM\JoinColumn(name: "user_id", referencedColumnName: "id", nullable: false)]
	public $user;

    #[ORM\Column(type: "string", length: 20, nullable: true)]
    public $budget;

    #[ORM\ManyToOne(targetEntity: ProjectDuration::class, inversedBy: "ProjectType")]
	#[ORM\JoinColumn(name: "ProjectDuration_id", referencedColumnName: "id", nullable: true)]
	public $projectDuration;

	#[OneToMany(targetEntity: ChatMessage::class, mappedBy: "project")]
	public $projectChatMessage;

	#[OneToMany(targetEntity: ProjectFile::class, mappedBy: "project")]
	public $projectFile;

	#[OneToMany(targetEntity: ProjectUserStatus::class, mappedBy: "project")]
	public $projectProjectUserStatus;

    #[ORM\ManyToOne(targetEntity: ProjectType::class, inversedBy: "ProjectType")]
	#[ORM\JoinColumn(name: "ProjectType_id", referencedColumnName: "id", nullable: true)]
	public $projectType;

    #[ORM\ManyToOne(targetEntity: ProjectCategory::class, inversedBy: "ProjectCategory")]
	#[ORM\JoinColumn(name: "ProjectCategory_id", referencedColumnName: "id", nullable: true)]
	public $projectCategory;

    #[ORM\Column(type: "text", length: 50000, nullable: false)]
    public $description;
	
    #[ORM\Column(type: "boolean", nullable: false)]
    public $draft;


    public function __construct()
    {
        // parent::__construct();
        // your own logic
		$this->dateCreated 			= new \DateTime();
		$this->projectChatMessage 	= new ArrayCollection();
		$this->projectFile 			= new ArrayCollection();
		$this->projectProjectUserStatus = new ArrayCollection();
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
     * Set status
     *
     * @param string $status
     * @return string
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status
     *
     * @return string 
     */
    public function getStatus()
    {
        return $this->status;
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
     * Set draft
     *
     * @param string $draft
     * @return string
     */
    public function setDraft($draft)
    {
        $this->draft = $draft;

        return $this;
    }

    /**
     * Get draft
     *
     * @return string 
     */
    public function getDraft()
    {
        return $this->draft;
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
     * Set budget
     *
     * @param string $budget
     * @return string
     */
    public function setBudget($budget)
    {
        $this->budget = $budget;

        return $this;
    }

    /**
     * Get budget
     *
     * @return string 
     */
    public function getBudget()
    {
        return $this->budget;
    }

    /**
     * Set projectDuration
     *
     * @param string $projectDuration
     * @return string
     */
    public function setProjectDuration($projectDuration)
    {
        $this->projectDuration = $projectDuration;

        return $this;
    }

    /**
     * Get projectDuration
     *
     * @return string 
     */
    public function getProjectDuration()
    {
        return $this->projectDuration;
    }
	
    /**
     * Set multi
     *
     * @param string $multi
     * @return string
     */
    public function setMulti($multi)
    {
        $this->multi = $multi;

        return $this;
    }

    /**
     * Get multi
     *
     * @return string 
     */
    public function getMulti()
    {
        return $this->multi;
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
     * Set manager
     *
     * @param App\Entity\Manager $manager
     *
     * @return Project
     */
    public function setManager($manager = null)
    {
        $this->manager = $manager;

        return $this;
    }

    /**
     * Get manager
     *
     * @return App\Entity\manager
     */
    public function getManager()
    {
        return $this->manager;
    }
	
	/**
     * Add projectChatMessage
     *
     * @param App\Entity\ChatMessage $projectChatMessage
     *
     * @return projectChatMessage
     */
    public function projectChatMessage($projectChatMessage)
    {
        $this->projectChatMessage = $projectChatMessage;

        return $this;
    }

    /**
     * Remove projectChatMessage
     *
     * @param App\Entity\ChatMessage $projectChatMessage
     */
    public function removeProjectChatMessage($projectChatMessage)
    {
        $this->projectChatMessage->removeElement($projectChatMessage);
    }

    /**
     * Get projectChatMessage
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProjectChatMessage()
    {
        return $this->projectChatMessage;
    }

	/**
     * Add projectFile
     *
     * @param App\Entity\ProjectFile $projectFile
     *
     * @return projectFile
     */
    public function addProjectFile($projectFile)
    {
        $this->projectFile = $projectFile;

        return $this;
    }

    /**
     * Remove projectFile
     *
     * @param App\Entity\ProjectFile $projectFile
     */
    public function removeProjectFile($projectFile)
    {
        $this->projectFile->removeElement($projectFile);
    }

    /**
     * Get projectFile
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProjectFile()
    {
        return $this->projectFile;
    }


    /**
     * Get projectType
     *
     * @return App\Entity\projectType
     */
    public function getProjectType()
    {
        return $this->projectType;
    }
	/**
     * Set projectType
     *
     * @param App\Entity\ProjectType $projectType
     *
     * @return Project
     */
    public function setProjectType($projectType = null)
    {
        $this->projectType = $projectType;

        return $this;
    }

    /**
     * Get projectCategory
     *
     * @return App\Entity\projectCategory
     */
    public function getProjectCategory()
    {
        return $this->projectCategory;
    }
	/**
     * Set projectCategory
     *
     * @param App\Entity\ProjectCategory $projectCategory
     *
     * @return Project
     */
    public function setProjectCategory($projectCategory = null)
    {
        $this->projectCategory = $projectCategory;

        return $this;
    }

    /**
     * Set projectFileProject
     *
     * @param string $projectFileProject
     * @return string
     */
    public function setPath($projectFileProject)
    {
        $this->projectFileProject = $projectFileProject;

        return $this;
    }

    /**
     * Get projectFileProject
     *
     * @return string 
     */
    public function getPath()
    {
        return $this->projectFileProject;
    }


	/**
     * Add projectProjectUserStatus
     *
     * @param App\Entity\ChatMessage $projectProjectUserStatus
     *
     * @return projectProjectUserStatus
     */
    public function addProjectProjectUserStatus($projectProjectUserStatus)
    {
        $this->projectProjectUserStatus = $projectProjectUserStatus;

        return $this;
    }

    /**
     * Remove projectProjectUserStatus
     *
     * @param App\Entity\ChatMessage $projectProjectUserStatus
     */
    public function removeProjectProjectUserStatus($projectProjectUserStatus)
    {
        $this->projectProjectUserStatus->removeElement($projectProjectUserStatus);
    }

    /**
     * Get projectProjectUserStatus
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProjectProjectUserStatus()
    {
        return $this->projectProjectUserStatus;
    }

}