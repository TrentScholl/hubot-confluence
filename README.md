# hubot-confluence

Hubot script for accessing Confluence

[![Build Status](https://travis-ci.org/TrentScholl/hubot-confluence.svg?branch=master)](https://travis-ci.org/TrentScholl/hubot-confluence)

## Configuration

* HUBOT\_CONFLUENCE\_URL - URL for Confluence installation (no trailing slash)
* HUBOT\_CONFLUENCE\_USER - Username to access Confluence
* HUBOT\_CONFLUENCE\_PASSWORD - Password for the Confluence user
* HUBOT\_CONFLUENCE\_MAX\_RESULTS - Maximum number of results to return (default is 5)

## Searching Confluence

> hubot find *term*

Will show the search results for *term*, where *term* is what you're searching for.