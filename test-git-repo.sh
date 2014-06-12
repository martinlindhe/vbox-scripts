#!/bin/bash
#
# tells each vm to do a git checkout of specified repo and run "make test" in checkout root, and fetch results


# TODO run on all vm:s, collect result


# STATUS: 5-lenny FAIL- composer requires php 5.3.2, lenny has php 5.2.6

# STATUS: 6-squeeze ?  FAIL 1) Core\Password\BcryptTest::testGenerate Failed asserting that 0 matches expected 60.
#         				+ same header prob as wheezy

# STATUS: 7-wheezy ?  FAIL  1) Writer\DocumentXhtmlTest::testHttpHeaders		content-type is set 4 times instead of 1 ?!??!
#							2) Writer\HttpHeaderTest::testNoCache
#							3) Writer\Spreadsheet\CsvTest::testHttpHeaders
#							4) Writer\Spreadsheet\PdfTest::testHttpHeaders

# STATUS: sid 	- OK


ssh ml@squeeze.vm << EOF

# required components:
# sudo apt-get install php5-curl php5-xdebug php5-gd

mkdir -p git-trees
cd git-trees

if [ ! -d "core3" ]; then
	git clone https://github.com/martinlindhe/core3.git
	cd core3
else
	cd core3
	git pull
fi

if [ ! -f "composer.phar" ]
then
	make install-composer
fi


make update-deps

make test

EOF
