# Update hosts file
class update_hosts {
    file { "/etc/hosts":
        source => "/vagrant/vagrant/config/system/hosts"
    }
}

class copy_user_files {

	exec { 'copy_dot_files':
	    command => 'cp /vagrant/vagrant/config/dotfiles/.??* /home/vagrant',
	    creates => '/home/vagrant/.bash_profile',
	}
	
	file { 'mail_config':
	    path         => '/etc/php5/apache2/conf.d/mailconfig.ini',
	    source       => '/vagrant/vagrant/config/php/mailconfig.ini',
	    require => [
	        Package['postfix'],
	    ]    
	}
	
	file { "/home/vagrant/.ssh":
	  mode => 700,
	  recurse => true,
	}
}

