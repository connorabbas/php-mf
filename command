#!/usr/bin/env php
<?php
// Basic CLI actions for PHP Mini Framework

function createController($name)
{
    $controllerFile = fopen("app/controllers/".$name.".php", "w") or die("Unable to open file!");
    $content = "";
    $content .= "<?php";
    $content .= "\n";
    $content .= "class ".$name." extends SiteController";
    $content .= "\n";
    $content .= "{";
    $content .= "\n";
    $content .= "    protected \$db;";
    $content .= "\n";
    $content .= "\n";
    $content .= "    public function __construct(\$db)";
    $content .= "\n";
    $content .= "    {";
    $content .= "\n";
    $content .= "        \$this->db = \$db;";
    $content .= "\n";
    $content .= "    }";
    $content .= "\n";
    $content .= "\n";
    $content .= "    public function index()";
    $content .= "\n";
    $content .= "    {";
    $content .= "\n";
    $content .= "    }";
    $content .= "\n";
    $content .= "}";

    // Write to the file
    fwrite($controllerFile, $content);
    fclose($controllerFile);

    // Output Success
    print_r("app/controllers/".$name.".php created.");
}

function createModel($name)
{
    $modelFile = fopen("app/models/".$name.".php", "w") or die("Unable to open file!");
    $content = "";
    $content .= "<?php";
    $content .= "\n";
    $content .= "class ".$name;
    $content .= "\n";
    $content .= "{";
    $content .= "\n";
    $content .= "    protected \$db;";
    $content .= "\n";
    $content .= "\n";
    $content .= "    public function __construct(\$db)";
    $content .= "\n";
    $content .= "    {";
    $content .= "\n";
    $content .= "        \$this->db = \$db;";
    $content .= "\n";
    $content .= "    }";
    $content .= "\n";
    $content .= "\n";
    $content .= "    public function modelFunction()";
    $content .= "\n";
    $content .= "    {";
    $content .= "\n";
    $content .= "    }";
    $content .= "\n";
    $content .= "}";

    // Write to the file
    fwrite($modelFile, $content);
    fclose($modelFile);

    // Output Success
    print_r("app/models/".$name.".php created.");
}

//print_r($argc); // number or arguments
//print_r($argv);
$command = $argv[1];

// Create a certain file type
if (strpos($command, 'make:') !== false && isset($argv[2])) {
    $commandParts = explode(':', $command);
    $makeThis = $commandParts[1];

    // Create a controller
    if ($makeThis == 'controller') {
        $controllerName = $argv[2];
        createController($controllerName);
    }

    // Create a model
    if ($makeThis == 'model') {
        $modelName = $argv[2];
        createModel($modelName);
    }

}

echo "\n";
die();