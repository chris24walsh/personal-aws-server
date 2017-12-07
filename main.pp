include git

git::repo{'spacehorse':
	path => '/var/www/spacehorse',
	source => 'git://github.com/chris24walsh/spacehorse2.0',
}

class { 'apache': 
	default_vhost => false,
}

apache::vhost { 'spacehorse.chriswalsh.tk':
  port    => '80',
  docroot => '/var/www/spacehorse',
}

