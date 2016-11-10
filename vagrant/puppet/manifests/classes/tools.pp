class general_tools {

    package { ["wget", "curl", "vim", "git", "postfix", "glances", "htop", "nmon", "apache2-utils", "nfs-common", "portmap", "unzip"]:
        ensure    => latest,
    }

}


class php_tools {

    # Set auto discover to true
    exec { 'set_auto_discovery':
        command => '/usr/bin/pear config-set auto_discover 1',
    }

    exec { 'install_phpunit':
        creates => "/usr/bin/phpunit",
        command => '/usr/bin/pear install --alldeps pear.phpunit.de/PHPUnit',
        require => Exec['set_auto_discovery'],
    }

    exec { 'install_composer':
        creates => "/usr/bin/composer",
        command => '/usr/bin/curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin',
    }

}


class frontend_tools {

    package { ["ruby", "ruby-dev"]:
        ensure    => latest,
    }

    package { 'compass':
        ensure    => 'installed',
        provider  => 'gem',
        require => Package['ruby-dev'],
    }

    exec { 'install_npm':
        command => 'apt-add-repository ppa:chris-lea/node.js && apt-get update && apt-get install -y nodejs',
        creates => '/usr/bin/node'
    }

    exec { 'install_grunt_cli':
        command => 'npm install -g grunt-cli',
        creates => '/usr/local/bin/grunt',
        require => Exec['install_npm'],
    }

}


class bdd_tools {

    package { ["phantomjs", "xvfb"]:
        ensure    => latest,
    }

    exec { 'install_firefox':
        command => 'apt-add-repository -y ppa:mozillateam && apt-get update > /dev/null 2>&1 || true && apt-get install -y firefox',
        returns => [0],
        creates => '/usr/bin/firefox',
        user	=> root
    }
}
