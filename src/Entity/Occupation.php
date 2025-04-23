<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

#[ORM\Table(name: "occupation")]
#[ORM\Entity]
class Occupation
{
    #[ORM\Column(name: "id", type: "integer", nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "IDENTITY")]
    public $id;

    #[ORM\Column(type: "text", nullable: false)]
    public $name;


	#[OneToMany(targetEntity: Profile::class, mappedBy: "occupation")]
	private $occupationProfile;


    public function __construct()
    {
        // parent::__construct();
		$this->profile				= new ArrayCollection();
		$this->occupationProfile	= new ArrayCollection();
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
     * Add occupationOccupationProfile
     *
     * @param App\Entity\ChatFile $occupationOccupationProfile
     *
     * @return occupationOccupationProfile
     */
    public function addOccupationProfile($occupationOccupationProfile)
    {
        $this->occupationOccupationProfile = $occupationOccupationProfile;

        return $this;
    }

    /**
     * Remove occupationOccupationProfile
     *
     * @param App\Entity\ChatFile $occupationOccupationProfile
     */
    public function removeOccupationProfile($occupationOccupationProfile)
    {
        $this->occupationOccupationProfile->removeElement($occupationOccupationProfile);
    }

    /**
     * Get occupationOccupationProfile
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getOccupationProfile()
    {
        return $this->occupationOccupationProfile;
    }
}