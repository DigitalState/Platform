<?php

use Behat\Behat\Context\Context;

/**
 * Class MigrationContext
 */
final class MigrationContext implements Context
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
     * Up migrations
     *
     * @BeforeSuite
     */
    public static function upMigrations()
    {
        foreach (static::$services as $service) {
            shell_exec('cd /srv/'.$service.' && docker-compose exec -T php php bin/console doctrine:migrations:migrate --no-interaction');
        }
    }

    /**
     * Down migrations
     *
     * @AfterSuite
     */
    public static function downMigrations()
    {
        foreach (static::$services as $service) {
            shell_exec('cd /srv/'.$service.' && docker-compose exec -T php bin/console doctrine:migrations:migrate --env=test --no-interaction first');
        }
    }
}
