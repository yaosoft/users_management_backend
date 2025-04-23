<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

#[ORM\Table(name: "project_status")]
#[ORM\Entity]
class ProjectStatus
{

	public function __toString() {
		return $this->title;
    } 

    #[ORM\Column(name: "id", type: "integer", nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "IDENTITY")]
    public $id;

    #[ORM\Column(type: "string", length: 250, nullable: false)]
    public $title;

    #[ORM\Column(type: "string", length: 250, nullable: false)]
    public $description;

	#[OneToMany(targetEntity: ProjectUserStatus::class, mappedBy: "projectStatus")]
	private $projectProjectUserStatus;

    public function __construct()
    {
		$this->projectProjectUserStatus 	= new ArrayCollection();
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
     * Add projectProjectUserStatus
     *
     * @param App\Entity\Project $projectProjectUserStatus
     *
     * @return projectProjectUserStatus
     */
    public function projectProjectUserStatus($projectProjectUserStatus)
    {
        $this->projectProjectUserStatus = $projectProjectUserStatus;

        return $this;
    }

    /**
     * Remove projectProjectUserStatus
     *
     * @param App\Entity\Project $projectProjectUserStatus
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