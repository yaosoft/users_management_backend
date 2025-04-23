<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

#[ORM\Table(name: "profile")]
#[ORM\Entity]
class Profile
{
    #[ORM\Column(name: "id", type: "integer", nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "IDENTITY")]
    public $id;

	
    #[ORM\Column(type: "string", nullable: true)]
    public $fullname;

    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: "userProfile")]
	#[ORM\JoinColumn(name: "user_id", referencedColumnName: "id", nullable: true)]
	public $user;

    #[ORM\Column(type: "string", nullable: true)]
    public $city;

    #[ORM\Column(type: "string", nullable: true)]
    public $country;

    #[ORM\Column(type: "string", nullable: true)]
    public $state;

    #[ORM\Column(type: "string", nullable: true)]
    public $phone;

    #[ORM\Column(type: "string", nullable: true)]
    public $picture;

    #[ORM\Column(type: "string", nullable: true)]
    public $pictureSize;

    #[ORM\ManyToOne(targetEntity: Occupation::class, inversedBy: "occupationProfile")]
	#[ORM\JoinColumn(name: "occupation_id", referencedColumnName: "id", nullable: true)]
	public $occupation;

    #[ORM\Column(type: "text", length: 50000, nullable: true)]
    public $biography;


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
     * Set fullname
     *
     * @param string $fullname
     * @return string
     */
    public function setFullname($fullname)
    {
        $this->fullname = $fullname;

        return $this;
    }

    /**
     * Get fullname
     *
     * @return string 
     */
    public function getFullname()
    {
        return $this->fullname;
    }


    /**
     * Set city
     *
     * @param string $city
     * @return string
     */
    public function setCity($city)
    {
        $this->city = $city;

        return $this;
    }

    /**
     * Get city
     *
     * @return string 
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * Set profileOccupation
     *
     * @param string $profileOccupation
     * @return string
     */
    public function setProfileOccupation($profileOccupation)
    {
        $this->profileOccupation = $profileOccupation;

        return $this;
    }

    /**
     * Get profileOccupation
     *
     * @return string 
     */
    public function getProfileOccupation()
    {
        return $this->profileOccupation;
    }


    /**
     * Set country
     *
     * @param string $country
     * @return string
     */
    public function setCountry($country)
    {
        $this->country = $country;

        return $this;
    }

    /**
     * Get country
     *
     * @return string 
     */
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * Set state
     *
     * @param string $state
     * @return string
     */
    public function setState($state)
    {
        $this->state = $state;

        return $this;
    }

    /**
     * Get state
     *
     * @return string 
     */
    public function getState()
    {
        return $this->state;
    }

    /**
     * Set phone
     *
     * @param string $phone
     * @return string
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * Get phone
     *
     * @return string 
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * Set picture
     *
     * @param string $picture
     * @return string
     */
    public function setPicture($picture)
    {
        $this->picture = $picture;

        return $this;
    }

    /**
     * Get picture
     *
     * @return string 
     */
    public function getPicture()
    {
        return $this->picture;
    }

    /**
     * Set pictureSize
     *
     * @param string $pictureSize
     * @return string
     */
    public function setPictureSize($pictureSize)
    {
        $this->pictureSize = $pictureSize;

        return $this;
    }

    /**
     * Get pictureSize
     *
     * @return string 
     */
    public function getPictureSize()
    {
        return $this->pictureSize;
    }

	/**
     * Set occupation
     *
     * @param string $occupation
     * @return string
     */
    public function setOccupation($occupation)
    {
        $this->occupation = $occupation;

        return $this;
    }

    /**
     * Get occupation
     *
     * @return string 
     */
    public function getOccupation()
    {
        return $this->occupation;
    }
	

	/**
     * Set biography
     *
     * @param string $biography
     * @return string
     */
    public function setBiography($biography)
    {
        $this->biography = $biography;

        return $this;
    }

    /**
     * Get biography
     *
     * @return string 
     */
    public function getBiography()
    {
        return $this->biography;
    }

}