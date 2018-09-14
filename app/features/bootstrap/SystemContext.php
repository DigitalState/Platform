<?php

use Behat\Behat\Context\Context;
use Sanpi\Behatch\HttpCall\Request;

/**
 * Class SystemContext
 */
class SystemContext implements Context
{
    /**
     * @var \Sanpi\Behatch\HttpCall\Request
     */
    protected $request;

    /**
     * Constructor
     *
     * @param \Sanpi\Behatch\HttpCall\Request $request
     */
    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    /**
     * Set authorization header
     *
     * @Given I am authenticated as the :username user
     * @param string $username
     */
    public function iAmAuthenticatedAsTheUser($username)
    {
        $users = ['system' => 'system'];
        $this->request->setHttpHeader('Authorization', 'Basic '.base64_encode($username.':'.$users[$username]));
    }
}
