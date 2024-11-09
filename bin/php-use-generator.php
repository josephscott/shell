#!/usr/bin/env php
<?php

if (count($argv) !== 2) {
    echo "Usage: php-use-generator.php <file>\n";
    exit(1);
}

$inputFile = $argv[1];
if (!file_exists($inputFile)) {
    echo "Error: File not found: {$inputFile}\n";
    exit(1);
}

// Read and parse the file
$code = file_get_contents($inputFile);
$tokens = token_get_all($code);

// Track what we find
$namespace = null;
$useStatements = [];
$functions = [];
$constants = [];
$classes = [];

// Get list of all PHP internal functions
$internalFunctions = get_defined_functions()['internal'];
// Get list of all PHP internal constants
$internalConstants = array_keys(get_defined_constants());
// Get list of all PHP internal classes
$internalClasses = get_declared_classes();

foreach ($tokens as $index => $token) {
    if (!is_array($token)) {
        continue;
    }

    // Find namespace
    if ($token[0] === T_NAMESPACE) {
        $namespace = '';
        $i = $index + 1;
        while (isset($tokens[$i])) {
            if ($tokens[$i][0] === T_STRING || $tokens[$i][0] === T_NS_SEPARATOR) {
                $namespace .= $tokens[$i][1];
            } elseif ($tokens[$i] === ';') {
                break;
            }
            $i++;
        }
    }

    // Skip if we're in a namespace declaration
    if ($token[0] === T_NAMESPACE) {
        continue;
    }

    // Check for function calls
    if ($token[0] === T_STRING || $token[0] === T_NS_SEPARATOR) {
        $name = '';
        $i = $index;
        $hasLeadingSlash = false;
        
        // Check for leading slash
        if ($token[0] === T_NS_SEPARATOR) {
            $hasLeadingSlash = true;
            $i++; // Move to the next token after the separator
        }
        
        // Collect the full name
        while (isset($tokens[$i]) && is_array($tokens[$i]) && 
              ($tokens[$i][0] === T_STRING || $tokens[$i][0] === T_NS_SEPARATOR)) {
            if ($tokens[$i][0] === T_STRING) {
                $name .= $tokens[$i][1];
            }
            $i++;
        }
        
        // Skip if empty
        if (empty($name)) {
            continue;
        }

        // Check if it's a function call by looking for opening parenthesis
        $nextToken = $tokens[$i] ?? null;
        if ($nextToken === '(') {
            // For functions with leading slash, we definitely want to include them
            if ($hasLeadingSlash) {
                $functions[] = $name;
            } elseif (in_array(strtolower($name), $internalFunctions)) {
                $functions[] = $name;
            }
        }
        // Check if it's a class reference
        elseif (in_array($name, $internalClasses)) {
            $classes[] = $name;
        }
        // Check if it's a constant
        elseif (in_array($name, $internalConstants)) {
            $constants[] = $name;
        }
    }
}

// Remove duplicates
$functions = array_unique($functions);
$constants = array_unique($constants);
$classes = array_unique($classes);

// Generate use statements
sort($functions);
sort($constants);
sort($classes);

echo "// Generated use statements:\n";
// Constants first
foreach ($constants as $constant) {
    echo "use const {$constant};\n";
}

// Add blank line if there are constants AND (functions OR classes)
if (!empty($constants) && (!empty($functions) || !empty($classes))) {
    echo "\n";
}

// Functions
foreach ($functions as $function) {
    echo "use function {$function};\n";
}

// Add blank line if there are functions AND classes
if (!empty($functions) && !empty($classes)) {
    echo "\n";
}

// Classes
foreach ($classes as $class) {
    echo "use {$class};\n";
}
