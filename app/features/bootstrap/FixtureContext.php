<?php

use Behat\Behat\Context\Context;

/**
 * Class FixtureContext
 */
class FixtureContext implements Context
{
    /**
     * @var array
     */
    protected $services;

    /**
     * Constructor
     *
     * @param array $services
     */
    public function __construct(array $services = [])
    {
        $this->services = $services;
    }

    /**
     * @BeforeScenario @loadFixtures
     */
    public function loadFixtures()
    {
        foreach ($this->services as $service) {
            shell_exec('cd /srv/'.$service.' && docker-compose exec -T php php bin/console doctrine:fixtures:load --env=test --fixtures=/srv/api-platform/src/AppBundle/Fixtures --no-interaction');
        }
    }
}
