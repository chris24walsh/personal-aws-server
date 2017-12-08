class { 'apache': 
	default_vhost => false,
}

apache::vhost { 'spacehorse.chriswalsh.tk':
  port    => '80',
  docroot => '/var/www/spacehorse',
}

package {'git':
 ensure => latest,
}

vcsrepo { '/var/www/spacehorse':
	ensure => present,
	provider => git,
	source => 'git://github.com/chris24walsh/spacehorse2.0.git',
}
