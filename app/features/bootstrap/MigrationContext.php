<?php

use Behat\Behat\Context\Context;

/**
 * Class MigrationContext
 */
class MigrationContext implements Context
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
     * Up migrations
     *
     * @BeforeSuite
     */
    public function upMigrations()
    {
        foreach ($this->services as $service) {
            shell_exec('cd /srv/'.$service.' && docker-compose exec -T php php bin/console doctrine:migrations:migrate --env=test --no-interaction');
        }
    }

    /**
     * Down migrations
     *
     * @AfterSuite
     */
    public function downMigrations()
    {
        foreach ($this->services as $service) {
            shell_exec('cd /srv/'.$service.' && docker-compose exec -T php bin/console doctrine:migrations:migrate --env=test --no-interaction first');
        }
    }
}
