<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;

/**
 * Class FileSystemContext
 */
class FileSystemContext implements Context
{
    /**
     * @var string
     */
    protected $output;

    /**
     * @Given I am in a directory :directory
     * @param string $directory
     * @throws \Exception
     */
    public function iAmInADirectory($directory)
    {
        if (!is_dir($directory)) {
            throw new Exception('Directory does not exist.');
        }

        chdir($directory);
    }

    /**
     * @When I run :command
     * @param string $command
     * @throws \Exception
     */
    public function iRun($command)
    {
        exec($command, $output, $status);

        if (0 !== $status) {
            throw new Exception('Command did not execute successfully.');
        }

        $this->output = $output;
    }

    /**
     * @Then I should get:
     * @param \Behat\Gherkin\Node\PyStringNode $string
     * @throws \Exception
     */
    public function iShouldGet(PyStringNode $string)
    {var_dump(implode("\n", $this->output));var_dump((string) $string);
        if (implode("\n", $this->output) !== (string) $string) {
            throw new Exception('Command output does not match expected output.');
        }
    }
}
