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
    static private $services = [
        'assets',
        'authentication',
        'cases',
        'cms',
        'forms',
        'identities',
        'records',
        'services',
        'tasks',
        'tenants'
    ];

    /**
     * @BeforeFeature
     */
    public static function loadFixtures()
    {
        foreach (static::$services as $service) {
            shell_exec('cd /srv/'.$service.' && docker-compose exec -T -e FIXTURES=test php php bin/console doctrine:fixtures:load --env=test --no-interaction');
        }
    }
}
