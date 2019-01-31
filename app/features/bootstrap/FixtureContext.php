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
     * @BeforeFeature
     */
    public function loadFixtures()
    {
        foreach ($this->services as $service) {
            shell_exec('cd /srv/'.$service.' && docker-compose exec -T -e FIXTURES=test php php bin/console doctrine:fixtures:load --env=test --no-interaction');
        }
    }
}
